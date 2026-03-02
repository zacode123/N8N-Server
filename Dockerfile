FROM n8nio/n8n:latest

ENV NODE_OPTIONS=--max-old-space-size=4096

USER node

ENTRYPOINT ["n8n"]
CMD ["export:credentials", "--all", "--decrypted", "--output=/dev/stdout"]
