#!/usr/bin/env bash
set -euo pipefail

LOG="server.log"

cat > "$LOG" << 'EOF'
INFO Startup complete
WARN Low disk space
ERROR Failed to connect to database
INFO User login succeeded
ERROR Timeout while contacting service
INFO Health check OK
ERROR Invalid credentials provided
EOF

COUNT=$(grep -c "Error" "$LOG" || true)

echo "Created $LOG"
echo "Lines containing 'Error': $COUNT"
