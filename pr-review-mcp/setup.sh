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
echo "Add the following to your Claude Code MCP config (~/.claude/claude_desktop_config.json"
echo "or your project's .claude/settings.json under 'mcpServers'):"
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
