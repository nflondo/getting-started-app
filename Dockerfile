# syntax=docker/dockerfile:1

FROM node:18-alpine
#RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY . .
RUN yarn install --production --ignore-engines
CMD ["node", "src/index.js"]
EXPOSE 3000