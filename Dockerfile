# External n8n task runner
FROM python:3.13-alpine AS runtime
ENV NODE_ENV=production

# Install Alpine deps
RUN apk add --no-cache bash curl ffmpeg git libstdc++ libc6-compat ca-certificates tini

# Install Node 20
RUN apk add --no-cache nodejs npm

# Install n8n task runner
RUN npm install -g n8n@2.4.4

# Create non-root runner
RUN adduser -D runner
USER runner
WORKDIR /home/runner

# Expose optional runner port
EXPOSE 5680

# External runner env
ENV N8N_TASK_RUNNER_MODE=external
ENV PYTHON_PATH=/usr/bin/python3
ENV N8N_RUNNERS_BROKER_URI=http://n8n-main:5678
ENV N8N_RUNNERS_AUTH_TOKEN=<your-secret>

# Entrypoint
ENTRYPOINT ["tini", "--", "n8n", "task:runner"]
