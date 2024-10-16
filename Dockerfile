FROM node:16.8-alpine3.13 as builder
COPY . /app/
WORKDIR /app
RUN npm config ls -l
RUN npm config set fetch-retry-mintimeout 20000
RUN npm config set fetch-retry-maxtimeout 120000
RUN npm install
RUN npm run build

FROM nginx:alpine3.20-slim
COPY --from=builder /app/build /usr/share/nginx/html/
EXPOSE 80
