FROM node:20-alpine

WORKDIR /app

USER root

RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg \
    libc6-compat \
    libstdc++ \
    ca-certificates \
    tini

RUN npm install -g n8n@latest

RUN adduser -D n8nuser
USER n8nuser

EXPOSE 5678

ENV N8N_TASK_RUNNER_MODE=disabled
ENV NODE_ENV=production

ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
