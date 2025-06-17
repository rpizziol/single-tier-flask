#!/bin/sh
# This script is the container's entrypoint.
# It reads environment variables and then starts the main application process.

# Exit immediately if a command exits with a non-zero status.
set -e

# Use the value of GUNICORN_WORKERS if it's set, otherwise default to 1.
# The ":-" syntax is a standard shell parameter expansion.
WORKERS=${GUNICORN_WORKERS:-1}

# The 'exec' command is crucial. It replaces the current shell process with the gunicorn process.
# This makes gunicorn the main process (PID 1), allowing it to receive signals directly from Docker/Kubernetes.
exec gunicorn --bind 0.0.0.0:8080 --workers $WORKERS app:app