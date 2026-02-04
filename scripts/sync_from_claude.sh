#!/bin/bash

SOURCE="$HOME/.claude"
TARGET="$(pwd)"

echo "🔄 Sincronizando desde ~/.claude..."

# Copiar solo lo necesario
cp -r "$SOURCE/agents" "$TARGET/" 2>/dev/null
cp -r "$SOURCE/plugins" "$TARGET/" 2>/dev/null
cp -r "$SOURCE/todos" "$TARGET/" 2>/dev/null

# Copiar projects pero SIN datos sensibles
if [ -d "$SOURCE/projects" ]; then
    mkdir -p "$TARGET/projects"
    # Copiar solo archivos .json y .md (excluir datos)
    find "$SOURCE/projects" -type f \( -name "*.json" -o -name "*.md" \) \
        -exec cp --parents {} "$TARGET/" \;
fi

# Limpiar credenciales de archivos JSON
echo "🧹 Limpiando credenciales..."
find "$TARGET" -type f -name "*.json" -exec sed -i \
    -e 's/"api_key": *"sk-[^"]*"/"api_key": "YOUR_API_KEY_HERE"/g' \
    -e 's/"apiKey": *"sk-[^"]*"/"apiKey": "YOUR_API_KEY_HERE"/g' \
    -e 's/"token": *"[^"]*"/"token": "YOUR_TOKEN_HERE"/g' \
    -e 's/"password": *"[^"]*"/"password": "YOUR_PASSWORD_HERE"/g' \
    {} \;

echo "✅ Sincronización completa"
echo "📋 Archivos copiados:"
tree -L 2 -I '.git'
