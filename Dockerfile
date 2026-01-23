# Start from official n8n image
FROM n8nio/n8n:2.4.4

# Switch to root to install Python
USER root

# Install Python 3 and pip (Debian-based image)
RUN apt-get update && apt-get install -y python3 python3-pip

# Switch back to n8n user
USER node

# set ENV
ENV DBPOSTGRESDB_SSL=true
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
