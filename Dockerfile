# 1️⃣ Base image: Debian-based Node
FROM node:20-slim

# 2️⃣ Set working directory
WORKDIR /app

# 3️⃣ Switch to root to install system dependencies
USER root

# 4️⃣ Install system packages: Python3, pip, FFmpeg, Git
RUN apt-get update && \
    apt-get install -y python3 python3-pip ffmpeg git curl && \
    rm -rf /var/lib/apt/lists/*

# 5️⃣ Install n8n globally
RUN npm install -g n8n@2.4.4

# 6️⃣ Switch back to non-root user (good practice)
RUN useradd -m n8nuser
USER n8nuser

# 7️⃣ Expose port n8n listens on
EXPOSE 5678

# 8️⃣ Environment variables
ENV DB_POSTGRESDB_DATABASE=postgres
ENV DB_POSTGRESDB_HOST=aws-1-ap-south-1.pooler.supabase.com
ENV DB_POSTGRESDB_PASSWORD=zJ1aWrJOO3E5tVgl
ENV DB_POSTGRESDB_PORT=6543
ENV DB_POSTGRESDB_SSL=true
ENV DB_POSTGRESDB_USER=postgres.skjwescceppmregjnwmg
ENV DB_TYPE=postgresdb
ENV N8N_ENCRYPTION_KEY=2aebb6d396bdac2695ca8128e9a05254
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_HOST=n8n-zahidarman.onrender.com
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_PROXY_HOP=1
ENV WEBHOOK_URL=https://n8n-zahidarman.onrender.com
ENV N8N_LOG_LEVEL=info
ENV NODE_ENV=production

# 9️⃣ Default command to run n8n
CMD ["n8n"]
