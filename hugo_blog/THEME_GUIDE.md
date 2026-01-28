# 主题切换指南

本项目提供两种样式方案：

## 方案 1：Anthropic 风格（默认）

当前使用的自定义样式，特点：
- 浅色、简洁、有呼吸感
- Anthropic 品牌配色
- 中文衬线/无衬线字体搭配
- 无需安装额外主题

**文件**：`static/css/style.css`

## 方案 2：PaperMod 主题（备选）

流行的 Hugo 主题，特点：
- 成熟稳定，功能丰富
- 支持深色/浅色切换
- 内置搜索、目录等功能

### 切换步骤

```bash
# 1. 备份当前配置
mv hugo.toml hugo.toml.custom

# 2. 使用主题配置
mv hugo.toml.papermod hugo.toml

# 3. 安装主题
git init  # 如果还没初始化
git submodule add https://github.com/adityatelange/hugo-PaperMod themes/PaperMod

# 4. 启动预览
hugo server
```

### 切换回自定义样式

```bash
mv hugo.toml hugo.toml.papermod
mv hugo.toml.custom hugo.toml
```
