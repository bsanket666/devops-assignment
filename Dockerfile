FROM node:18.7.0-alpine
WORKDIR /jsrc
COPY . .
EXPOSE 3001
ENV HOST=0.0.0.0
RUN npm install
RUN npx nx run nft-bridge:lint
RUN npm install -g nx
RUN nx build nft-bridge
CMD ["node", "./dist/apps/nft-bridge/main.js"]
