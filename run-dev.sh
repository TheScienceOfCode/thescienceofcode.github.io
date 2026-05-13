#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HUGO_BIN="$ROOT_DIR/.tools/hugo-0.158.0/hugo"
TAILWIND_BIN_DIR="$ROOT_DIR/themes/hugoplate/node_modules/.bin"
THEME_GENERATOR="$ROOT_DIR/themes/hugoplate/scripts/themeGenerator.js"
GENERATED_THEME_CSS="$ROOT_DIR/assets/css/generated-theme.css"
DEV_PORT="${HUGO_PORT:-1313}"
DEV_BASE_URL="${HUGO_BASE_URL:-http://localhost:${DEV_PORT}/}"
FORCE_THEME_CSS=0

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

while [[ $# -gt 0 ]]; do
  case "$1" in
    --force-theme-css)
      FORCE_THEME_CSS=1
      shift
      ;;
    *)
      break
      ;;
  esac
done

if [[ ! -f "$GENERATED_THEME_CSS" || "$FORCE_THEME_CSS" -eq 1 ]]; then
  echo "Generating theme CSS..."
  node "$THEME_GENERATOR"
fi

export PATH="$TAILWIND_BIN_DIR:$PATH"
export HUGO_CACHEDIR="$ROOT_DIR/.hugo_cache"

if [[ $# -eq 0 ]]; then
  set -- server -D --baseURL "$DEV_BASE_URL" --port "$DEV_PORT"
elif [[ "${1}" == -* ]]; then
  set -- server -D --baseURL "$DEV_BASE_URL" --port "$DEV_PORT" "$@"
elif [[ "${1}" == "server" || "${1}" == "serve" ]]; then
  shift
  set -- server -D --baseURL "$DEV_BASE_URL" --port "$DEV_PORT" "$@"
fi

exec "$HUGO_BIN" "$@"
