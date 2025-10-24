#!/usr/bin/env bash
# Створює директорію з назвою поточної дати у форматі YYYY-MM-DD у поточному каталозі.

set -euo pipefail

DIRNAME=$(date +%F)   # напр. 2025-10-24

if [[ -d "$DIRNAME" ]]; then
  echo "Directory exists: ${DIRNAME}"
else
  mkdir -p "$DIRNAME"
  echo "Created directory: ${DIRNAME}"
fi
