#!/bin/bash
# 银河互联网电视 - 一键启动本地预览服务器
# 使用方法: bash serve.sh [端口]

PORT=${1:-8080}

echo "========================================"
echo "  银河互联网电视 - 本地预览服务器"
echo "========================================"
echo ""

# 清理可能冲突的 Python 环境变量
unset PYTHONHOME
unset PYTHONPATH

# 检查端口是否被占用
if lsof -Pi :"$PORT" -sTCP:LISTEN -t >/dev/null 2>&1; then
    echo "警告：端口 $PORT 已被占用，尝试释放..."
    lsof -ti:"$PORT" | xargs kill -9 2>/dev/null
    sleep 1
fi

echo "正在启动..."
echo ""

# 优先尝试 Python3
if command -v python3 &> /dev/null; then
    echo "使用 Python3 启动：http://localhost:$PORT"
    echo "按 Ctrl+C 停止服务器"
    echo ""
    python3 -m http.server "$PORT"
    exit 0
fi

# 尝试 Python
if command -v python &> /dev/null; then
    echo "使用 Python 启动：http://localhost:$PORT"
    echo "按 Ctrl+C 停止服务器"
    echo ""
    python -m http.server "$PORT"
    exit 0
fi

# 尝试 Node.js 的 npx serve
if command -v npx &> /dev/null; then
    echo "使用 Node.js (npx serve) 启动：http://localhost:$PORT"
    echo "按 Ctrl+C 停止服务器"
    echo ""
    npx serve . -l "$PORT"
    exit 0
fi

# 尝试 Node.js 的 http-server
if command -v npx &> /dev/null; then
    echo "使用 Node.js (http-server) 启动：http://localhost:$PORT"
    echo "按 Ctrl+C 停止服务器"
    echo ""
    npx http-server . -p "$PORT"
    exit 0
fi

# 都失败了
echo "错误：未找到可用的启动工具。"
echo ""
echo "请安装以下任意一种："
echo "  1. Python3（Mac 自带）"
echo "  2. Node.js（https://nodejs.org/）"
echo ""
echo "或者手动使用 VS Code 的 Live Server 插件打开 index.html"
exit 1