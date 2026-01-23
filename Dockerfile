FROM n8nio/n8n-task-runners:latest

ENV N8N_RUNNERS_BROKER_URI=http://n8n-main:5678
ENV N8N_RUNNERS_AUTH_TOKEN=supersecret

EXPOSE 5680
