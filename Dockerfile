# ---------- Build Stage ----------
FROM node:20 AS build
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy project files
COPY . .

# Build react app (Vite output goes to dist/)
RUN npm run build


# ---------- Production Stage ----------
FROM nginx:alpine
WORKDIR /usr/share/nginx/html

# Remove default nginx files
RUN rm -rf ./*

# Copy build output from build stage
COPY --from=build /app/dist .

# Expose container port
EXPOSE 80

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
