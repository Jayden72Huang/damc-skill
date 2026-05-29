#!/usr/bin/env bash
# DAMC Skill Installer — multi-agent support
# Usage: curl -fsSL https://raw.githubusercontent.com/Jayden72Huang/damc-skill/main/install.sh | bash

set -euo pipefail

REPO_URL="https://github.com/Jayden72Huang/damc-skill.git"
TEMP_DIR=$(mktemp -d)

cleanup() { rm -rf "$TEMP_DIR"; }
trap cleanup EXIT

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║  DAMC — AI 时代个人价值评估器        ║"
echo "  ║  Installer v2.0 (Multi-Agent)        ║"
echo "  ╚══════════════════════════════════════╝"
echo ""

if ! command -v git &>/dev/null; then
  echo "  [!] 需要 git，请先安装"
  exit 1
fi

# Detect AI Agents
AGENTS_FOUND=0
INSTALL_TARGETS=""

echo "  [*] 检测 AI Agent 环境..."
echo ""

if [ -d "$HOME/.claude" ]; then
  echo "  ✓ Claude Code  (~/.claude/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS claude"
fi

if [ -d "$HOME/.codex" ] || command -v codex &>/dev/null 2>&1; then
  echo "  ✓ OpenAI Codex (~/.codex/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS codex"
fi

if [ -d "$HOME/.cursor" ]; then
  echo "  ✓ Cursor       (~/.cursor/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS cursor"
fi

if [ -d "$HOME/.codeium/windsurf" ]; then
  echo "  ✓ Windsurf     (~/.codeium/windsurf/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS windsurf"
fi

if [ -d "$HOME/.continue" ]; then
  echo "  ✓ Continue     (~/.continue/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS continue"
fi

if [ -f "$HOME/.aider.conf.yml" ] || command -v aider &>/dev/null 2>&1; then
  echo "  ✓ Aider"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS aider"
fi

if [ -d "$HOME/.workbuddy" ]; then
  echo "  ✓ WorkBuddy   (~/.workbuddy/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS workbuddy"
fi

if [ -d "$HOME/.trae" ]; then
  echo "  ✓ Trae         (~/.trae/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS trae"
fi

if [ -d "$HOME/.lingma" ]; then
  echo "  ✓ 通义灵码     (~/.lingma/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS lingma"
fi

if [ -d "$HOME/.marscode" ]; then
  echo "  ✓ MarsCode     (~/.marscode/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS marscode"
fi

if [ -d "$HOME/.codegeex" ]; then
  echo "  ✓ CodeGeeX     (~/.codegeex/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS codegeex"
fi

if [ -d "$HOME/.comate" ]; then
  echo "  ✓ Comate       (~/.comate/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS comate"
fi

if [ -d "$HOME/.chat" ]; then
  echo "  ✓ DevChat      (~/.chat/)"
  AGENTS_FOUND=$((AGENTS_FOUND + 1))
  INSTALL_TARGETS="$INSTALL_TARGETS devchat"
fi

echo ""

if [ "$AGENTS_FOUND" -eq 0 ]; then
  echo "  [!] 未检测到任何 AI Agent 环境"
  echo "      支持: Claude Code, Codex, Cursor, Windsurf, Continue, Aider, WorkBuddy"
  echo ""
  echo "  手动安装："
  echo "    git clone $REPO_URL /path/to/your/agent/skills/damc"
  exit 1
fi

echo "  [*] 检测到 $AGENTS_FOUND 个 AI Agent，正在下载..."
git clone --quiet --depth 1 "$REPO_URL" "$TEMP_DIR/damc-skill"

install_skill() {
  local target_dir="$1"
  local agent_name="$2"
  mkdir -p "$target_dir/references" "$target_dir/templates"
  [ -f "$target_dir/SKILL.md" ] && rm -f "$target_dir/SKILL.md"
  cp "$TEMP_DIR/damc-skill/SKILL.md" "$target_dir/"
  cp "$TEMP_DIR/damc-skill/references/"* "$target_dir/references/"
  cp "$TEMP_DIR/damc-skill/templates/"* "$target_dir/templates/"
  echo "  [OK] $agent_name → $target_dir"
}

for agent in $INSTALL_TARGETS; do
  case "$agent" in
    claude)   mkdir -p "$HOME/.claude/skills";             install_skill "$HOME/.claude/skills/damc" "Claude Code" ;;
    codex)    mkdir -p "$HOME/.codex/skills";              install_skill "$HOME/.codex/skills/damc" "Codex" ;;
    cursor)   mkdir -p "$HOME/.cursor/skills";             install_skill "$HOME/.cursor/skills/damc" "Cursor" ;;
    windsurf) mkdir -p "$HOME/.codeium/windsurf/skills";   install_skill "$HOME/.codeium/windsurf/skills/damc" "Windsurf" ;;
    continue) mkdir -p "$HOME/.continue/skills";           install_skill "$HOME/.continue/skills/damc" "Continue" ;;
    aider)    mkdir -p "$HOME/.aider/skills";              install_skill "$HOME/.aider/skills/damc" "Aider" ;;
    workbuddy)mkdir -p "$HOME/.workbuddy/skills";          install_skill "$HOME/.workbuddy/skills/damc" "WorkBuddy" ;;
    trae)     mkdir -p "$HOME/.trae/skills";               install_skill "$HOME/.trae/skills/damc" "Trae" ;;
    lingma)   mkdir -p "$HOME/.lingma/skills";             install_skill "$HOME/.lingma/skills/damc" "通义灵码" ;;
    marscode) mkdir -p "$HOME/.marscode/skills";           install_skill "$HOME/.marscode/skills/damc" "MarsCode" ;;
    codegeex) mkdir -p "$HOME/.codegeex/skills";           install_skill "$HOME/.codegeex/skills/damc" "CodeGeeX" ;;
    comate)   mkdir -p "$HOME/.comate/skills";             install_skill "$HOME/.comate/skills/damc" "Comate" ;;
    devchat)  mkdir -p "$HOME/.chat/skills";               install_skill "$HOME/.chat/skills/damc" "DevChat" ;;
  esac
done

echo ""
echo "  ════════════════════════════════════════"
echo "  DAMC 安装成功! ($AGENTS_FOUND 个 Agent)"
echo "  ════════════════════════════════════════"
echo ""
echo "  使用方法:"
echo "    Claude Code  → /damc"
echo "    其他 Agent   → 说「运行 DAMC 评估」"
echo ""
echo "  报告生成到 ~/Desktop/DAMC-Report-{日期}.html"
echo "  上传到 damc.space 解锁完整分析和团队排名"
echo ""
