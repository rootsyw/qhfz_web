#!/bin/bash
# ============================================
# 方案 A：Linux 服务器一键部署脚本
# 清华附中冬令营 - 极智挑战
# ============================================

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  极智挑战 - 一键部署脚本${NC}"
echo -e "${GREEN}========================================${NC}"

# 检测服务器 IP
SERVER_IP=$(curl -s ifconfig.me || hostname -I | awk '{print $1}')
DOMAIN="${SERVER_IP}.nip.io"

echo -e "${YELLOW}检测到服务器 IP: ${SERVER_IP}${NC}"
echo -e "${YELLOW}将使用域名: ${DOMAIN}${NC}"
echo ""

# 1. 安装依赖
echo -e "${GREEN}[1/6] 安装系统依赖...${NC}"
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y python3 python3-pip python3-venv nginx
elif command -v yum &> /dev/null; then
    sudo yum install -y python3 python3-pip nginx
fi

# 安装 Hugo
if ! command -v hugo &> /dev/null; then
    echo "安装 Hugo..."
    wget -qO- https://github.com/gohugoio/hugo/releases/download/v0.121.0/hugo_0.121.0_linux-amd64.tar.gz | sudo tar xz -C /usr/local/bin hugo
fi

echo -e "${GREEN}✓ 依赖安装完成${NC}"

# 2. 创建项目目录和专用用户
echo -e "${GREEN}[2/6] 创建项目目录...${NC}"
PROJECT_DIR="/opt/qhfz_web"
APP_USER="qhfz"

# 创建专用运行用户（避免以 root 运行 Web 服务）
if ! id "$APP_USER" &>/dev/null; then
    sudo useradd --system --no-create-home --shell /usr/sbin/nologin "$APP_USER"
    echo -e "${GREEN}✓ 创建专用用户 ${APP_USER}${NC}"
fi

sudo mkdir -p $PROJECT_DIR
sudo chown $USER:$USER $PROJECT_DIR
cd $PROJECT_DIR

echo -e "${GREEN}✓ 项目目录创建完成${NC}"

# 3. 部署 Flask API
echo -e "${GREEN}[3/6] 部署 Flask API...${NC}"
mkdir -p $PROJECT_DIR/flask_api
cd $PROJECT_DIR/flask_api

# 创建虚拟环境
python3 -m venv venv
source venv/bin/activate

# 安装依赖
pip install flask gunicorn flask-cors

echo -e "${GREEN}✓ Flask 环境配置完成${NC}"

# 授权专用用户访问项目文件（数据库读写需要）
sudo chown -R $APP_USER:$APP_USER $PROJECT_DIR/flask_api

# 4. 创建 systemd 服务
echo -e "${GREEN}[4/6] 配置 systemd 服务...${NC}"
sudo tee /etc/systemd/system/qhfz-api.service > /dev/null <<EOF
[Unit]
Description=QHFZ Flask API
After=network.target

[Service]
User=$APP_USER
Group=$APP_USER
WorkingDirectory=$PROJECT_DIR/flask_api
# SQLite 不支持多进程并发写入，使用单 worker
ExecStart=$PROJECT_DIR/flask_api/venv/bin/gunicorn -w 1 -b 127.0.0.1:8080 wsgi:application
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable qhfz-api
sudo systemctl start qhfz-api

echo -e "${GREEN}✓ API 服务已启动${NC}"

# 5. 构建 Hugo 博客
echo -e "${GREEN}[5/6] 构建 Hugo 博客...${NC}"
cd $PROJECT_DIR/hugo_blog

# 更新 API 地址
sed -i "s|apiBase = .*|apiBase = 'http://${DOMAIN}/api'|" hugo.toml

hugo --minify
sudo mkdir -p /var/www/qhfz
sudo cp -r public/* /var/www/qhfz/

echo -e "${GREEN}✓ Hugo 博客构建完成${NC}"

# 6. 配置 Nginx
echo -e "${GREEN}[6/6] 配置 Nginx...${NC}"
sudo tee /etc/nginx/sites-available/qhfz > /dev/null <<EOF
server {
    listen 80;
    server_name ${DOMAIN};

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
    }
}
EOF

sudo ln -sf /etc/nginx/sites-available/qhfz /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx

echo -e "${GREEN}✓ Nginx 配置完成${NC}"

# 完成
echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  部署完成！${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "博客地址: ${YELLOW}http://${DOMAIN}${NC}"
echo -e "API 地址: ${YELLOW}http://${DOMAIN}/api${NC}"
echo ""
echo -e "管理命令:"
echo -e "  查看 API 状态: sudo systemctl status qhfz-api"
echo -e "  重启 API:     sudo systemctl restart qhfz-api"
echo -e "  查看日志:     sudo journalctl -u qhfz-api -f"
