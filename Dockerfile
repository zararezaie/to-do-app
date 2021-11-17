FROM node:14.18.1-alpine as build-deps
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn install --production
COPY . ./
RUN yarn build

FROM nginx:1.21.4-alpine
COPY --from=build-deps /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
