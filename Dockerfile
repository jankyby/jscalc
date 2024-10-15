FROM node:16.8-alpine3.13 as builder
COPY . /app/
WORKDIR /app
RUN npm install
RUN npm run build

FROM nginx:alpine3.20-slim
COPY --from=builder /app/build /usr/share/nginx/html/
EXPOSE 80
