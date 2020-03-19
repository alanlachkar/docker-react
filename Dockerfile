# Build phase 
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
FROM nginx
# Specify the container then the source path then the destination path (here according to nginx)
COPY --from=builder /app/build /usr/share/nginx/html
# The default command for nginx image is to start up nginx (so no need to write here)
