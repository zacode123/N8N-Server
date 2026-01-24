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

EXPOSE 5678 5679

ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
