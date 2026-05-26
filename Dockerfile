# Base image - gunakan Node.js versi LTS
FROM node:18-alpine

# Set metadata
LABEL maintainer="Nama Kamu <email@gmail.com>"
LABEL version="1.0"
LABEL description="Aplikasi web DevOps UTS"

# Set working directory di dalam container
WORKDIR /usr/src/app

# Copy package.json dulu (biar layer cache efisien)
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy semua source code ke container
COPY app/ ./app/

# Expose port yang dipakai aplikasi
EXPOSE 3000

# Command yang dijalankan saat container start
CMD ["node", "app/index.js"]