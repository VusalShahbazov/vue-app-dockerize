# Build vue app to /app folder
FROM node:alpine3.10 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run lint -- --fix
RUN npm run build


# Nginx listen to /dist
# /app/dist copy to /srv
FROM nginx as production-stage
COPY --from=build-stage /app/dist /srv
COPY nginx.conf /etc/nginx/nginx.conf
