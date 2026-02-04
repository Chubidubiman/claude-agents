#!/bin/bash

echo "⚡ Quick Update"

./scripts/sync_from_claude.sh

if [[ -z $(git status -s) ]]; then
    echo "✅ No hay cambios"
    exit 0
fi

git add agents/
git commit -m "Update agents: $(date +'%Y-%m-%d %H:%M')"
git push

echo "✅ Cambios sincronizados a GitHub"
