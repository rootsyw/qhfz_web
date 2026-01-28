"""
Flask API 入口 - 用于 Zeabur 等平台自动检测
"""
import os
from app import create_app

app = create_app()

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port)
