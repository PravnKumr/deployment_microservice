# ---- Base image ----
FROM node:20-alpine

WORKDIR /app

# Copy everything
COPY . .

# Install dependencies only if package.json exists (works for repos that may not have it)
RUN if [ -f package.json ]; then \
      npm ci --omit=dev || npm install --omit=dev; \
    fi

# Run your script
CMD ["node", "appointment-service.js"]