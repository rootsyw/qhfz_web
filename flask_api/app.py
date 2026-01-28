"""
清华附中冬令营 - Flask 博客后台 API
功能：留言板 + 访客统计
"""

import os
import json
import sqlite3
from datetime import datetime
from functools import wraps

from flask import Flask, request, jsonify, g

# ============ 配置 ============
app = Flask(__name__)
app.config['DATABASE'] = os.path.join(os.path.dirname(__file__), 'blog.db')

# 允许跨域（Hugo 静态页面调用 API 需要）
@app.after_request
def add_cors_headers(response):
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Content-Type'
    return response


# ============ 数据库工具 ============
def get_db():
    """获取数据库连接"""
    if 'db' not in g:
        g.db = sqlite3.connect(app.config['DATABASE'])
        g.db.row_factory = sqlite3.Row
        # 启用 WAL 模式，允许读写并发，避免 database is locked
        g.db.execute('PRAGMA journal_mode=WAL')
    return g.db


@app.teardown_appcontext
def close_db(error):
    """关闭数据库连接"""
    db = g.pop('db', None)
    if db is not None:
        db.close()


def init_db():
    """初始化数据库表"""
    db = get_db()
    db.executescript('''
        -- 留言表
        CREATE TABLE IF NOT EXISTS comments (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            page_url TEXT NOT NULL,
            nickname TEXT NOT NULL,
            content TEXT NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );

        -- 访问统计表
        CREATE TABLE IF NOT EXISTS page_views (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            page_url TEXT NOT NULL,
            visitor_ip TEXT,
            user_agent TEXT,
            visited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );

        -- 页面统计汇总表
        CREATE TABLE IF NOT EXISTS page_stats (
            page_url TEXT PRIMARY KEY,
            view_count INTEGER DEFAULT 0
        );
    ''')
    db.commit()


# ============ API 路由 ============

@app.route('/')
def index():
    """首页 - API 说明"""
    return jsonify({
        'name': '清华附中冬令营博客 API',
        'version': '1.0.0',
        'endpoints': {
            'GET /api/comments?page=<url>': '获取指定页面的留言',
            'POST /api/comments': '提交留言',
            'GET /api/stats?page=<url>': '获取页面访问统计',
            'POST /api/stats/record': '记录页面访问',
            'GET /api/health': '健康检查'
        },
        'author': '清华附中 × 奇安信',
        'message': '欢迎来到极智挑战冬令营！🎉'
    })


@app.route('/api/health')
def health_check():
    """健康检查接口"""
    return jsonify({
        'status': 'healthy',
        'timestamp': datetime.now().isoformat()
    })


# ============ 留言板 API ============

@app.route('/api/comments', methods=['GET'])
def get_comments():
    """获取留言列表"""
    page_url = request.args.get('page', '/')

    db = get_db()
    comments = db.execute(
        'SELECT id, nickname, content, created_at FROM comments WHERE page_url = ? ORDER BY created_at DESC LIMIT 50',
        (page_url,)
    ).fetchall()

    return jsonify({
        'success': True,
        'page': page_url,
        'count': len(comments),
        'comments': [
            {
                'id': c['id'],
                'nickname': c['nickname'],
                'content': c['content'],
                'created_at': c['created_at']
            }
            for c in comments
        ]
    })


@app.route('/api/comments', methods=['POST'])
def post_comment():
    """提交留言"""
    data = request.get_json()

    if not data:
        return jsonify({'success': False, 'error': '请求数据为空'}), 400

    page_url = data.get('page', '/')
    nickname = data.get('nickname', '').strip()
    content = data.get('content', '').strip()

    # 简单校验
    if not nickname:
        return jsonify({'success': False, 'error': '昵称不能为空'}), 400
    if not content:
        return jsonify({'success': False, 'error': '留言内容不能为空'}), 400
    if len(nickname) > 20:
        return jsonify({'success': False, 'error': '昵称太长了（最多20字）'}), 400
    if len(content) > 500:
        return jsonify({'success': False, 'error': '留言太长了（最多500字）'}), 400

    # 简单的敏感词过滤（示例）
    sensitive_words = ['广告', 'spam']
    for word in sensitive_words:
        if word in content.lower():
            return jsonify({'success': False, 'error': '留言包含敏感词'}), 400

    db = get_db()
    cursor = db.execute(
        'INSERT INTO comments (page_url, nickname, content) VALUES (?, ?, ?)',
        (page_url, nickname, content)
    )
    db.commit()

    return jsonify({
        'success': True,
        'message': '留言成功！',
        'comment_id': cursor.lastrowid
    })


@app.route('/api/comments', methods=['OPTIONS'])
def comments_options():
    """处理 CORS 预检请求"""
    return '', 204


# ============ 访客统计 API ============

@app.route('/api/stats', methods=['GET'])
def get_stats():
    """获取页面访问统计"""
    page_url = request.args.get('page', '/')

    db = get_db()
    stats = db.execute(
        'SELECT view_count FROM page_stats WHERE page_url = ?',
        (page_url,)
    ).fetchone()

    view_count = stats['view_count'] if stats else 0

    return jsonify({
        'success': True,
        'page': page_url,
        'view_count': view_count
    })


@app.route('/api/stats/record', methods=['POST'])
def record_visit():
    """记录页面访问"""
    data = request.get_json() or {}
    page_url = data.get('page', '/')

    visitor_ip = request.remote_addr
    user_agent = request.headers.get('User-Agent', '')[:200]

    db = get_db()

    # 记录访问详情
    db.execute(
        'INSERT INTO page_views (page_url, visitor_ip, user_agent) VALUES (?, ?, ?)',
        (page_url, visitor_ip, user_agent)
    )

    # 更新统计汇总
    db.execute('''
        INSERT INTO page_stats (page_url, view_count) VALUES (?, 1)
        ON CONFLICT(page_url) DO UPDATE SET view_count = view_count + 1
    ''', (page_url,))

    db.commit()

    return jsonify({
        'success': True,
        'message': '访问已记录'
    })


@app.route('/api/stats/record', methods=['OPTIONS'])
def stats_options():
    """处理 CORS 预检请求"""
    return '', 204


# ============ 启动 ============

def create_app():
    """应用工厂函数"""
    with app.app_context():
        init_db()
    return app


if __name__ == '__main__':
    # 开发模式
    with app.app_context():
        init_db()

    # 注意：生产环境不要用 debug=True
    # 这里用环境变量控制
    debug_mode = os.environ.get('FLASK_DEBUG', 'false').lower() == 'true'
    port = int(os.environ.get('PORT', 8080))

    print(f"🚀 Flask API 启动中...")
    print(f"📍 地址: http://0.0.0.0:{port}")
    print(f"🔧 调试模式: {debug_mode}")

    app.run(host='0.0.0.0', port=port, debug=debug_mode)
