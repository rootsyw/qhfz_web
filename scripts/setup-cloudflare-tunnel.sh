#!/bin/bash
# ============================================
# Cloudflare Tunnel 一键配置脚本
# ============================================

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_help() {
    echo -e "${BLUE}Cloudflare Tunnel 配置脚本${NC}"
    echo ""
    echo "用法: $0 <命令>"
    echo ""
    echo "命令:"
    echo "  install     安装 cloudflared"
    echo "  quick       快速启动（临时随机域名）"
    echo "  service     配置为系统服务（持久运行）"
    echo "  status      查看服务状态"
    echo "  logs        查看日志"
    echo "  stop        停止服务"
    echo "  uninstall   卸载 cloudflared"
    echo ""
    echo "示例:"
    echo "  $0 install   # 安装 cloudflared"
    echo "  $0 quick     # 快速获得一个 HTTPS 域名"
    echo ""
}

install_cloudflared() {
    echo -e "${GREEN}[1/2] 检测系统架构...${NC}"

    ARCH=$(uname -m)
    case $ARCH in
        x86_64)
            ARCH_NAME="amd64"
            ;;
        aarch64|arm64)
            ARCH_NAME="arm64"
            ;;
        armv7l)
            ARCH_NAME="arm"
            ;;
        *)
            echo -e "${RED}不支持的架构: $ARCH${NC}"
            exit 1
            ;;
    esac

    echo -e "${GREEN}[2/2] 下载并安装 cloudflared (${ARCH_NAME})...${NC}"

    # 检测包管理器
    if command -v apt-get &> /dev/null; then
        # Debian/Ubuntu
        curl -L "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${ARCH_NAME}.deb" -o /tmp/cloudflared.deb
        sudo dpkg -i /tmp/cloudflared.deb
        rm /tmp/cloudflared.deb
    elif command -v yum &> /dev/null; then
        # CentOS/RHEL
        curl -L "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${ARCH_NAME}.rpm" -o /tmp/cloudflared.rpm
        sudo yum install -y /tmp/cloudflared.rpm
        rm /tmp/cloudflared.rpm
    else
        # 通用安装
        curl -L "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${ARCH_NAME}" -o /tmp/cloudflared
        sudo mv /tmp/cloudflared /usr/local/bin/cloudflared
        sudo chmod +x /usr/local/bin/cloudflared
    fi

    # 验证安装
    if cloudflared --version &> /dev/null; then
        echo -e "${GREEN}✓ cloudflared 安装成功${NC}"
        cloudflared --version
    else
        echo -e "${RED}✗ 安装失败${NC}"
        exit 1
    fi
}

quick_tunnel() {
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  启动 Cloudflare Quick Tunnel${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}说明：${NC}"
    echo "  - 将获得一个随机的 HTTPS 域名"
    echo "  - 格式类似：https://random-words.trycloudflare.com"
    echo "  - 按 Ctrl+C 停止"
    echo ""
    echo -e "${YELLOW}启动中...${NC}"
    echo ""

    # 检查 Nginx 是否在运行
    if systemctl is-active --quiet nginx; then
        cloudflared tunnel --url http://localhost:80
    elif systemctl is-active --quiet qhfz-api; then
        # 如果只有 API 在运行
        cloudflared tunnel --url http://localhost:8080
    else
        echo -e "${RED}错误：没有检测到运行的 Web 服务${NC}"
        echo "请先运行部署脚本: ./scripts/deploy-linux.sh"
        exit 1
    fi
}

