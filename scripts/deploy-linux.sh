#!/bin/bash
# ============================================
# 方案 A：Linux 服务器一键部署脚本
# ============================================
#
# 用法:
#   ./deploy-linux.sh                    # 默认使用 nip.io
#   ./deploy-linux.sh --domain example.com    # 使用自定义域名
#   ./deploy-linux.sh --domain example.com --https  # 自定义域名 + HTTPS (Caddy)
#   ./deploy-linux.sh --tunnel           # 使用 Cloudflare Tunnel
#
# ============================================

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# 默认配置
CUSTOM_DOMAIN=""
USE_HTTPS=false
USE_TUNNEL=false
PROJECT_DIR="/opt/qhfz_web"
APP_USER="qhfz"

# 解析命令行参数
while [[ $# -gt 0 ]]; do
    case $1 in
        --domain)
            CUSTOM_DOMAIN="$2"
            shift 2
            ;;
        --https)
            USE_HTTPS=true
            shift
            ;;
        --tunnel)
            USE_TUNNEL=true
            shift
            ;;
        --help|-h)
            echo "用法: $0 [选项]"
            echo ""
            echo "选项:"
            echo "  --domain <域名>    使用自定义域名（默认使用 nip.io）"
            echo "  --https            启用 HTTPS（需要自定义域名，使用 Caddy）"
            echo "  --tunnel           使用 Cloudflare Tunnel（自动 HTTPS）"
            echo "  --help, -h         显示帮助信息"
            echo ""
            echo "示例:"
            echo "  $0                              # 快速部署，使用 IP.nip.io"
            echo "  $0 --domain blog.example.com   # 使用自定义域名"
            echo "  $0 --domain blog.example.com --https  # 自定义域名 + HTTPS"
            echo "  $0 --tunnel                    # 使用 Cloudflare Tunnel"
            exit 0
            ;;
        *)
            echo -e "${RED}未知选项: $1${NC}"
            echo "使用 --help 查看帮助"
            exit 1
            ;;
    esac
done

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  一键部署脚本${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

# 检测服务器 IP
SERVER_IP=$(curl -s ifconfig.me 2>/dev/null || curl -s ip.sb 2>/dev/null || hostname -I | awk '{print $1}')

# 确定使用的域名
if [ -n "$CUSTOM_DOMAIN" ]; then
    DOMAIN="$CUSTOM_DOMAIN"
    echo -e "${YELLOW}使用自定义域名: ${DOMAIN}${NC}"
else
    DOMAIN="${SERVER_IP}.nip.io"
    echo -e "${YELLOW}检测到服务器 IP: ${SERVER_IP}${NC}"
    echo -e "${YELLOW}将使用域名: ${DOMAIN}${NC}"
fi

if [ "$USE_HTTPS" = true ]; then
    PROTOCOL="https"
    echo -e "${YELLOW}将启用 HTTPS（使用 Caddy）${NC}"
else
    PROTOCOL="http"
fi

if [ "$USE_TUNNEL" = true ]; then
    echo -e "${YELLOW}将使用 Cloudflare Tunnel${NC}"
fi

echo ""

# ============================================
# 1. 安装系统依赖
# ============================================
echo -e "${GREEN}[1/7] 安装系统依赖...${NC}"

if command -v apt-get &> /dev/null; then
    sudo apt-get update -qq
    sudo apt-get install -y -qq python3 python3-pip python3-venv git curl wget
elif command -v yum &> /dev/null; then
    sudo yum install -y python3 python3-pip git curl wget
fi

# 安装 Hugo
if ! command -v hugo &> /dev/null; then
    echo "  安装 Hugo..."
    HUGO_VERSION="0.121.0"
    ARCH=$(uname -m)
    case $ARCH in
        x86_64) HUGO_ARCH="linux-amd64" ;;
        aarch64|arm64) HUGO_ARCH="linux-arm64" ;;
        *) echo -e "${RED}不支持的架构: $ARCH${NC}"; exit 1 ;;
    esac
    wget -qO- "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz" | sudo tar xz -C /usr/local/bin hugo
fi

