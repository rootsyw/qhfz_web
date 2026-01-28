#!/bin/bash
# ============================================
# 本地开发脚本 (macOS / Linux)
# 清华附中冬令营 - 极智挑战
# ============================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  极智挑战 - 本地开发环境${NC}"
echo -e "${GREEN}========================================${NC}"

# 检查依赖
check_deps() {
    echo -e "${YELLOW}检查依赖...${NC}"

    if ! command -v python3 &> /dev/null; then
        echo -e "${RED}错误: 请先安装 Python3${NC}"
        exit 1
    fi

    if ! command -v hugo &> /dev/null; then
        echo -e "${RED}错误: 请先安装 Hugo${NC}"
        echo "macOS: brew install hugo"
        echo "Linux: sudo apt install hugo"
        exit 1
    fi

    echo -e "${GREEN}✓ 依赖检查通过${NC}"
}

# 启动 Flask API
start_api() {
    echo -e "${YELLOW}启动 Flask API...${NC}"
    cd "$PROJECT_DIR/flask_api"

    if [ ! -d "venv" ]; then
        python3 -m venv venv
        source venv/bin/activate
        pip install -r requirements.txt
    else
        source venv/bin/activate
    fi

    python -m flask run --port 8080 &
    API_PID=$!
    echo -e "${GREEN}✓ API 运行在 http://localhost:8080${NC}"
}

# 启动 Hugo
start_hugo() {
    echo -e "${YELLOW}启动 Hugo 开发服务器...${NC}"
    cd "$PROJECT_DIR/hugo_blog"
    hugo server --port 1313 &
    HUGO_PID=$!
    echo -e "${GREEN}✓ Hugo 运行在 http://localhost:1313${NC}"
}

# 清理函数
cleanup() {
    echo -e "\n${YELLOW}正在停止服务...${NC}"
    [ -n "$API_PID" ] && kill $API_PID 2>/dev/null
    [ -n "$HUGO_PID" ] && kill $HUGO_PID 2>/dev/null
    echo -e "${GREEN}已停止${NC}"
    exit 0
}

# 主逻辑
trap cleanup SIGINT SIGTERM

check_deps
start_api
sleep 2
start_hugo

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "  博客: ${YELLOW}http://localhost:1313${NC}"
echo -e "  API:  ${YELLOW}http://localhost:8080${NC}"
echo -e "${GREEN}========================================${NC}"
echo -e "按 Ctrl+C 停止服务"

wait
