FROM quay.io/jupyter/scipy-notebook:lab-4.5.3

USER root

# Install Node.js and npm
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install latest Node.js via n (for a more recent version)
RUN npm install -g n && n lts

# Install Claude Code CLI globally
RUN npm install -g @anthropic-ai/claude-code

# Configure sudo for jovyan user (no password required)
RUN echo "jovyan ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/jovyan \
    && chmod 0440 /etc/sudoers.d/jovyan

# Script to disable collaboration if DISABLE_COLLABORATION=true
COPY disable-collaboration.sh /usr/local/bin/before-notebook.d/
RUN chmod +x /usr/local/bin/before-notebook.d/disable-collaboration.sh

USER jovyan

# Install Jupyter AI with Claude Code integration
RUN pip install --no-cache-dir \
    jupyter-ai \
    jupyter-ai-claude-code
