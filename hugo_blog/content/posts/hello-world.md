---
title: "Hello World - 冬令营第一天"
date: 2026-01-27
description: "冬令营第一天的学习笔记：环境配置、Flask 基础和 Git 入门。"
categories: ["日记"]
tags: ["入门", "Python"]
---

今天是冬令营的第一天！

## 我们学到了什么

1. **环境配置** - 安装 Python、Hugo 和必要的工具
2. **Flask 基础** - 创建第一个 Web API
3. **Git 操作** - 版本控制入门

## 代码示例

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return '你好，世界！'
```

明天继续加油！💪
