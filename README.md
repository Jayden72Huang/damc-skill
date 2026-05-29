# DAMC — AI 时代个人价值评估器

> 不是恐吓你会被 AI 取代，而是帮你看清自己在 AI 时代的真实坐标。

**DAMC** 是一个跨 Agent 的 AI 能力评估工具。自动扫描你系统中**所有**已安装的 AI Agent 环境，从 4 个维度量化评估你在 AI 时代的位置。

## 支持的 AI Agent

| Agent | 安装方式 | 使用方式 |
|-------|---------|---------|
| **Claude Code** | `npx skills add Jayden72Huang/damc-skill` | `/damc` |
| **OpenAI Codex** | 一键安装脚本自动检测 | 说 "运行 DAMC 评估" |
| **Cursor** | 一键安装脚本自动检测 | Chat 中说 "运行 DAMC 评估" |
| **Windsurf** | 一键安装脚本自动检测 | Chat 中说 "运行 DAMC 评估" |
| **Continue** | 一键安装脚本自动检测 | Chat 中说 "运行 DAMC 评估" |
| **Aider** | 一键安装脚本自动检测 | 说 "运行 DAMC 评估" |
| **WorkBuddy** | 一键安装脚本自动检测 | 说 "运行 DAMC 评估" |
| **Trae** (字节) | 一键安装脚本自动检测 | Chat 中说 "运行 DAMC 评估" |
| **通义灵码** (阿里) | 一键安装脚本自动检测 | Chat 中说 "运行 DAMC 评估" |
| **MarsCode** (豆包) | 一键安装脚本自动检测 | Chat 中说 "运行 DAMC 评估" |
| **CodeGeeX** (智谱) | 一键安装脚本自动检测 | Chat 中说 "运行 DAMC 评估" |
| **Comate** (百度) | 一键安装脚本自动检测 | Chat 中说 "运行 DAMC 评估" |
| **DevChat** | 一键安装脚本自动检测 | 说 "运行 DAMC 评估" |

## DAMC 模型

| 维度 | 含义 | 核心问题 |
|------|------|---------|
| **D** — Distillation Value | 蒸馏价值 | 你的经验值得被蒸馏成 AI Skill 吗？ |
| **A** — Anti-Distillation | 抗蒸馏指数 | 你的哪些能力是 AI 拿不走的？ |
| **M** — AI Mastery | AI 驾驭力 | 你驾驭 AI 工具的水平如何？ |
| **C** — Career Compass | 职业适配 | 基于以上三维，你该往哪走？ |

## 一键安装（自动检测所有 Agent）

```bash
curl -fsSL https://raw.githubusercontent.com/Jayden72Huang/damc-skill/main/install.sh | bash
```

安装脚本会自动检测你系统中安装的所有 AI Agent，并为每个 Agent 安装 DAMC skill。

## Claude Code 安装

```bash
npx skills add Jayden72Huang/damc-skill
```

安装后输入 `/damc` 即可开始评估。

## 手动安装（任意 Agent）

```bash
git clone https://github.com/Jayden72Huang/damc-skill.git ~/.{your-agent}/skills/damc
```

然后在你的 Agent 中说："读取 SKILL.md 并执行 DAMC 评估"。

## 多 Agent 扫描

DAMC 会扫描你系统中**所有**已安装的 AI Agent，而不仅仅是当前运行的那个：

- 用 Claude Code 运行 `/damc`，也会扫描你的 Cursor、Codex 环境
- 多 Agent 用户会在 M 维度获得更高评分
- 报告会列出所有检测到的 Agent 及各自的配置深度

## 评估流程

1. **隐私告知** — 告知扫描范围，确认后才开始
2. **自动扫描** — 扫描所有 Agent 环境、git 历史、开发工具
3. **快速画像**（3 个问题）— 职业角色、核心产出、MBTI（可选）
4. **评分计算** — 基于扫描数据 + 角色推断，4 维度量化评分
5. **生成报告** — 本地 HTML + 可选上传到 damc.space 解锁完整分析

## 8 种 AI 时代画像

| 画像 | D | A | M | 风险等级 |
|------|---|---|---|---------|
| 🏆 AI 架构师 | 高 | 高 | 高 | 极低 |
| 🎯 待觉醒专家 | 高 | 高 | 低 | 中等 |
| ⚡ 效率怪兽 | 高 | 低 | 高 | 高 |
| 🚨 危险区 | 高 | 低 | 低 | 极高 |
| 🌟 AI 原生创造者 | 低 | 高 | 高 | 低 |
| 💎 未雕琢的钻石 | 低 | 高 | 低 | 中低 |
| 🔧 AI 工具人 | 低 | 低 | 高 | 中高 |
| 📚 探索者 | 低 | 低 | 低 | 看行动 |

## 评分公式

```
Overall = D × 0.25 + A × 0.30 + M × 0.25 + C × 0.20
```

A 维度权重最高（0.30），因为在 AI 时代，**不可替代性**是最核心的价值。

## 卸载

```bash
curl -fsSL https://raw.githubusercontent.com/Jayden72Huang/damc-skill/main/uninstall.sh | bash
```

## License

MIT
