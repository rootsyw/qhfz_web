"""
WSGI 入口文件 - 用于 Gunicorn 生产部署
"""
from app import create_app

application = create_app()

if __name__ == "__main__":
    application.run()
