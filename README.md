# 清华附中冬令营网站搭建项目

清华附中与奇安信集团联合举办的「极智挑战」智能安全科技冬令营 - 网站搭建教学项目。

> **给老师的话：** 本项目是原手册的改进版，去掉了约 70% 的配置冗余，保留了核心教学价值。两套方案的差异和设计思路，请参见 [docs/方案对比.md](docs/方案对比.md)。

---

## 项目简介

本项目提供**三套网站搭建方案**，代码完全相同，差异只在部署方式：

| | 方案 A（传统教学版） | 方案 B（Serverless 版） | 方案 C（极简静态版） |
|--|---------------------|------------------------|---------------------|
| **定位** | 理解服务器运维原理 | 理解现代部署流程 | 快速体验建站 |
| **技术栈** | Flask + Hugo + Nginx | Flask + Hugo + Zeabur | Hugo + Cloudflare |
| **服务器** | 需要 Linux 服务器 | 不需要 | 不需要 |
| **功能** | 完整（博客+留言板+统计） | 完整 | 仅博客 |
| **成本** | 服务器费用 | 免费/低成本 | **完全免费** |
| **难度** | ⭐⭐⭐ | ⭐⭐ | ⭐ |
| **适合场景** | 课堂教学 | 课后自用 | 快速入门 |

---

## 快速体验：5 分钟跑起来

### 前置条件