# 根据配置安装 Nginx 或 Caddy
if [ "$USE_HTTPS" = true ] && [ -n "$CUSTOM_DOMAIN" ]; then
    # 使用 Caddy（自动 HTTPS）
    if ! command -v caddy &> /dev/null; then
        echo "  安装 Caddy..."
        sudo apt-get install -y -qq debian-keyring debian-archive-keyring apt-transport-https
        curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' 2>/dev/null | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg 2>/dev/null
        curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' 2>/dev/null | sudo tee /etc/apt/sources.list.d/caddy-stable.list > /dev/null
        sudo apt-get update -qq
        sudo apt-get install -y -qq caddy
    fi
    # 停止 Nginx（如果运行）
    sudo systemctl stop nginx 2>/dev/null || true
    sudo systemctl disable nginx 2>/dev/null || true
else
    # 使用 Nginx
    if command -v apt-get &> /dev/null; then
        sudo apt-get install -y -qq nginx
    elif command -v yum &> /dev/null; then
        sudo yum install -y nginx
    fi
fi

echo -e "${GREEN}✓ 依赖安装完成${NC}"

# ============================================
# 2. 创建项目目录和专用用户
# ============================================
echo -e "${GREEN}[2/7] 创建项目目录...${NC}"

# 创建专用运行用户（避免以 root 运行 Web 服务）
if ! id "$APP_USER" &>/dev/null; then
    sudo useradd --system --no-create-home --shell /usr/sbin/nologin "$APP_USER"
    echo -e "  创建专用用户 ${APP_USER}"
fi

# 检查项目是否已存在（判断是否是 git clone 的目录）
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

if [ -d "$REPO_ROOT/flask_api" ] && [ -d "$REPO_ROOT/hugo_blog" ]; then
    # 脚本从项目目录内运行
    if [ "$REPO_ROOT" != "$PROJECT_DIR" ]; then
        sudo mkdir -p "$(dirname $PROJECT_DIR)"
        if [ ! -d "$PROJECT_DIR" ]; then
            sudo cp -r "$REPO_ROOT" "$PROJECT_DIR"
        fi
    fi
else
    # 需要克隆项目
    if [ ! -d "$PROJECT_DIR" ]; then
        echo "  克隆项目..."
        sudo mkdir -p "$(dirname $PROJECT_DIR)"
        sudo git clone https://github.com/yourname/qhfz_web.git "$PROJECT_DIR" 2>/dev/null || {
            echo -e "${RED}克隆失败，请确保项目地址正确${NC}"
            exit 1
        }
    fi
fi

sudo chown -R $USER:$USER "$PROJECT_DIR"
cd "$PROJECT_DIR"

echo -e "${GREEN}✓ 项目目录准备完成${NC}"

# ============================================
# 3. 部署 Flask API
# ============================================
echo -e "${GREEN}[3/7] 部署 Flask API...${NC}"

cd "$PROJECT_DIR/flask_api"

# 创建虚拟环境
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate

# 安装依赖
if [ -f "requirements.txt" ]; then
    pip install -q -r requirements.txt
else
    pip install -q flask gunicorn flask-cors
fi

deactivate

# 授权专用用户访问项目文件（数据库读写需要）
sudo chown -R $APP_USER:$APP_USER "$PROJECT_DIR/flask_api"

echo -e "${GREEN}✓ Flask 环境配置完成${NC}"

# ============================================
# 4. 创建 systemd 服务
# ============================================
echo -e "${GREEN}[4/7] 配置 systemd 服务...${NC}"

sudo tee /etc/systemd/system/qhfz-api.service > /dev/null <<EOF
[Unit]
Description=QHFZ Flask API
After=network.target

[Service]
User=$APP_USER
Group=$APP_USER
WorkingDirectory=$PROJECT_DIR/flask_api
Environment="FLASK_ENV=production"
# SQLite 不支持多进程并发写入，使用单 worker
ExecStart=$PROJECT_DIR/flask_api/venv/bin/gunicorn -w 1 -b 127.0.0.1:8080 wsgi:application
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable qhfz-api
sudo systemctl restart qhfz-api

echo -e "${GREEN}✓ API 服务已启动${NC}"

# ============================================
# 5. 构建 Hugo 博客
# ============================================
echo -e "${GREEN}[5/7] 构建 Hugo 博客...${NC}"

cd "$PROJECT_DIR/hugo_blog"

# 更新 API 地址
if [ -f "hugo.toml" ]; then
    sed -i "s|apiBase = .*|apiBase = '${PROTOCOL}://${DOMAIN}/api'|" hugo.toml
fi

hugo --minify --quiet

