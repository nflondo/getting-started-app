# syntax=docker/dockerfile:1

FROM node:18-alpine
#RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY . .
#RUN yarn install --production --ignore-engines
RUN yarn config set registry https://registry.npmjs.org/ && yarn install --production --ignore-engines
CMD ["node", "src/index.js"]
EXPOSE 3000