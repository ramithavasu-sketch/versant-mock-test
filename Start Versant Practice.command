#!/bin/bash
# Opens the Versant practice app at http://localhost:8765 so Chrome remembers the microphone permission.
cd "$(dirname "$0")"
PORT=8765
if ! lsof -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  nohup python3 -m http.server $PORT --bind 127.0.0.1 >/dev/null 2>&1 &
  sleep 1
fi
open -a "Google Chrome" "http://localhost:$PORT/versant-mock-test.html"
