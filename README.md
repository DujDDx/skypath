# SkyPath Landing Page

SkyPath 官网落地页。样式直接取自 SkyPath 前端应用的全局设计系统，保证与产品内界面视觉一致。

## 目录结构

```
landingpage/
├── assets/
│   ├── SkyPath_logo.png   # 品牌 Logo（来自 frontend/public）
│   └── favicon.ico        # 站点图标
├── styles/
│   └── theme.css          # 全局设计系统：颜色、字体、间距、玻璃拟态组件
└── README.md
```

## 引入样式

```html
<link rel="stylesheet" href="./styles/theme.css" />
```

或在使用打包工具时：

```js
import './styles/theme.css'
```

## 设计系统速览

`styles/theme.css` 提供 CSS 变量与基础组件类，所有样式都通过变量引用，改主题只需覆盖 `:root`。

| 类别 | 变量 | 说明 |
|------|------|------|
| 背景 | `--bg-primary` `--bg-secondary` `--bg-tertiary` | 纯黑层次背景 |
| 文字 | `--text-primary` `--text-secondary` `--text-tertiary` | 高对比白字三级灰阶 |
| 强调色 | `--accent-white` `--accent-ice` `--accent-steel` `--accent-shadow` | 冷调单色 |
| 玻璃拟态 | `--glass-bg` `--glass-border` `--glass-blur` | 磨砂玻璃卡片 |
| 渐变 | `--gradient-cold-1` `--gradient-cold-2` `--gradient-shine` | 冷调微光渐变 |
| 圆角 | `--radius-xs` … `--radius-full` | 4px → 9999px |
| 间距 | `--spacing-xs` … `--spacing-2xl` | 4px → 48px |
| 字体 | `--font-family-base` `--font-family-mono` | 系统字体栈 |
| 动效 | `--transition-fast` `--transition-base` `--transition-spring` | 缓动曲线 |
| 光影 | `--glow-white` `--shadow-deep` `--shadow-float` | 发光与投影 |
| 弹窗 | `--dialog-*` | 遮罩、面板、按钮、输入框规格 |

可直接使用的类：

- `.glass-card` —— 磨砂玻璃卡片，带 hover 光泽扫过与上浮效果
- 全局重置、`body` 基础样式、极简滚动条

## 注意

- `theme.css` 中 `body { overflow: hidden }` 是产品内（全屏 3D 画布）的设置，落地页通常需要改为 `overflow-x: hidden` 或移除。
- 组件级样式（按钮、面板、列表等）目前以 `<style scoped>` 形式存在于 SkyPath 前端的 29 个 `.vue` 文件中，未复制到本仓库；如需复用某个组件的样式，可单独抽取。
- 来源仓库：`SkyPath-drone-path-visualization-main/frontend`。
