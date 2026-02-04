#!/bin/bash

CLAUDE_DIR="$HOME/.claude"

echo "📦 Instalando agentes en Claude Code..."

# Backup actual
if [ -d "$CLAUDE_DIR/agents" ]; then
    echo "💾 Haciendo backup..."
    cp -r "$CLAUDE_DIR/agents" "$CLAUDE_DIR/agents.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Copiar agentes
cp -r agents "$CLAUDE_DIR/" 2>/dev/null
cp -r plugins "$CLAUDE_DIR/" 2>/dev/null
cp -r todos "$CLAUDE_DIR/" 2>/dev/null

# Verificar credenciales
if [ ! -f "$CLAUDE_DIR/.credentials.json" ]; then
    echo "⚠️  No se encontraron credenciales"
    echo "   Ejecuta: claude auth login"
fi

echo "✅ Instalación completa"
echo "📁 Revisa tus agentes con: claude agents list"
