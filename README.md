# Claude Code Agents - Luis's Setup

Agentes personalizados para desarrollo SAP, SQL Server y automatización.

## 🚀 Instalación en Nueva PC

### 1. Instalar Claude Code
```bash
curl -fsSL https://downloads.claude.ai/install.sh | sh
```

### 2. Autenticar
```bash
claude auth login
```

### 3. Clonar e Instalar Agentes
```bash
git clone https://github.com/tuusuario/claude-agents.git
cd claude-agents
./install_to_claude.sh
```

### 4. Verificar
```bash
claude agents list
```

## 📁 Estructura

- **agents/** - Definiciones de agentes personalizados
- **plugins/** - Plugins de Claude Code
- **projects/** - Configuraciones de proyectos
- **todos/** - Tareas y recordatorios

## 🔄 Actualizar desde PC Actual
```bash
./sync_from_claude.sh
git add .
git commit -m "Update agents"
git push
```

## ⚙️ Agentes Incluidos

- SAP Integration Agent
- Database Admin Agent
- [Agrega tus agentes aquí]

## 🔐 Seguridad

- ✅ Credenciales NO incluidas en repo
- ✅ API keys sanitizadas
- ✅ Archivos temporales excluidos
