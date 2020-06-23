FROM node:alpine

WORKDIR '/app'

COPY package*.json ./
RUN npm install
COPY . .

RUN npm run build

## ^^ Stage one
## /app/build has all the good stuff

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html