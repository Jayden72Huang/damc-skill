#!/usr/bin/env bash
# DAMC Skill Uninstaller — multi-agent support

set -euo pipefail

echo ""
echo "  [*] 正在卸载 DAMC skill..."

REMOVED=0

for dir in \
  "$HOME/.claude/skills/damc" \
  "$HOME/.codex/skills/damc" \
  "$HOME/.cursor/skills/damc" \
  "$HOME/.codeium/windsurf/skills/damc" \
  "$HOME/.continue/skills/damc" \
  "$HOME/.aider/skills/damc" \
  "$HOME/.workbuddy/skills/damc" \
  "$HOME/.trae/skills/damc" \
  "$HOME/.lingma/skills/damc" \
  "$HOME/.marscode/skills/damc" \
  "$HOME/.codegeex/skills/damc" \
  "$HOME/.comate/skills/damc" \
  "$HOME/.chat/skills/damc"; do
  if [ -d "$dir" ]; then
    rm -rf "$dir"
    echo "  [OK] 已移除: $dir"
    REMOVED=$((REMOVED + 1))
  fi
done

if [ "$REMOVED" -eq 0 ]; then
  echo "  [*] 未找到 DAMC skill 安装"
else
  echo ""
  echo "  [OK] 已从 $REMOVED 个 Agent 中卸载"
fi
echo ""
