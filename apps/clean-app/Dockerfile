FROM node:20-bookworm-slim AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --omit=dev

COPY src ./src

FROM gcr.io/distroless/nodejs20-debian12:nonroot

WORKDIR /app

COPY --from=build --chown=nonroot:nonroot /app/node_modules ./node_modules
COPY --from=build --chown=nonroot:nonroot /app/src ./src
COPY --from=build --chown=nonroot:nonroot /app/package.json ./package.json

EXPOSE 3000

CMD ["src/server.js"]
