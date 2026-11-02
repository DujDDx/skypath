#!/usr/bin/env bash
# Serve the landing page locally. Usage: ./start.sh [port]   (default 8765)
set -euo pipefail

PORT="${1:-8765}"
cd "$(dirname "$0")"

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 is required to start the server." >&2
  exit 1
fi

if lsof -ti tcp:"$PORT" >/dev/null 2>&1; then
  echo "Port $PORT is already in use. Try another one: ./start.sh 8080" >&2
  exit 1
fi

URL="http://localhost:$PORT/index.html"
echo "SkyPath landing page: $URL  (Ctrl+C to stop)"

# Open the browser if a launcher is available
(sleep 1; xdg-open "$URL" 2>/dev/null || open "$URL" 2>/dev/null || true) &

exec python3 -m http.server "$PORT"
