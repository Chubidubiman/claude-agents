#!/bin/bash

echo "🔐 Verificando seguridad del repositorio..."

# Buscar API keys
if grep -r "sk-ant-" . --exclude-dir=.git 2>/dev/null; then
    echo "❌ ¡PELIGRO! Se encontraron API keys de Anthropic"
    exit 1
fi

# Buscar passwords
if grep -ri "password.*:.*\"[^Y]" . --exclude-dir=.git 2>/dev/null | grep -v "YOUR_PASSWORD"; then
    echo "⚠️  Se encontraron posibles passwords"
    exit 1
fi

# Buscar tokens
if grep -r "\"token\".*:.*\"[^Y]" . --exclude-dir=.git 2>/dev/null | grep -v "YOUR_TOKEN"; then
    echo "⚠️  Se encontraron posibles tokens"
    exit 1
fi

echo "✅ No se encontraron credenciales expuestas"
echo "📊 Archivos a versionar:"
git status --short
