#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Creating virtual environment..."
python3 -m venv .venv

echo "Installing dependencies..."
.venv/bin/pip install --quiet -r requirements.txt

PYTHON="$SCRIPT_DIR/.venv/bin/python"
SERVER="$SCRIPT_DIR/server.py"

echo ""
echo "Setup complete!"
echo ""
echo "Add the following to your Claude Code MCP config (~/.claude.json under 'mcpServers'"
echo "for global, or .claude/settings.json under 'mcpServers' for per-project):"
echo ""
cat <<EOF
{
  "mcpServers": {
    "pr-review": {
      "command": "$PYTHON",
      "args": ["$SERVER"]
    }
  }
}
EOF
