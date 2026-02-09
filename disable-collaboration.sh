#!/bin/bash
# Disable collaboration packages if DISABLE_COLLABORATION=true
# This fixes WebSocket 403 errors when running behind reverse proxies

if [ "${DISABLE_COLLABORATION}" = "true" ]; then
    echo "DISABLE_COLLABORATION=true detected, removing collaboration packages..."
    pip uninstall -y \
        jupyter-collaboration \
        jupyter-collaboration-ui \
        jupyter-docprovider \
        jupyter-server-ydoc \
        jupyter-server-documents \
        2>/dev/null || true
    echo "Collaboration packages removed."
fi
