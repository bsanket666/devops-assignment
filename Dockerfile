FROM node:16.5.5-alpine
WORKDIR /jsrc
COPY . .
RUN npm install
RUN npm nx run nft-bridge:lint
RUN npm jest
RUN nx build nft-bridge
CMD ["node", "./dist/apps/nft-bridge/main.js"]
