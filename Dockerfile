# Use a smaller, more secure base image
FROM node:20-alpine

# Set environment to production
ENV NODE_ENV=production

# Set the working directory
WORKDIR /usr/src/app

# Copy package files
COPY package.json package-lock.json* ./

# Diagnostic: List files to ensure lockfile is present
RUN ls -la

# Install only production dependencies
RUN npm install --omit=dev

# Copy the rest of the application code
COPY . .

# Use a non-root user for security
USER node

# Expose the application port
EXPOSE 5000

# Start the application
CMD ["node", "server.js"]
