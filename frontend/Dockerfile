# Stage 1: Build the app
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
COPY vite.config.* ./
RUN npm install
COPY . .
RUN npm run build  # Outputs to /app/dist by default

# Stage 2: Serve the app
FROM node:18-slim
WORKDIR /app
RUN npm install -g serve
COPY --from=builder /app/dist ./dist
EXPOSE 3000
CMD ["serve", "-s", "dist"]
