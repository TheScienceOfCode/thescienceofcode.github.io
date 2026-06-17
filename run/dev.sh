#!/usr/bin/env bash

set -euo pipefail

RUN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$RUN_DIR/.." && pwd)"
SRC_DIR="$ROOT_DIR/src"
HUGO_BIN="$ROOT_DIR/.tools/hugo-0.158.0/hugo"
THEME_NODE_MODULES_DIR="$SRC_DIR/themes/hugoplate/node_modules"
PROJECT_NODE_MODULES_LINK="$SRC_DIR/node_modules"
PROJECT_NODE_MODULES_TARGET="themes/hugoplate/node_modules"
TAILWIND_BIN_DIR="$THEME_NODE_MODULES_DIR/.bin"
THEME_GENERATOR="$SRC_DIR/scripts/generate-theme-css.js"
GENERATED_THEME_CSS="$SRC_DIR/themes/hugoplate/assets/css/generated-theme.css"
DEV_PORT="${HUGO_PORT:-1313}"
DEV_BASE_URL="${HUGO_BASE_URL:-http://localhost:${DEV_PORT}/}"
FORCE_THEME_CSS=0

if [[ ! -x "$HUGO_BIN" ]]; then
  if command -v hugo >/dev/null 2>&1; then
    HUGO_BIN="$(command -v hugo)"
  else
    echo "Missing Hugo binary: $HUGO_BIN" >&2
    echo "Download Hugo 0.158.0 into .tools/hugo-0.158.0/ or install 'hugo' in PATH before running this script." >&2
    exit 1
  fi
fi

if [[ ! -d "$TAILWIND_BIN_DIR" ]]; then
  echo "Missing theme dependencies under src/themes/hugoplate/node_modules." >&2
  echo "Run: cd src/themes/hugoplate && npm install" >&2
  exit 1
fi

if [[ ! -e "$PROJECT_NODE_MODULES_LINK" ]]; then
  ln -s "$PROJECT_NODE_MODULES_TARGET" "$PROJECT_NODE_MODULES_LINK"
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

cd "$SRC_DIR"

exec "$HUGO_BIN" \
  --source "$SRC_DIR" \
  --destination "$ROOT_DIR/public" \
  "$@"
