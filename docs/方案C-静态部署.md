# 方案 C：极简静态部署（推荐入门）

> **零成本、零服务器、10 分钟上线**

## 概述

如果你只需要一个静态博客（不需要留言板和访客统计），这是最简单的方案。

| 特性 | 说明 |
|------|------|
| 成本 | **完全免费** |
| 难度 | ⭐（最简单） |
| 功能 | 博客文章、关于页面 |
| 不支持 | 留言板、访客统计（需要后端） |

## 平台对比

| 平台 | 国内访问 | 免费额度 | 推荐度 |
|------|----------|----------|--------|
| **Cloudflare Pages** | ⚠️ 部分地区可访问 | 无限流量 | ⭐⭐⭐ |
| **GitHub Pages** | ⚠️ 部分地区较慢 | 1GB 存储 | ⭐⭐ |
| Vercel | ❌ 默认域名被墙 | 100GB/月 | ⭐（需自定义域名） |

---

## 方案 C-1：Cloudflare Pages（推荐）

### 为什么选 Cloudflare

- **完全免费**，无限流量
- **全球 CDN** 加速
- **Git 推送自动部署**
- 国内部分地区可直接访问（比 Vercel 好）

### 部署步骤

#### 第 1 步：注册 Cloudflare

1. 访问 [cloudflare.com](https://cloudflare.com)
2. 注册账号（免费）

#### 第 2 步：连接 GitHub

1. 进入 Cloudflare 控制台
2. 左侧菜单选择 **Workers & Pages**
3. 点击 **Create** → **Pages** → **Connect to Git**
4. 授权 GitHub，选择你的 `qhfz_web` 仓库

#### 第 3 步：配置构建

| 配置项 | 值 |
|--------|-----|
| Production branch | `main` |
| Build command | `cd hugo_blog && hugo --minify` |
| Build output directory | `hugo_blog/public` |

点击 **Save and Deploy**。

#### 第 4 步：等待部署

首次部署需要 1-2 分钟。完成后你会得到一个域名：

```
https://qhfz-web-xxx.pages.dev
```

#### 第 5 步：更新博客

```bash
# 1. 编辑文章
vim hugo_blog/content/posts/my-new-post.md

# 2. 推送到 GitHub
git add .
git commit -m "新增文章"
git push

# 3. Cloudflare 自动部署（约 1 分钟）
```

---

## 方案 C-2：GitHub Pages

### 部署步骤

#### 第 1 步：创建 GitHub Actions 配置

在仓库中创建 `.github/workflows/hugo.yml`：

```yaml
name: Deploy Hugo to GitHub Pages

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

defaults:
  run:
    shell: bash

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v3
        with:
          hugo-version: 'latest'
          extended: true

      - name: Build
        run: |
          cd hugo_blog
          hugo --minify

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./hugo_blog/public

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

#### 第 2 步：启用 GitHub Pages

1. 进入仓库 **Settings** → **Pages**
2. Source 选择 **GitHub Actions**
3. 推送代码触发部署

#### 第 3 步：访问网站

部署完成后访问：

```
https://<你的用户名>.github.io/qhfz_web/
```

---

## 常见问题

### Q: 国内访问不了怎么办？

A: 几个选项：
1. **Cloudflare Pages** 通常比 GitHub Pages 好一些
2. 绑定自定义域名（需购买域名）
3. 使用国内 OSS 静态托管（需备案域名）

### Q: 想要留言板功能怎么办？

A: 静态网站可以集成第三方评论系统：
- **Giscus**（基于 GitHub Discussions，免费）
- **Utterances**（基于 GitHub Issues，免费）
- **Disqus**（有广告）

示例：在 Hugo 模板中添加 Giscus：

```html
<!-- layouts/partials/comments.html -->
<script src="https://giscus.app/client.js"
        data-repo="你的用户名/qhfz_web"
        data-repo-id="你的仓库ID"
        data-category="Announcements"
        data-category-id="你的分类ID"
        data-mapping="pathname"
        data-strict="0"
        data-reactions-enabled="1"
        data-emit-metadata="0"
        data-input-position="bottom"
        data-theme="light"
        data-lang="zh-CN"
        crossorigin="anonymous"
        async>
</script>
```

### Q: 想要访客统计怎么办？

A: 可以使用免费的第三方统计：
- **Umami**（开源，自托管或用云服务）
- **Google Analytics**（免费）
- **百度统计**（国内友好）
- **51.la**（国内服务）

---

## 与其他方案对比

| 对比项 | 方案 A（服务器） | 方案 B（Serverless） | 方案 C（静态） |
|--------|------------------|---------------------|----------------|
| 成本 | 服务器费用 | 免费/低成本 | **完全免费** |
| 难度 | ⭐⭐⭐ | ⭐⭐ | **⭐** |
| 留言板 | ✅ 自带 | ✅ 自带 | ⚠️ 需第三方 |
| 访客统计 | ✅ 自带 | ✅ 自带 | ⚠️ 需第三方 |
| 教学价值 | 最高 | 中等 | 最低 |
| 适合场景 | 课堂教学 | 课后自用 | **快速体验** |

---

## 总结

**方案 C 适合：**
- 只想快速搭建个人博客
- 不需要留言板/统计等动态功能
- 追求零成本、零维护

**不适合：**
- 需要学习服务器部署（用方案 A）
- 需要完整功能（用方案 B）
