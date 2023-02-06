FROM node:18-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build


FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80/tcp

# no CMD for NGINX, by default when running container, it will run NGINX