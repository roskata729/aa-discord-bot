#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${1:-$HOME/discord-bot}"
BRANCH="${2:-main}"
BOT_SERVICE_NAME="${BOT_SERVICE_NAME:-discord-bot}"

cd "$APP_DIR"

sudo systemctl stop "$BOT_SERVICE_NAME"
git pull --ff-only origin "$BRANCH"
. .venv/bin/activate
pip install -r requirements.txt
sudo systemctl start "$BOT_SERVICE_NAME"
