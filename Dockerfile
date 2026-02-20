FROM node:20-alpine

WORKDIR /app

# Copy only package files first (better caching)
COPY package*.json ./

# Install dependencies (prod)
RUN npm ci --omit=dev

# Copy application code
COPY . .

EXPOSE 3001

CMD ["node", "appointment-service.js"]