#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HUGO_BIN="$ROOT_DIR/.tools/hugo-0.158.0/hugo"
TAILWIND_BIN_DIR="$ROOT_DIR/themes/hugoplate/node_modules/.bin"

if [[ ! -x "$HUGO_BIN" ]]; then
  echo "Missing Hugo binary: $HUGO_BIN" >&2
  echo "Download Hugo 0.158.0 into .tools/hugo-0.158.0/ before running this script." >&2
  exit 1
fi

if [[ ! -d "$TAILWIND_BIN_DIR" ]]; then
  echo "Missing theme dependencies under themes/hugoplate/node_modules." >&2
  echo "Run: cd themes/hugoplate && npm install" >&2
  exit 1
fi

export PATH="$TAILWIND_BIN_DIR:$PATH"
export HUGO_CACHEDIR="$ROOT_DIR/.hugo_cache"

if [[ $# -eq 0 ]]; then
  set -- server -D
elif [[ "${1}" == -* ]]; then
  set -- server -D "$@"
fi

exec "$HUGO_BIN" "$@"
