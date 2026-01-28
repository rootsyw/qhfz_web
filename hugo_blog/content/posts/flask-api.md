---
title: "Flask API 实战：留言板功能"
date: 2026-01-28
description: "学习如何用 Flask 构建一个简单的留言板 API，包括数据存储和接口设计。"
categories: ["教程"]
tags: ["Flask", "API", "Python"]
---

今天我们来实现一个留言板功能。

## 接口设计

我们需要两个接口：

- `GET /api/comments` - 获取留言列表
- `POST /api/comments` - 发布新留言

## 代码实现

```python
@app.route('/api/comments', methods=['GET'])
def get_comments():
    page = request.args.get('page', '/')
    # 从数据库获取留言...
    return jsonify({'comments': comments})
```

## 小结

通过这个练习，我们学会了：

1. RESTful API 设计原则
2. Flask 路由和请求处理
3. JSON 数据格式
