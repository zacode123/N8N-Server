FROM n8nio/n8n:latest

ENV NODE_OPTIONS=--max-old-space-size=4096

USER node

CMD sh -c "n8n export:credentials --all --decrypted --output=/dev/stdout && n8n"
