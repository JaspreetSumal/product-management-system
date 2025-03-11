#build front end freamework
FROM node:lts-alpine AS builder
#app flder inside image
WORKDIR /app
#copy content from app  folder to image
COPY ./app .

FROM nginx:alpine

COPY --from=builder /app /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx","-g","daemon off;"]