- Python 3.8+
- Hugo（`brew install hugo` 或 [下载](https://github.com/gohugoio/hugo/releases)）

### 本地启动

```bash
# 克隆项目
git clone https://github.com/yourname/qhfz_web.git
cd qhfz_web

# 一键启动（macOS/Linux）
./scripts/dev-local.sh

# 或 Windows
scripts\dev-local.bat
```

启动后访问：
- 博客首页：http://localhost:1313
- API 接口：http://localhost:8080
- API 文档：http://localhost:8080/api/health

按 `Ctrl+C` 停止所有服务。

---

## 方案 A：传统服务器部署（5 步）

> 适合课堂教学，学生需要有一台 Linux 服务器（DataCon 平台分配 或 自购阿里云 ECS）

### 步骤 1：SSH 连接服务器

```bash
ssh root@<你的服务器IP>
```

### 步骤 2：克隆项目

```bash
cd /opt
git clone https://github.com/yourname/qhfz_web.git
cd qhfz_web
```

### 步骤 3：一键部署

```bash
chmod +x scripts/deploy-linux.sh
./scripts/deploy-linux.sh
```

脚本会自动完成：
1. 安装依赖（Python3、Nginx、Hugo）
2. 创建专用用户 `qhfz`（非 root 运行，更安全）
3. 配置 Flask API（Gunicorn + Systemd，开机自启）
4. 构建 Hugo 静态博客
5. 配置 Nginx 反向代理

### 步骤 4：访问网站

部署完成后，终端会显示访问地址：

```
博客地址: http://<你的IP>.nip.io
API 地址: http://<你的IP>.nip.io/api
```

### 步骤 5（可选）：配置 HTTPS

```bash
# 需要自己的域名（nip.io 有 rate limit）
sudo certbot certonly --standalone -d your-domain.com

# 更新 Nginx 配置，启用 SSL
# 详见 docs/requirements.md
```

### 常用管理命令

```bash
# 查看 API 状态
sudo systemctl status qhfz-api

# 重启 API
sudo systemctl restart qhfz-api

# 查看日志
sudo journalctl -u qhfz-api -f

# 重新构建 Hugo
cd /opt/qhfz_web/hugo_blog && hugo --minify
sudo cp -r public/* /var/www/qhfz/
```

---

## 方案 B：Serverless 部署（3 步）

> 适合课后自用，无需服务器，Git 推送自动部署

### 步骤 1：Fork 并克隆项目

```bash
# 先在 GitHub 上 Fork 本项目
git clone https://github.com/<你的用户名>/qhfz_web.git
cd qhfz_web
```

### 步骤 2：部署到 Zeabur

1. 注册 [Zeabur](https://zeabur.com) 账号
2. 创建新项目 → 选择 "从 Git 部署"
3. 连接你的 GitHub 账号，选择 `qhfz_web` 仓库
4. **部署 Flask API**：
   - **关键：Root Directory 必须设置为 `flask_api`**（不是根目录，不是 serverless）
   - Zeabur 会自动识别 Python 项目并使用 `zeabur.toml` 配置部署
5. **部署 Hugo 博客**：选择 `hugo_blog` 目录，构建命令填 `hugo --minify`

> **常见问题**：如果部署后访问 404，请检查 Root Directory 是否正确设置为 `flask_api`。详见 [serverless/README.md](serverless/README.md#zeabur-常见问题排查)。

### 步骤 3：配置域名

Zeabur 会自动分配一个域名，如 `qhfz-web-xxx.zeabur.app`。

如需自定义域名，在 Zeabur 控制台添加域名并配置 DNS。

### 更新网站

```bash
# 修改代码后
git add .
git commit -m "更新内容"
git push

# Zeabur 会自动重新构建部署
```

详细步骤参见 [serverless/README.md](serverless/README.md)。

> **其他平台选项：** 除了 Zeabur，还支持 PythonAnywhere、Cloudflare Workers、腾讯云 SCF 等平台。详见 [serverless/README.md](serverless/README.md)。

---

## 方案 C：极简静态部署（2 步）

> **零成本、零服务器、10 分钟上线** — 适合只需要博客的场景

⚠️ **注意：** 此方案不包含留言板和访客统计功能（需要后端支持）

### 步骤 1：Fork 并推送到 GitHub

```bash
# Fork 本项目后克隆
git clone https://github.com/<你的用户名>/qhfz_web.git
cd qhfz_web

# 随便改点内容
echo "Hello" >> hugo_blog/content/posts/test.md
git add . && git commit -m "测试" && git push
```

### 步骤 2：部署到 Cloudflare Pages

1. 访问 [cloudflare.com](https://cloudflare.com) 注册
2. 进入 **Workers & Pages** → **Create** → **Pages**
3. 连接 GitHub，选择 `qhfz_web` 仓库
4. 配置构建：
   - Build command: `cd hugo_blog && hugo --minify`
   - Output directory: `hugo_blog/public`
5. 点击 **Save and Deploy**

完成！访问分配的域名 `xxx.pages.dev` 即可。

详细步骤和其他静态托管选项（GitHub Pages、Vercel），参见 [docs/方案C-静态部署.md](docs/方案C-静态部署.md)。

---

## 项目结构

```
qhfz_web/
├── flask_api/          # Flask 后端 API
│   ├── app.py          # 主应用（留言板 + 统计）
│   ├── requirements.txt
│   ├── wsgi.py         # WSGI 入口
│   └── zeabur.toml     # Zeabur 部署配置
├── hugo_blog/          # Hugo 静态博客
│   ├── content/        # 博客文章（Markdown）
│   ├── layouts/        # 页面模板（HTML）
│   ├── static/         # 静态资源（CSS/JS/图片）
│   └── hugo.toml       # Hugo 配置
├── scripts/            # 部署脚本
│   ├── dev-local.sh    # 本地开发一键启动
│   └── deploy-linux.sh # 服务器一键部署
├── serverless/         # Serverless 部署文档
│   ├── cloudflare-worker.js  # Cloudflare Workers 版本
│   └── README.md       # 各平台部署指南
├── .github/workflows/  # GitHub Actions（方案 C 自动部署）
│   └── hugo.yml
└── docs/               # 文档
    ├── requirements.md     # 需求文档
    ├── 方案对比.md          # 方案详细对比
    └── 方案C-静态部署.md    # 极简静态部署指南
```

---

## API 接口

| 接口 | 方法 | 说明 |
|------|------|------|
| `/api/comments` | GET | 获取留言列表（`?page=/posts/xxx`） |
| `/api/comments` | POST | 提交留言 |
| `/api/stats` | GET | 获取页面访问统计 |
| `/api/stats/record` | POST | 记录页面访问 |
| `/api/health` | GET | 健康检查 |

### 示例请求

```bash
# 获取首页留言
curl "http://localhost:8080/api/comments?page=/"

# 提交留言
curl -X POST http://localhost:8080/api/comments \
  -H "Content-Type: application/json" \
  -d '{"nickname": "张三", "content": "你好！", "page": "/"}'

# 获取访问统计
curl "http://localhost:8080/api/stats?page=/"
```

---

## Hugo 主题

项目内置自定义浅色主题，clone 后即可运行，无需额外安装主题。

**学生可以自由修改样式：**
- 编辑 `hugo_blog/static/css/` 下的 CSS 文件调整配色、字体
- 修改 `hugo_blog/layouts/` 下的模板文件调整页面结构

如需切换到第三方主题（如 PaperMod），参见 [hugo_blog/THEME_GUIDE.md](hugo_blog/THEME_GUIDE.md)。

---

## 与原手册的区别

| 环节 | 原手册 | 本项目 |
|------|--------|--------|
| Flask 功能 | Hello World | 留言板 + 访客统计 API |
| Flask 与 Hugo | 无关联 | Hugo 调用 Flask API |
| 域名 | NameSilo 购买（~$3） | nip.io 免费 / 平台分配 |
| 服务管理 | Tmux 挂后台 | Systemd 服务（开机自启） |
| 运行用户 | root | 专用用户 qhfz（更安全） |
| 调试模式 | debug=True 上公网 | 环境变量控制，默认关闭 |
| 部署方式 | 手动逐步配置 | 一键脚本 / Git push |

详细对比参见 [docs/方案对比.md](docs/方案对比.md)。

---

## 常见问题

### Q: 方案 A 的 nip.io 域名是什么？

nip.io 是免费的通配符 DNS 服务。你的服务器 IP 是 `1.2.3.4`，那 `1.2.3.4.nip.io` 就会自动解析到这个 IP，无需购买域名或配置 DNS。

### Q: 为什么方案 A 不默认配置 HTTPS？

nip.io 是共享域名，Let's Encrypt 对同一域名有频率限制（每周 50 张证书）。多个学生同时申请可能失败。建议课堂上跳过 HTTPS，口头讲解原理；需要 HTTPS 的学生可自行购买域名。

### Q: 方案 B 有什么限制？

Zeabur 免费额度足够学习使用。如果流量较大，可能需要付费。Cloudflare Pages 免费额度更大，但需要将 Flask 改写为 Workers 格式。

---

## 开发说明

- Flask 端口：8080
- Hugo 端口：1313
- 数据库：`flask_api/blog.db`（SQLite）
- 日志：`sudo journalctl -u qhfz-api -f`（方案 A）

## 许可证

本项目仅供教学使用。

---

**清华附中 × 奇安信** | 2026 极智挑战智能安全科技冬令营
