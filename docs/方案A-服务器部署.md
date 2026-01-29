# 方案 A：传统服务器部署指南

> **定位**：完整的服务器部署方案，保留核心教学价值，简化配置流程。
>
> **功能**：博客 + 留言板 + 访客统计（完整功能）

---

## 目录

1. [前置条件](#前置条件)
2. [快速部署（一键脚本）](#快速部署一键脚本)
3. [域名方案选择](#域名方案选择)
   - [方案 1：nip.io 免费域名（最简单）](#方案-1nipio-免费域名最简单)
   - [方案 2：Cloudflare Tunnel（免费 HTTPS）](#方案-2cloudflare-tunnel免费-https)
   - [方案 3：购买域名 + HTTPS（最完整）](#方案-3购买域名--https最完整)
4. [手动部署步骤](#手动部署步骤)
5. [常用管理命令](#常用管理命令)
6. [常见问题](#常见问题)

---

## 前置条件

### 服务器要求

- 一台 Linux 服务器（Ubuntu 20.04/22.04 推荐）
- 来源：阿里云 ECS / 腾讯云 / 其他云服务商
- 能够通过 SSH 连接

### 本地环境（可选，用于本地预览）

- Python 3.8+
- Hugo（`brew install hugo` 或从 [GitHub 下载](https://github.com/gohugoio/hugo/releases)）

---

## 快速部署（一键脚本）

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

### 步骤 3：运行部署脚本

```bash
chmod +x scripts/deploy-linux.sh
./scripts/deploy-linux.sh
```

脚本会自动完成：
1. ✅ 安装系统依赖（Python3、Nginx、Hugo）
2. ✅ 创建专用用户 `qhfz`（非 root 运行，更安全）
3. ✅ 配置 Flask API（Gunicorn + Systemd，开机自启）
4. ✅ 构建 Hugo 静态博客
5. ✅ 配置 Nginx 反向代理

### 步骤 4：访问网站

部署完成后，终端会显示访问地址：

```
博客地址: http://<你的IP>.nip.io
API 地址: http://<你的IP>.nip.io/api
```

**恭喜！** 到这里你的网站已经上线了，全球可访问。

---

## 域名方案选择

根据你的需求，选择以下三种域名方案之一：

| 方案 | 域名样式 | HTTPS | 成本 | 难度 | 适用场景 |
|-----|---------|-------|------|------|---------|
| **方案 1** | `123.45.67.89.nip.io` | ❌ | 免费 | ⭐ | 快速演示、课堂教学 |
| **方案 2** | `random-name.trycloudflare.com` | ✅ | 免费 | ⭐⭐ | 需要 HTTPS、长期使用 |
| **方案 3** | `www.yourname.com` | ✅ | ~$3 | ⭐⭐⭐ | 正式网站、完整教学 |

只有 Cloudflare Tunnel 需要 tmux，因为它是一个前台进程。

| 服务             | 断开 SSH 后      | 原因              |
|------------------|-----------------|-------------------|
| nip.io 网站      | ✅ 继续运行     | systemd 管理      |
| Cloudflare Tunnel | ❌ 会停止       | 需要 tmux 保持    |

---

### 方案 1：nip.io 免费域名（最简单）

**一键脚本默认使用此方案**，无需额外配置。

#### 什么是 nip.io？

nip.io 是一个"魔法 DNS"服务：
- `123.45.67.89.nip.io` → 自动解析到 `123.45.67.89`
- 无需注册、无需配置、完全免费、即时生效

#### 访问地址示例

假设你的服务器 IP 是 `123.45.67.89`：

```
博客首页: http://123.45.67.89.nip.io
留言板:   http://123.45.67.89.nip.io/guestbook/
API 接口: http://123.45.67.89.nip.io/api/health
```

#### 优点与缺点

| 优点 | 缺点 |
|-----|------|
| 零配置，即开即用 | 地址带 IP，不够美观 |
| 完全免费 | 无法配置 HTTPS |
| 适合教学演示 | 看起来不够"正式" |

---

### 方案 2：Cloudflare Tunnel（免费 HTTPS）

> **推荐**：需要 HTTPS 但不想买域名时的最佳选择。

#### 什么是 Cloudflare Tunnel？

Cloudflare Tunnel 可以将你的本地服务安全地暴露到互联网，自动提供：
- 免费子域名：`random-name.trycloudflare.com`
- 自动 HTTPS 证书
- 全球 CDN 加速
- DDoS 防护

#### 部署步骤

**步骤 1：安装 cloudflared**

```bash
# Ubuntu/Debian
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -o cloudflared.deb
sudo dpkg -i cloudflared.deb

# 或使用脚本（自动检测系统）
sudo ./scripts/setup-cloudflare-tunnel.sh install
```

**步骤 2：启动 Tunnel（快速模式）**

```bash
# 临时运行，获得随机域名
cloudflared tunnel --url http://localhost:80

# 输出类似：
# Your quick Tunnel has been created! Visit it at:
# https://random-words-here.trycloudflare.com
```

**步骤 3：使用 tmux 持久运行（推荐，无需登录）**

Quick Tunnel 不需要 Cloudflare 账号，用 tmux 可以让它在后台持续运行：

```bash
# 创建 tmux 会话
tmux new -s cloudflare

# 在 tmux 中启动 tunnel
cloudflared tunnel --url http://localhost:80

# 记下分配的域名后，按 Ctrl+b 然后按 d 离开会话（tunnel 继续运行）
```

**tmux 常用命令**：

```bash
tmux ls                    # 查看所有会话
tmux a -t cloudflare       # 重新进入会话
tmux kill-session -t cloudflare  # 关闭会话
```

> **注意**：Quick Tunnel 每次重启会生成新域名。如需固定域名，请使用方案 3（购买域名）或下方的"登录模式"。

**步骤 4（可选）：登录模式 - 固定域名**

如果需要固定域名，需要登录 Cloudflare 账号：

```bash
# 使用脚本一键配置
sudo ./scripts/setup-cloudflare-tunnel.sh service
```

#### 手动配置 Cloudflare Tunnel 服务（登录模式）

1. 创建配置文件：

```bash
sudo mkdir -p /etc/cloudflared
sudo tee /etc/cloudflared/config.yml > /dev/null <<EOF
tunnel: qhfz-tunnel
credentials-file: /etc/cloudflared/credentials.json
ingress:
  - service: http://localhost:80
EOF
```

2. 登录并创建 Tunnel（需要 Cloudflare 账号）：

```bash
cloudflared tunnel login
cloudflared tunnel create qhfz-tunnel
cloudflared tunnel route dns qhfz-tunnel your-subdomain.yourdomain.com
```

3. 安装为系统服务：

```bash
sudo cloudflared service install
sudo systemctl enable cloudflared
sudo systemctl start cloudflared
```

#### 访问地址示例

```
博客首页: https://abc-xyz-123.trycloudflare.com
留言板:   https://abc-xyz-123.trycloudflare.com/guestbook/
API 接口: https://abc-xyz-123.trycloudflare.com/api/health
```

#### 优点与缺点

| 优点 | 缺点 |
|-----|------|
| 自动 HTTPS | 随机域名（可通过账号绑定自定义域名） |
| 完全免费 | 需要安装 cloudflared |
| 全球 CDN 加速 | 依赖 Cloudflare 服务 |
| 无需公网 IP | - |

---

### 方案 3：购买域名 + HTTPS（最完整）

> **适用场景**：想要拥有自己的正式域名，或作为完整的教学案例。

#### 3.1 域名购买

推荐平台：**NameSilo**（便宜、隐私保护免费）

1. 访问 [namesilo.com](https://www.namesilo.com)
2. 注册账号
3. 搜索域名（建议控制在 $3 以下，如 `.cc`、`.xyz`、`.top`）
4. 支付（支持支付宝）

**价格参考**：
- `.cc` 域名：约 $2-3/年
- `.xyz` 域名：约 $1/年
- `.com` 域名：约 $10/年

#### 3.2 DNS 解析配置

1. 进入 NameSilo 域名管理页面
2. 找到 DNS 管理（DNS Manager）
3. 添加 A 记录：

| Type | Name | Value | TTL |
|------|------|-------|-----|
| A | @ | `<你的服务器IP>` | 3600 |
| A | www | `<你的服务器IP>` | 3600 |

4. 等待 DNS 生效（通常 5-30 分钟）

**验证 DNS 是否生效**：

```bash
# Windows
nslookup yourdomain.com

# Linux/Mac
dig yourdomain.com
```

#### 3.3 HTTPS 证书配置

我们使用 **Caddy** 替代传统的 Certbot + Nginx，实现自动 HTTPS。

**为什么用 Caddy？**
- 自动申请和续期 Let's Encrypt 证书
- 配置极简（3 行配置 vs Nginx 几十行）
- 内置反向代理

**步骤 1：安装 Caddy**

```bash
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy
```

**步骤 2：配置 Caddy**

```bash
# 停止 Nginx（Caddy 会接管 80/443 端口）
sudo systemctl stop nginx
sudo systemctl disable nginx

# 编辑 Caddy 配置
sudo tee /etc/caddy/Caddyfile > /dev/null <<EOF
yourdomain.com {
    # 静态博客
    root * /var/www/qhfz
    file_server

    # API 反向代理
    handle /api/* {
        reverse_proxy localhost:8080
    }
}
EOF

# 重启 Caddy
sudo systemctl restart caddy
```

**步骤 3：验证 HTTPS**

访问 `https://yourdomain.com`，浏览器应显示安全锁标志 🔒

#### 完整部署脚本（使用自定义域名）

```bash
# 设置你的域名
export MY_DOMAIN="yourdomain.com"

# 运行部署脚本（会提示是否使用自定义域名）
./scripts/deploy-linux.sh --domain $MY_DOMAIN --https
```

---

## 手动部署步骤

如果你想了解部署细节，或需要自定义配置，以下是手动部署步骤：

### 1. 安装系统依赖

```bash
sudo apt update
sudo apt install -y python3 python3-pip python3-venv nginx git
```

### 2. 安装 Hugo

```bash
wget -qO- https://github.com/gohugoio/hugo/releases/download/v0.121.0/hugo_0.121.0_linux-amd64.tar.gz | sudo tar xz -C /usr/local/bin hugo
hugo version
```

### 3. 克隆项目

```bash
cd /opt
git clone https://github.com/yourname/qhfz_web.git
cd qhfz_web
```

### 4. 配置 Flask API

```bash
cd /opt/qhfz_web/flask_api

# 创建虚拟环境
python3 -m venv venv
source venv/bin/activate

# 安装依赖
pip install -r requirements.txt
```

### 5. 创建专用用户

```bash
# 创建非 root 用户运行 Web 服务（安全最佳实践）
sudo useradd --system --no-create-home --shell /usr/sbin/nologin qhfz
sudo chown -R qhfz:qhfz /opt/qhfz_web/flask_api
```

### 6. 配置 Systemd 服务

```bash
sudo tee /etc/systemd/system/qhfz-api.service > /dev/null <<EOF
[Unit]
Description=QHFZ Flask API
After=network.target

[Service]
User=qhfz
Group=qhfz
WorkingDirectory=/opt/qhfz_web/flask_api
ExecStart=/opt/qhfz_web/flask_api/venv/bin/gunicorn -w 1 -b 127.0.0.1:8080 wsgi:application
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable qhfz-api
sudo systemctl start qhfz-api
```

### 7. 构建 Hugo 博客

```bash
cd /opt/qhfz_web/hugo_blog
hugo --minify

sudo mkdir -p /var/www/qhfz
sudo cp -r public/* /var/www/qhfz/
```

### 8. 配置 Nginx

```bash
SERVER_IP=$(curl -s ifconfig.me)
DOMAIN="${SERVER_IP}.nip.io"

sudo tee /etc/nginx/sites-available/qhfz > /dev/null <<EOF
server {
    listen 80;
    server_name ${DOMAIN};

    # 静态博客
    location / {
        root /var/www/qhfz;
        index index.html;
        try_files \$uri \$uri/ =404;
    }

    # API 反向代理
    location /api/ {
        proxy_pass http://127.0.0.1:8080/api/;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

sudo ln -sf /etc/nginx/sites-available/qhfz /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
```

---

## 常用管理命令

### API 服务管理

```bash
# 查看状态
sudo systemctl status qhfz-api

# 重启服务
sudo systemctl restart qhfz-api

# 查看实时日志
sudo journalctl -u qhfz-api -f

# 停止服务
sudo systemctl stop qhfz-api
```

### Hugo 博客更新

```bash
cd /opt/qhfz_web/hugo_blog

# 编辑文章后重新构建
hugo --minify
sudo cp -r public/* /var/www/qhfz/
```

### Nginx 管理

```bash
# 测试配置
sudo nginx -t

# 重新加载配置
sudo systemctl reload nginx

# 查看错误日志
sudo tail -f /var/log/nginx/error.log
```

### Cloudflare Tunnel 管理（如果使用方案 2）

```bash
# 查看状态
sudo systemctl status cloudflared

# 查看日志
sudo journalctl -u cloudflared -f

# 重启
sudo systemctl restart cloudflared
```

---

## 常见问题

### Q1: nip.io 域名是什么？安全吗？

nip.io 是一个公共的通配符 DNS 服务。它将 `<IP>.nip.io` 解析到对应的 IP 地址。

- **原理**：`123.45.67.89.nip.io` → DNS 查询返回 `123.45.67.89`
- **安全性**：nip.io 本身是安全的，但它是公开服务，不建议用于生产环境敏感数据
- **适用场景**：开发测试、教学演示、临时分享

### Q2: 为什么不默认配置 HTTPS？

1. **nip.io 的限制**：Let's Encrypt 对 nip.io 这类共享域名有频率限制（每周 50 张证书），多人同时申请可能失败
2. **教学简化**：HTTP 足以演示 Web 原理，HTTPS 原理可口头讲解
3. **可选升级**：需要 HTTPS 的用户可选择方案 2（Cloudflare Tunnel）或方案 3（自购域名）

### Q3: 服务器重启后网站还在吗？

**在**。部署脚本使用 Systemd 管理服务：
- `qhfz-api` 服务设置为开机自启（`systemctl enable`）
- 服务器重启后自动恢复，无需手动干预

这比原手册的 Tmux 方案更可靠。

### Q4: 如何更换域名？

1. **方案 1 → 方案 2/3**：
   ```bash
   # 修改 Nginx 配置中的 server_name
   sudo nano /etc/nginx/sites-available/qhfz
   # 修改 hugo.toml 中的 apiBase
   nano /opt/qhfz_web/hugo_blog/hugo.toml
   # 重新构建 Hugo
   cd /opt/qhfz_web/hugo_blog && hugo --minify
   sudo cp -r public/* /var/www/qhfz/
   # 重载 Nginx
   sudo systemctl reload nginx
   ```

2. **使用自定义域名重新部署**：
   ```bash
   ./scripts/deploy-linux.sh --domain yourdomain.com
   ```

### Q5: 如何查看留言数据？

留言存储在 SQLite 数据库中：

```bash
# 查看数据库位置
ls /opt/qhfz_web/flask_api/blog.db

# 查询留言（需要 sqlite3）
sqlite3 /opt/qhfz_web/flask_api/blog.db "SELECT * FROM comments;"
```

### Q6: API 报错 500 怎么排查？

```bash
# 1. 查看 API 日志
sudo journalctl -u qhfz-api -n 50

# 2. 检查服务状态
sudo systemctl status qhfz-api

# 3. 手动运行测试
cd /opt/qhfz_web/flask_api
source venv/bin/activate
python -c "from app import app; print('OK')"
```

### Q7: Cloudflare Tunnel 启动后看不到域名？

域名显示在启动日志的前几行，可能被后续日志刷掉了。解决方法：

```bash
# 方法 1：输出到文件
cloudflared tunnel --url http://localhost:80 2>&1 | tee /tmp/cf.log

# 在另一个终端查看域名
grep trycloudflare /tmp/cf.log
```

```bash
# 方法 2：在 tmux 中滚动查看历史
# 按 Ctrl+b 然后按 [ 进入滚动模式
# 用方向键往上滚动，找到 trycloudflare.com 那行
# 按 q 退出滚动模式
```

### Q8: Cloudflare Tunnel 脚本提示 Permission denied？

脚本没有执行权限，需要先添加：

```bash
chmod +x scripts/setup-cloudflare-tunnel.sh
./scripts/setup-cloudflare-tunnel.sh quick
```

### Q9: 如何停止 Cloudflare Tunnel？

```bash
# 如果在 tmux 中运行
tmux kill-session -t cloudflare

# 或者直接杀进程
pkill cloudflared

# 查看是否还有进程
ps aux | grep cloudflared
```

### Q10: tmux 里 Ctrl+C 不起作用？

tmux 的快捷键和普通终端不同：

| 操作 | 快捷键 |
|-----|--------|
| 停止程序 | 直接按 `Ctrl+C`（应该可以） |
| 离开会话（后台运行） | `Ctrl+b` 然后 `d` |
| 关闭当前窗口 | `Ctrl+b` 然后 `x` |
| 滚动查看历史 | `Ctrl+b` 然后 `[`，按 `q` 退出 |

如果 Ctrl+C 确实不行，打开新终端运行 `pkill cloudflared`。

### Q11: nip.io 手机打不开，电脑可以？

可能是手机网络的 DNS 解析问题。解决方法：

1. **直接用 IP 访问**：`http://你的服务器IP`
2. **用 Cloudflare Tunnel**：`trycloudflare.com` 域名 DNS 更稳定
3. **切换手机网络**：试试 WiFi 或换个运营商

### Q12: Quick Tunnel 域名能固定吗？

**不能**。Quick Tunnel 每次重启都会生成新的随机域名。

如需固定域名：
- **方案 A**：登录 Cloudflare 账号，创建命名 Tunnel
- **方案 B**：购买域名（方案 3）

---

## 与原手册的对比

| 环节 | 原手册 | 本方案 |
|-----|-------|-------|
| Flask 功能 | Hello World | 留言板 + 访客统计 API |
| Flask 与 Hugo | 无关联 | Hugo 调用 Flask API |
| 域名 | NameSilo 购买（~$3） | 三种选择（免费/免费HTTPS/购买） |
| DNS 配置 | 手动配置 + 等待 | nip.io 自动 / Cloudflare 自动 |
| 服务管理 | Tmux 挂后台 | Systemd 服务（开机自启） |
| 运行用户 | root | 专用用户 qhfz（更安全） |
| 调试模式 | debug=True 上公网 | 环境变量控制，默认关闭 |
| HTTPS | Certbot + DNS 验证 | 可选：Cloudflare Tunnel / Caddy |
| 部署方式 | 手动逐步配置 | 一键脚本 |

---

## 下一步

- 📝 **编辑博客内容**：修改 `hugo_blog/content/posts/` 下的 Markdown 文件
- 🎨 **自定义样式**：编辑 `hugo_blog/static/css/` 下的 CSS 文件
- 🔗 **分享你的网站**：把域名发给朋友访问！

如有问题，请查看 [常见问题](#常见问题) 或提交 Issue。
