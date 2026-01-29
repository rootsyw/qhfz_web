# 清华附中冬令营网站搭建项目

清华附中与奇安信集团联合举办的「极智挑战」智能安全科技冬令营 - 网站搭建教学项目。

> **给老师的话：** 本项目是原手册的改进版，去掉了约 70% 的配置冗余，保留了核心教学价值。两套方案的差异和设计思路，请参见 [docs/方案对比.md](docs/方案对比.md)。

---

## 项目简介

本项目提供**三套网站搭建方案**：

| | 方案 A | 方案 B | 方案 C |
|--|-------|-------|-------|
| **名称** | 传统服务器版 | Zeabur 动态版 | Cloudflare 静态版 |
| **功能** | 完整（博客+留言板） | 完整（博客+留言板） | **仅博客** |
| **技术栈** | Flask + Hugo + Nginx | Flask + Hugo + Zeabur | Hugo + Cloudflare |
| **服务器** | 需要 Linux | 不需要 | 不需要 |
| **成本** | 服务器费用 | 免费/低成本 | **完全免费** |
| **难度** | ⭐⭐⭐ | ⭐⭐ | ⭐ |

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

## 方案 A：传统服务器部署

> 适合课堂教学，学生需要有一台 Linux 服务器（DataCon 平台分配 或 自购阿里云 ECS）
>
> **详细文档**：[docs/方案A-服务器部署.md](docs/方案A-服务器部署.md)

### 快速部署（3 步）

```bash
# 1. SSH 连接服务器
ssh root@<你的服务器IP>

# 2. 克隆项目
cd /opt
git clone https://github.com/yourname/qhfz_web.git
cd qhfz_web

# 3. 一键部署
chmod +x scripts/deploy-linux.sh
./scripts/deploy-linux.sh
```

部署完成后访问：`http://<你的IP>.nip.io`

### 域名方案选择

| 方案 | 命令 | 效果 |
|-----|------|------|
| **nip.io**（默认） | `./scripts/deploy-linux.sh` | `http://IP.nip.io` |
| **Cloudflare Tunnel** | `./scripts/setup-cloudflare-tunnel.sh quick` | `https://xxx.trycloudflare.com` |
| **自定义域名 + HTTPS** | `./scripts/deploy-linux.sh --domain example.com --https` | `https://example.com` |

### 常用管理命令

```bash
sudo systemctl status qhfz-api    # 查看 API 状态
sudo systemctl restart qhfz-api   # 重启 API
sudo journalctl -u qhfz-api -f    # 查看日志
```

---

## 方案 B：Zeabur 完整部署（动态版）

> 完整功能：博客 + 留言板 + 访客统计

### 架构说明

方案 B 需要在 Zeabur 部署**两个服务**：

```
Zeabur 项目
├── Flask API 服务 ──→ api.xxx.zeabur.app（后端接口）
└── Hugo 博客服务 ──→ blog.xxx.zeabur.app（前端页面）
```

### 步骤 1：Fork 项目

在 GitHub 上 Fork 本项目到你的账号。

### 步骤 2：部署 Flask API

1. 注册 [Zeabur](https://zeabur.com) 账号
2. 创建新项目 → 选择 "从 Git 部署"
3. 连接 GitHub，选择 `qhfz_web` 仓库
4. **Root Directory 设为 `flask_api`**
5. 部署完成后，在"网络"标签绑定域名，记下 API 地址

### 步骤 3：部署 Hugo 博客

1. 在**同一个 Zeabur 项目**中，点击 "添加服务" → "从 Git 部署"
2. 选择同一个 `qhfz_web` 仓库
3. **Root Directory 设为 `hugo_blog`**
4. Zeabur 会自动识别 Hugo 并构建
5. 部署完成后，绑定域名

### 步骤 4：配置 API 地址

修改 `hugo_blog/hugo.toml`，将 `apiBase` 改为步骤 2 的 API 地址：

```toml
[params]
  apiBase = 'https://你的api域名.zeabur.app'
```

推送后 Zeabur 会自动重新部署 Hugo 服务。

> **常见问题**：详见 [serverless/README.md](serverless/README.md#zeabur-常见问题排查)

---

## 方案 C：Cloudflare Pages 静态部署

> **零成本、纯静态** — 只有博客，无留言功能

### 步骤 1：Fork 项目

在 GitHub 上 Fork 本项目。

### 步骤 2：部署到 Cloudflare Pages

1. 访问 [cloudflare.com](https://cloudflare.com) 注册
2. 进入 **Workers & Pages** → **Create** → **Pages**
3. 连接 GitHub，选择 `qhfz_web` 仓库
4. **Framework preset** 选择 `Hugo`
5. **Root directory** 填 `hugo_blog`
6. 点击 **Save and Deploy**

完成！访问分配的域名 `xxx.pages.dev` 即可。

> **注意**：方案 C 无后端，留言板页面不会显示任何内容。如需留言功能，请使用方案 B。

详细步骤参见 [docs/方案C-静态部署.md](docs/方案C-静态部署.md)。

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
