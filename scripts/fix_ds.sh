#!/usr/bin/env bash
set -eu
cd /Users/chaoyi/Documents/Typst/typst_dev/better-thesis
orig=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "HEAD")
branches=$(git for-each-ref --format='%(refname:short)' refs/heads)
for b in $branches; do
  echo "--- processing branch: $b ---"
  git checkout "$b"
  if [ -f .gitignore ]; then
    if ! grep -qi '\.DS_Store' .gitignore; then
      printf '\n# macOS\n.DS_Store\n' >> .gitignore
      git add .gitignore
      git commit -m "gitignore: ignore macOS .DS_Store" || true
      echo "  updated .gitignore on $b"
    else
      echo "  .gitignore already contains .DS_Store on $b"
    fi
  else
    printf '# macOS\n.DS_Store\n' > .gitignore
    git add .gitignore
    git commit -m "gitignore: ignore macOS .DS_Store" || true
    echo "  created .gitignore on $b"
  fi
  removed=$(git ls-files | grep -i '\\.DS_Store' || true)
  if [ -n "$removed" ]; then
    echo "  removing tracked files:"
    printf '%s\n' "$removed"
    git rm --cached $removed || true
    git commit -m "Remove tracked .DS_Store files" || true
  else
    echo "  no tracked .DS_Store files on $b"
  fi
done
# return to original branch
git checkout "$orig"
