FROM node:20-alpine
WORKDIR /app
RUN apk add --no-cache curl unzip
COPY package.json ./
COPY tools/serve.mjs ./tools/serve.mjs
RUN mkdir -p public && curl -fL --retry 5 --retry-delay 3 -o /tmp/game.zip https://github.com/MrSh4d0w18/valheim-webgl-assets/releases/download/v1/unity-game-v1.zip && unzip -q /tmp/game.zip -d public && rm /tmp/game.zip
ENV PORT=8080
EXPOSE 8080
CMD ["node", "tools/serve.mjs"]
