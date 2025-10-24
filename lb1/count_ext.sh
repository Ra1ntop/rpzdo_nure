#!/usr/bin/env bash
# Використання: ./count_ext.sh <directory> <extension>
set -euo pipefail

if (( $# != 2 )); then
  echo "Usage: $0 <directory> <extension>" >&2
  exit 2
fi

DIR=$1
EXT=${2#.}

if [[ ! -d "$DIR" ]]; then
  echo "Error: directory not found: $DIR" >&2
  exit 2
fi

# Рекурсивно рахуємо звичайні файли з цим суфіксом
COUNT=$(find "$DIR" -type f -iname "*.${EXT}" -print | wc -l | tr -d ' ')

echo "Directory ${DIR} has ${COUNT} files with extension .${EXT}."
