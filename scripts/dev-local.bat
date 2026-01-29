@echo off
chcp 65001 >nul
:: ============================================
:: 本地开发脚本 (Windows)
:: ============================================

echo ========================================
echo   本地开发环境
echo ========================================

set SCRIPT_DIR=%~dp0
set PROJECT_DIR=%SCRIPT_DIR%..

:: 检查 Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 请先安装 Python3
    pause
    exit /b 1
)

:: 检查 Hugo
hugo version >nul 2>&1
if errorlevel 1 (
    echo [错误] 请先安装 Hugo
    echo 下载地址: https://gohugo.io/installation/windows/
    pause
    exit /b 1
)

echo [OK] 依赖检查通过

:: 设置 Flask 虚拟环境
echo [INFO] 配置 Flask 环境...
cd /d "%PROJECT_DIR%\flask_api"

if not exist "venv" (
    python -m venv venv
    call venv\Scripts\activate.bat
    pip install -r requirements.txt
) else (
    call venv\Scripts\activate.bat
)

:: 启动 Flask API (后台)
echo [INFO] 启动 Flask API...
start "Flask API" cmd /c "python -m flask run --port 8080"
timeout /t 2 >nul

:: 启动 Hugo
echo [INFO] 启动 Hugo 开发服务器...
cd /d "%PROJECT_DIR%\hugo_blog"
start "Hugo Server" cmd /c "hugo server --port 1313"

echo.
echo ========================================
echo   开发环境已启动！
echo ========================================
echo   博客: http://localhost:1313
echo   API:  http://localhost:8080
echo ========================================
echo   关闭窗口即可停止服务
echo.
pause
