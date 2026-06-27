#!/bin/bash
set -euo pipefail

DB_NAME="ecommerce"
DB_USER="$(whoami)"
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
QUERIES_DIR="$BASE_DIR/queries"

for sql_file in "$QUERIES_DIR"/*.sql; do
  if [ -f "$sql_file" ]; then
    echo "Running $(basename "$sql_file")..."
    psql -U "$DB_USER" -d "$DB_NAME" -f "$sql_file"
    echo
  fi
done
