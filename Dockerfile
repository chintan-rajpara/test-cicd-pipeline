# Use official Node.js LTS image (lightweight)
FROM node:20-alpine

# Create working directory inside container
WORKDIR /app

# Copy dependency files first for better caching
COPY package*.json ./

# Install dependencies (omit dev dependencies for smaller image)
RUN npm ci --omit=dev

# Copy the rest of your source code
COPY . .

# Expose port (same as in your Express app)
EXPOSE 3000

# Start the Node.js app
CMD ["node", "index.js"]
