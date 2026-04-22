# Use official Node.js LTS image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first (for Docker layer caching)
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy rest of the app
COPY . .

# Expose your Express port
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]