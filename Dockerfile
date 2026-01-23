# Start from official n8n image
FROM n8nio/n8n:latest

# Switch to root to install Python
USER root

# Install Python 3 and pip (Debian-based image)
RUN apt-get update && apt-get install -y python3 python3-pip

# Switch back to n8n user
USER node

# Optional: set ENV for internal task runner
ENV N8N_TASK_RUNNER_ENABLED=true
ENV N8N_RUNNERS_MODE=internal
