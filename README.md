# SkyPath Landing Page

SkyPath 官网落地页。样式直接取自 SkyPath 前端应用：全局设计系统 + 从 29 个 `.vue` 组件中抽取的 scoped 组件样式，保证与产品内界面视觉一致。

## 目录结构

```
landingpage/
├── assets/
│   ├── SkyPath_logo.png   # 品牌 Logo（来自 frontend/public）
│   └── favicon.ico        # 站点图标
├── styles/
│   ├── theme.css          # 全局设计系统：颜色、字体、间距、玻璃拟态组件
│   └── components/        # 29 个组件的样式，按组件名一一对应
│       ├── Login.css
│       ├── KPIPanel.css
│       ├── ConfirmDialog.css
│       └── …
└── README.md
```

## 本地预览

```bash
./start.sh        # 默认端口 8765，可传入其他端口：./start.sh 8080
```

然后访问 `http://localhost:8765/index.html`。请通过 HTTP 访问，直接用 `file://` 打开可能无法加载样式。

## 引入样式

```html
<link rel="stylesheet" href="./styles/theme.css" />
<link rel="stylesheet" href="./styles/components/Login.css" />
```

或在使用打包工具时：

```js
import './styles/theme.css'
import './styles/components/Login.css'
```

`theme.css` 必须先于 `components/` 下的文件加载——组件样式大量引用其中的 CSS 变量。

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

## 组件样式（styles/components/）

从 `SkyPath-drone-path-visualization-main/frontend/src` 的 29 个 `.vue` 文件中抽取，每个文件对应一个组件，文件名即组件名；文件头注释标明原始路径。

| 分组 | 文件 |
|------|------|
| 页面 | `Home.css` `Login.css` `Upload.css` `Visualize.css` |
| KPI | `CalculationStatus.css` `CollisionDetails.css` `ConfigParamsPanel.css` `KPIHeader.css` `KPIPanel.css` `MissionOverview.css` `PlaybackMissionOverview.css` `SafetyDetails.css` `ViewpointDetails.css` `WaypointDetailGroup.css` `WaypointDetails.css` |
| 通用组件 | `AutoFixFailedDialog.css` `AutoFixSuccessDialog.css` `ConfirmDialog.css` `ProjectNameDialog.css` |
| 上传 | `DroneLoading.css` `FileUploadZone.css` `ParticleBackground.css` |
| 可视化 | `AxisGizmo.css` `BuildingHighlighter.css` `CameraFrustum.css` `PlaybackTimeline.css` `VisualizeControlPanel.css` `WaypointListPanel.css` `WelcomeGuide.css` |

### 抽取说明

- **已移除 Vue 的 scoped 作用域**：原样式经 Vue 编译后会附加 `data-v-*` 属性选择器，这里给出的是编译前的裸选择器，需配合相同 class 结构使用。
- `VisualizeControlPanel.css` 中原有的 `:deep(.waypoint-style-panel)` 已展开为普通选择器 `.waypoint-style-panel`。
- `BuildingHighlighter.css`、`CameraFrustum.css` 的原始样式块只有注释（样式写在 Three.js 材质参数里），因此内容为空占位。
- scoped 样式里的选择器依赖组件内部 class 名（如 `.kpi-panel__row`），复用某个组件时需同时沿用其模板结构。
- 样式大量依赖 `theme.css` 的变量，单独引用组件文件而不引 `theme.css` 会导致颜色/圆角失效。

## 注意

- `theme.css` 中 `body { overflow: hidden }` 是产品内（全屏 3D 画布）的设置，落地页通常需要改为 `overflow-x: hidden` 或移除。
- 来源仓库：`SkyPath-drone-path-visualization-main/frontend`。
