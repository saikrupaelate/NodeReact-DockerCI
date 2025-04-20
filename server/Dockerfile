# -------- Stage 1: Build --------
FROM node:18 AS builder

WORKDIR /app

COPY package*.json ./
RUN apt-get update && apt-get install -y netcat
RUN npm install

COPY . .

# -------- Stage 2: Runtime --------
FROM node:18-slim

WORKDIR /app

# Only copy production dependencies
COPY --from=builder /app ./
COPY --from=builder /app/node_modules ./node_modules

EXPOSE 5000

COPY wait-for-db.sh .
CMD ["./wait-for-db.sh", "node", "index.js"]
