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

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=postgres
ENV DB_POSTGRESDB_HOST=aws-1-ap-south-1.pooler.supabase.com
ENV DB_POSTGRESDB_USER=postgres.skjwescceppmregjnwmg
ENV DB_POSTGRESDB_PASSWORD=zJ1aWrJOO3E5tVgl
ENV DB_POSTGRESDB_PORT=6543
ENV DB_POSTGRESDB_SSL=true


ENV N8N_ENCRYPTION_KEY=2aebb6d396bdac2695ca8128e9a05254
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

ENV N8N_HOST=n8n-zahidarman.onrender.com
ENV WEBHOOK_URL=https://n8n-zahidarman.onrender.com
ENV N8N_PROTOCOL=https
ENV N8N_PORT=5678
ENV N8N_PROXY_HOP=1

ENV N8N_LOG_LEVEL=info
ENV N8N_TASK_RUNNER_MODE=disabled
ENV NODE_ENV=production

ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
