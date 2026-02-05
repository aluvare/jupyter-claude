# Jupyter scipy-notebook with Claude Code

Docker image based on `quay.io/jupyter/scipy-notebook` with Claude Code pre-installed.

Automatically synced with upstream versions via nightly checks.

## Features

- Base: `quay.io/jupyter/scipy-notebook:lab-4.5.3`
- Node.js LTS
- Claude Code CLI (`@anthropic-ai/claude-code`)
- Jupyter AI with Claude Code integration (`jupyter-ai-claude-code`)
- Sudo access for `jovyan` user

## Usage

```yaml
services:
  jupyter:
    image: aluvare/scipy-notebook:lab-4.5.3
    # or: ghcr.io/aluvare/scipy-notebook:lab-4.5.3
    restart: always
    environment:
      - JUPYTER_TOKEN=your_token
      - ANTHROPIC_API_KEY=your_api_key
    ports:
      - "8888:8888"
    volumes:
      - ./data:/home/jovyan
```

## Registries

| Registry | Image |
|----------|-------|
| Docker Hub | `aluvare/scipy-notebook:lab-4.5.3` |
| GitHub Container Registry | `ghcr.io/aluvare/scipy-notebook:lab-4.5.3` |

## Automatic Updates

A nightly workflow checks for new `lab-*` versions of the upstream image and automatically builds and publishes updated images.

## Build locally

```bash
docker build -t aluvare/scipy-notebook:lab-4.5.3 .
```