setup_service() {
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  配置 Cloudflare Tunnel 系统服务${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""

    # 检查是否已登录
    if [ ! -f ~/.cloudflared/cert.pem ]; then
        echo -e "${YELLOW}首次使用需要登录 Cloudflare 账号${NC}"
        echo "将打开浏览器进行授权..."
        echo ""
        cloudflared tunnel login
    fi

    # 创建 Tunnel
    TUNNEL_NAME="qhfz-tunnel-$(date +%s)"
    echo -e "${GREEN}[1/4] 创建 Tunnel: ${TUNNEL_NAME}${NC}"
    cloudflared tunnel create $TUNNEL_NAME

    # 获取 Tunnel ID
    TUNNEL_ID=$(cloudflared tunnel list | grep $TUNNEL_NAME | awk '{print $1}')

    # 创建配置文件
    echo -e "${GREEN}[2/4] 创建配置文件...${NC}"
    sudo mkdir -p /etc/cloudflared

    sudo tee /etc/cloudflared/config.yml > /dev/null <<EOF
tunnel: $TUNNEL_ID
credentials-file: /root/.cloudflared/${TUNNEL_ID}.json

ingress:
  # 静态博客和 API
  - service: http://localhost:80
EOF

    # 复制凭证文件
    sudo cp ~/.cloudflared/${TUNNEL_ID}.json /etc/cloudflared/ 2>/dev/null || true

    # 安装服务
    echo -e "${GREEN}[3/4] 安装系统服务...${NC}"
    sudo cloudflared service install

    # 启动服务
    echo -e "${GREEN}[4/4] 启动服务...${NC}"
    sudo systemctl enable cloudflared
    sudo systemctl start cloudflared

    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  配置完成！${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo -e "${YELLOW}Tunnel 名称: ${TUNNEL_NAME}${NC}"
    echo -e "${YELLOW}Tunnel ID: ${TUNNEL_ID}${NC}"
    echo ""
    echo "下一步：在 Cloudflare Dashboard 中为此 Tunnel 配置域名"
    echo "访问：https://one.dash.cloudflare.com/ → Zero Trust → Tunnels"
    echo ""
    echo "或使用命令行配置域名（需要已有域名托管在 Cloudflare）："
    echo "  cloudflared tunnel route dns $TUNNEL_NAME subdomain.yourdomain.com"
    echo ""
}

show_status() {
    echo -e "${BLUE}Cloudflare Tunnel 状态${NC}"
    echo "------------------------"

    if systemctl is-active --quiet cloudflared; then
        echo -e "服务状态: ${GREEN}运行中${NC}"
    else
        echo -e "服务状态: ${RED}未运行${NC}"
    fi

    echo ""
    sudo systemctl status cloudflared --no-pager -l 2>/dev/null || echo "服务未安装"
}

show_logs() {
    echo -e "${BLUE}Cloudflare Tunnel 日志${NC}"
    echo "------------------------"
    sudo journalctl -u cloudflared -f
}

stop_service() {
    echo -e "${YELLOW}停止 Cloudflare Tunnel 服务...${NC}"
    sudo systemctl stop cloudflared
    echo -e "${GREEN}✓ 服务已停止${NC}"
}

uninstall_cloudflared() {
    echo -e "${YELLOW}卸载 cloudflared...${NC}"

    # 停止服务
    sudo systemctl stop cloudflared 2>/dev/null || true
    sudo systemctl disable cloudflared 2>/dev/null || true

    # 删除服务文件
    sudo rm -f /etc/systemd/system/cloudflared.service
    sudo systemctl daemon-reload

    # 删除配置
    sudo rm -rf /etc/cloudflared

    # 删除程序
    if command -v apt-get &> /dev/null; then
        sudo apt-get remove -y cloudflared 2>/dev/null || true
    elif command -v yum &> /dev/null; then
        sudo yum remove -y cloudflared 2>/dev/null || true
    fi
    sudo rm -f /usr/local/bin/cloudflared

    echo -e "${GREEN}✓ cloudflared 已卸载${NC}"
}

# 主逻辑
case "${1:-}" in
    install)
        install_cloudflared
        ;;
    quick)
        if ! command -v cloudflared &> /dev/null; then
            echo -e "${YELLOW}cloudflared 未安装，正在安装...${NC}"
            install_cloudflared
        fi
        quick_tunnel
        ;;
    service)
        if ! command -v cloudflared &> /dev/null; then
            echo -e "${YELLOW}cloudflared 未安装，正在安装...${NC}"
            install_cloudflared
        fi
        setup_service
        ;;
    status)
        show_status
        ;;
    logs)
        show_logs
        ;;
    stop)
        stop_service
        ;;
    uninstall)
        uninstall_cloudflared
        ;;
    *)
        print_help
        ;;
esac
