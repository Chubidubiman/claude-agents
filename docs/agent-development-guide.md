# Guía de Desarrollo de Agentes

## Estructura de un Agente
```markdown
---
name: nombre-del-agente
description: Descripción breve de cuándo usar este agente
model: sonnet  # o opus, haiku
color: purple  # purple, blue, green, etc.
---

# System Prompt del Agente

You are an expert in...

## Core Responsibilities:
- Responsibility 1
- Responsibility 2

## Examples:
<example>
user: "Question"
assistant: "Response"
</example>
```

## Plantilla para Nuevo Agente

Copia `docs/agent-template.md` y personaliza.

## Testing

1. Copiar a `~/.claude/agents/`
2. Ejecutar: `claude chat --agent tu-agente`
3. Probar casos de uso
4. Refinar prompt según resultados
