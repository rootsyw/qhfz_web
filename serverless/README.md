# 方案 B：Serverless 一键部署指南

## 概述

本方案支持将项目部署到多个平台。根据是否需要 **动态功能**（Flask API），选择合适的方案：

| 类型 | 平台 | 国内访问 | 免费额度 | 难度 |
|------|------|----------|----------|------|
| **动态（推荐）** | Zeabur | ✅ 友好 | 足够学习 | ⭐ |
| **动态** | PythonAnywhere | ✅ 可访问 | 免费版足够 | ⭐ |
| **动态** | 腾讯云 SCF | ✅ 最快 | ¥12.8/月起 | ⭐⭐⭐ |
| **动态** | Cloudflare Workers | ⚠️ 部分地区 | 10万次/天 | ⭐⭐ |
| **仅静态** | Vercel | ⚠️ 需自定义域名 | 100GB/月 | ⭐ |
| **仅静态** | Cloudflare Pages | ⚠️ 部分地区 | 无限 | ⭐ |
| **仅静态** | GitHub Pages | ⚠️ 部分地区慢 | 1GB 存储 | ⭐ |

> **提示：** 如果只用 Hugo 做静态博客（不需要留言板和访客统计功能），可以直接用 GitHub Pages / Vercel / Cloudflare Pages，完全免费且够用。

---

## 方案 B-1：Zeabur 部署（推荐）

### 为什么推荐 Zeabur

- **国内访问友好**：相比 Vercel，Zeabur 分配的域名在国内可直接访问
- **支持 Flask + 静态站点**：完整支持本项目的动态 API
- **部署简单**：Git 推送自动部署，无需配置服务器
- **免费额度足够学习使用**

### 部署步骤

#### 1. 注册账号

