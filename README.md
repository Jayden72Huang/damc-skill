# DAMC — AI 时代个人价值评估器

> 不是恐吓你会被 AI 取代，而是帮你看清自己在 AI 时代的真实坐标。

一个 Claude Code Skill，自动扫描你的 `.claude/` 环境（CLAUDE.md、skills、hooks、memory、MCP、git 历史），从 4 个维度量化评估你在 AI 时代的位置，并生成可分享的可视化 HTML 报告。

## DAMC 模型

| 维度 | 全称 | 核心问题 |
|------|------|---------|
| **D** | Distillation Value | 你的经验值得被蒸馏成 AI Skill 吗？ |
| **A** | Anti-Distillation | 你的哪些能力是 AI 拿不走的？ |
| **M** | AI Mastery | 你驾驭 AI 工具的水平如何？ |
| **C** | Career Compass | 基于以上三维，你该往哪走？ |

## 安装

把这个仓库放到 Claude Code 的 skills 目录：

```bash
git clone https://github.com/Jayden72Huang/damc-skill.git ~/.claude/skills/damc
```

或者手动下载，放到 `~/.claude/skills/damc/`，确保目录结构是：

```
~/.claude/skills/damc/
├── SKILL.md
├── references/
│   ├── career-archetypes.md
│   └── scoring-framework.md
└── templates/
    └── report.html
```

## 使用

打开 Claude Code，输入以下任意一种触发方式：

- `/damc`
- "评估我的价值"
- "蒸馏我"
- "我会被 AI 取代吗"
- "我的 AI 水平怎么样"

Skill 会：

1. **自动扫描** 你的 `~/.claude/` 环境和 git 历史（不需要你做任何事）
2. **只问 3 个问题**：你的角色、核心产出、MBTI（可选）
3. **生成可视化 HTML 报告**，保存到 `~/Desktop/DAMC-Report-{日期}.html`

打开 HTML 即可查看 4 个维度评分、画像匹配、行动建议，可以直接分享给朋友或发到社交平台。

## 评分原则

- **M 维度**（AI 驾驭）100% 基于自动扫描，客观量化
- **D 维度**（蒸馏价值）70% 自动扫描 + 30% 角色推断
- **A 维度**（抗蒸馏）40% 自动扫描 + 60% 角色推断
- **C 维度**（职业适配）= f(D, A, M) + MBTI 调整
- 整体评分 = D×0.25 + A×0.30 + M×0.25 + C×0.20

A 维度权重最高 — 因为抗蒸馏能力是 AI 时代最核心的竞争力。

## 8 种 AI 时代画像

评估完成后会匹配到其中一种：

🏆 AI 架构师 · 🛠️ AI 工匠 · 🧭 AI 引路人 · 🎨 创意原住民
📚 经验沉淀者 · 🚀 AI 早期玩家 · 🌱 待觉醒者 · ⚠️ 高危区

## License

MIT — 随便用，欢迎二次开发。
