#!/usr/bin/env bash

set -euo pipefail

usage() {
  echo 'Usage: ./scripts/new-question.sh <question-slug> "Question title"' >&2
  exit 1
}

[[ $# -eq 2 ]] || usage

slug="$1"
title="$2"

if [[ ! "$slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  echo "Error: slug must be lowercase kebab-case (for example: design-url-shortener)." >&2
  exit 1
fi

if [[ -z "${title//[[:space:]]/}" ]]; then
  echo "Error: title cannot be empty." >&2
  exit 1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
template_dir="$repo_root/templates/system-design-question"
target_dir="$repo_root/questions/$slug"
index_file="$repo_root/questions/README.md"

if [[ -e "$target_dir" ]]; then
  echo "Error: question already exists: $target_dir" >&2
  exit 1
fi

cp -R "$template_dir" "$target_dir"

today="$(date +%Y-%m-%d)"
escaped_title="${title//&/\\&}"
escaped_title="${escaped_title//|/\\|}"

for file in "$target_dir"/*.md; do
  sed \
    -e "s|{{QUESTION_TITLE}}|$escaped_title|g" \
    -e "s|{{DATE}}|$today|g" \
    "$file" > "$file.tmp"
  mv "$file.tmp" "$file"
done

entry="- [$title](./$slug/)"
index_tmp="$index_file.tmp"
awk -v entry="$entry" '
  $0 == "<!-- questions -->" { print entry }
  { print }
' "$index_file" > "$index_tmp"
mv "$index_tmp" "$index_file"

echo "Created questions/$slug"