访问 [Zeabur](https://zeabur.com) 注册账号（支持 GitHub 登录）

#### 2. 部署 Flask API

> **重要**：必须部署 `flask_api` 目录，而不是项目根目录或 `serverless` 目录！

在 Zeabur 控制台：

1. 创建新项目
2. 选择 **"从 Git 部署"**
3. 连接 GitHub，选择 `qhfz_web` 仓库
4. **关键步骤：Root Directory 设置为 `flask_api`**
5. Zeabur 会自动识别 Python 项目并部署

`flask_api` 目录包含 `zeabur.toml` 配置文件，Zeabur 会自动使用它进行构建和启动。

#### 3. 部署 Hugo 博客

```bash
# 本地构建
cd hugo_blog
hugo --minify

# 在 Zeabur 控制台：
# 1. 同一项目中添加新服务
# 2. 选择 "静态站点" 部署
# 3. 上传 public 目录
```

或者让 Zeabur 自动构建：
- 根目录设置为 `hugo_blog`
- 构建命令：`hugo --minify`
- 输出目录：`public`

#### 4. 配置域名

Zeabur 会自动分配域名，如 `qhfz-api-xxx.zeabur.app`。

如需自定义域名，在控制台添加并配置 DNS 解析。

> **注意**：如果选择国内部署区域，需要绑定已备案的域名。

### Zeabur 常见问题排查

#### 问题：部署成功但访问 404

**症状**：Zeabur 显示"运行中"，域名状态正常，但访问显示 404。

**原因**：部署了错误的目录。

**排查步骤**：

1. **检查 Root Directory 设置**
   - 打开 Zeabur 控制台 → 你的服务
   - 查看"设置"中的 Root Directory
   - ✅ 正确：`flask_api`
   - ❌ 错误：空（项目根目录）、`serverless`

2. **查看日志**
   - 点击"日志"标签页
   - 访问你的域名，看日志是否有请求记录
   - 如果有 `GET / 404` → 路由没配置好
   - 如果没有请求记录 → 端口没配通

3. **检查端口**
   - 点击"网络"标签页
   - 确认暴露的端口与 Flask 监听的端口一致
   - Flask 默认监听 `$PORT` 环境变量（Zeabur 自动注入）

**解决方法**：

```bash
# 方法 1：删除服务，重新部署
# 在 Zeabur 控制台删除当前服务
# 重新添加服务，Root Directory 设置为 flask_api

# 方法 2：修改现有服务
# 在服务设置中修改 Root Directory 为 flask_api
# 点击"重新部署"
```

#### 问题：构建失败

**检查 requirements.txt**：确保 `flask_api/requirements.txt` 存在且内容正确：

```
flask>=2.3.0
gunicorn>=21.0.0
```

#### 问题：数据库不持久

Zeabur 默认不持久化 SQLite 文件。如果需要持久化，建议：
- 使用 Zeabur 提供的 PostgreSQL 服务
- 或接受每次部署数据重置（适合学习场景）

---

## 方案 B-2：PythonAnywhere（新手友好）

### 优点

- **零门槛**：不用学 Linux、不用买服务器、不用懂 Git
- **全程可视化**：Web 界面操作 + 少量命令
- **免费版够用**：支持 SQLite，轻量级流量足够
- **国内可访问**：访问速度尚可

### 部署步骤

#### 1. 注册账号

访问 [PythonAnywhere](https://www.pythonanywhere.com) 注册免费账号

#### 2. 上传代码

```bash
# 在 PythonAnywhere 的 Bash 控制台：
git clone https://github.com/<你的用户名>/qhfz_web.git
cd qhfz_web/flask_api
pip install -r requirements.txt
```

#### 3. 配置 Web 应用

1. 进入 "Web" 标签页
2. 创建新的 Web 应用，选择 Flask
3. 设置 WSGI 配置文件路径指向 `wsgi.py`
4. 重新加载应用

#### 4. 部署 Hugo（静态）

Hugo 静态站点需要单独托管（PythonAnywhere 免费版只支持一个 Web 应用），可以：
- 使用 Vercel/Cloudflare Pages 托管 Hugo
- 或将 Hugo 生成的 `public` 目录作为 Flask 的静态文件服务

---

## 方案 B-3：Cloudflare Workers + Pages

### 优点

- **免费额度超大**：Workers 每天 10 万次请求，Pages 无限流量
- **全球 CDN 加速**
- **生态完善**：KV 存储、D1 数据库等

### 限制

- **需要改写代码**：Workers 使用 JavaScript，不能直接运行 Flask
- **国内部分地区访问不稳定**

### 部署步骤

#### 1. 注册 Cloudflare

访问 [Cloudflare](https://cloudflare.com) 注册账号

#### 2. 部署 Hugo（Pages）

```bash
# 本地构建
cd hugo_blog
hugo --minify

# 在 Cloudflare Pages：
# 1. 创建项目，连接 Git 仓库
# 2. 构建命令：hugo --minify
# 3. 输出目录：hugo_blog/public
```

#### 3. 部署 API（Workers）

项目已提供 `cloudflare-worker.js`，这是将 Flask API 改写为 Workers 格式的版本：

```bash
# 安装 Wrangler CLI
npm install -g wrangler

# 登录
wrangler login

# 创建 KV 命名空间
wrangler kv:namespace create BLOG_KV

# 部署
wrangler deploy serverless/cloudflare-worker.js
```

> **注意**：Workers 版本使用 KV 存储替代 SQLite，数据结构有所不同。

---

## 方案 B-4：腾讯云 Serverless（国内最快）

### 优点

- **国内访问最快**
- **腾讯云生态集成**

### 限制

- **不再完全免费**：至少 ¥12.8/月
- **Python 版本限制**：仅支持 Python 3.7
- **配置较复杂**

### 部署步骤

参考 [腾讯云官方文档](https://cloud.tencent.com/document/product/1154/40495)。

---

## 仅静态博客：GitHub Pages / Vercel

如果你只需要 Hugo 博客，**不需要留言板和访客统计功能**，可以使用纯静态托管：

### GitHub Pages

```bash
# 1. 在 GitHub 仓库设置中启用 Pages
# 2. 选择 GitHub Actions 构建
# 3. 添加 .github/workflows/hugo.yml
```

优点：
- 完全免费
- 与 Git 工作流深度集成

缺点：
- 国内部分地区访问较慢
- 无法运行动态 API

### Vercel

```bash
# 1. 访问 vercel.com，用 GitHub 登录
# 2. 导入 qhfz_web 仓库
# 3. 根目录设置为 hugo_blog
# 4. 构建命令：hugo --minify
```

优点：
- 部署极其简单
- 100GB/月免费流量
- 支持自动构建

缺点：
- **默认域名国内被墙**，必须绑定自定义域名
- 自定义域名需要自己购买

> **重要提示**：Gitee Pages 已于 2024 年下线，不再推荐使用。

---

## 平台选择建议

### 课后自用推荐

1. **有动态需求（留言板）**：Zeabur 或 PythonAnywhere
2. **纯静态博客**：Vercel（需自定义域名）或 GitHub Pages

### 国内访问优先级

1. Zeabur（推荐）
2. PythonAnywhere
3. 腾讯云 SCF（付费）
4. Vercel + 自定义域名
5. Cloudflare（部分地区不稳定）

### 免费额度对比

| 平台 | 免费额度 |
|------|----------|
| Cloudflare Workers | 10 万次/天 |
| Cloudflare Pages | 无限流量 |
| Vercel | 100GB/月 |
| GitHub Pages | 1GB 存储，100GB/月 |
| Zeabur | 开发者计划免费额度 |
| PythonAnywhere | 1 个 Web 应用，有限 CPU |

---

## 参考资料

- [Zeabur 官方文档](https://zeabur.com/docs/zh-CN)
- [PythonAnywhere 部署指南](https://help.pythonanywhere.com/pages/Flask/)
- [Cloudflare Workers 文档](https://developers.cloudflare.com/workers/)
- [Vercel 部署 Hugo](https://vercel.com/guides/deploying-hugo-with-vercel)
- [腾讯云 Serverless Flask 部署](https://cloud.tencent.com/document/product/1154/40495)
