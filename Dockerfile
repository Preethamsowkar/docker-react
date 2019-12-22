FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run builder

FROM nginx
Expose 80
COPY --from=builder /app/build /usr/share/nginx/html