sudo mkdir -p /var/www/qhfz
sudo cp -r public/* /var/www/qhfz/
sudo chown -R www-data:www-data /var/www/qhfz 2>/dev/null || sudo chown -R $APP_USER:$APP_USER /var/www/qhfz

echo -e "${GREEN}✓ Hugo 博客构建完成${NC}"

# ============================================
# 6. 配置 Web 服务器
# ============================================
echo -e "${GREEN}[6/7] 配置 Web 服务器...${NC}"

if [ "$USE_HTTPS" = true ] && [ -n "$CUSTOM_DOMAIN" ]; then
    # 使用 Caddy（自动 HTTPS）
    sudo tee /etc/caddy/Caddyfile > /dev/null <<EOF
${DOMAIN} {
    # 静态博客
    root * /var/www/qhfz
    file_server

    # API 反向代理
    handle /api/* {
        reverse_proxy localhost:8080
    }

    # 压缩
    encode gzip

    # 日志
    log {
        output file /var/log/caddy/qhfz.log
    }
}
EOF

    sudo mkdir -p /var/log/caddy
    sudo systemctl enable caddy
    sudo systemctl restart caddy

    echo -e "${GREEN}✓ Caddy 配置完成（自动 HTTPS）${NC}"

else
    # 使用 Nginx
    sudo tee /etc/nginx/sites-available/qhfz > /dev/null <<EOF
server {
    listen 80;
    server_name ${DOMAIN} ${SERVER_IP};

    # 静态博客
    location / {
        root /var/www/qhfz;
        index index.html;
        try_files \$uri \$uri/ =404;
    }

    # API 代理
    location /api/ {
        proxy_pass http://127.0.0.1:8080/api/;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

    # 压缩
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml;
}
EOF

    sudo ln -sf /etc/nginx/sites-available/qhfz /etc/nginx/sites-enabled/
    sudo rm -f /etc/nginx/sites-enabled/default 2>/dev/null || true
    sudo nginx -t && sudo systemctl reload nginx

    echo -e "${GREEN}✓ Nginx 配置完成${NC}"
fi

# ============================================
# 7. Cloudflare Tunnel（可选）
# ============================================
if [ "$USE_TUNNEL" = true ]; then
    echo -e "${GREEN}[7/7] 配置 Cloudflare Tunnel...${NC}"

    TUNNEL_SCRIPT="$PROJECT_DIR/scripts/setup-cloudflare-tunnel.sh"
    if [ -f "$TUNNEL_SCRIPT" ]; then
        chmod +x "$TUNNEL_SCRIPT"
        echo ""
        echo -e "${YELLOW}Cloudflare Tunnel 需要交互式配置${NC}"
        echo "请运行以下命令完成配置："
        echo ""
        echo -e "  ${BLUE}$TUNNEL_SCRIPT quick${NC}    # 快速获得临时 HTTPS 域名"
        echo -e "  ${BLUE}$TUNNEL_SCRIPT service${NC}  # 配置为持久服务"
        echo ""
    else
        echo -e "${YELLOW}Tunnel 脚本不存在，跳过${NC}"
    fi
else
    echo -e "${GREEN}[7/7] 跳过 Cloudflare Tunnel 配置${NC}"
fi

# ============================================
# 完成
# ============================================
echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  🎉 部署完成！${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "访问地址:"
echo -e "  博客首页: ${YELLOW}${PROTOCOL}://${DOMAIN}${NC}"
echo -e "  留言板:   ${YELLOW}${PROTOCOL}://${DOMAIN}/guestbook/${NC}"
echo -e "  API 状态: ${YELLOW}${PROTOCOL}://${DOMAIN}/api/health${NC}"
echo ""

if [ "$USE_TUNNEL" = true ]; then
    echo -e "${BLUE}启用 Cloudflare Tunnel 获得 HTTPS:${NC}"
    echo -e "  $PROJECT_DIR/scripts/setup-cloudflare-tunnel.sh quick"
    echo ""
fi

echo -e "管理命令:"
echo -e "  查看 API 状态: ${BLUE}sudo systemctl status qhfz-api${NC}"
echo -e "  重启 API:      ${BLUE}sudo systemctl restart qhfz-api${NC}"
echo -e "  查看日志:      ${BLUE}sudo journalctl -u qhfz-api -f${NC}"
echo ""

if [ "$USE_HTTPS" = true ]; then
    echo -e "  查看 Caddy 状态: ${BLUE}sudo systemctl status caddy${NC}"
else
    echo -e "  重载 Nginx:    ${BLUE}sudo systemctl reload nginx${NC}"
fi
echo ""
