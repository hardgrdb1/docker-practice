FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

## ^^ Stage one
## /app/build has all the good stuff

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html