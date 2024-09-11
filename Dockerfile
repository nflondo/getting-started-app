# syntax=docker/dockerfile:1

FROM node:18-alpine
WORKDIR /app
COPY . .
RUN echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.16/main" > /etc/apk/repositories 
RUN echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.16/community" >> /etc/apk/repositories 
RUN apk add --no-cache --update python3 make g++
RUN yarn config set registry http://registry.npmmirror.com
RUN yarn cache clean
RUN yarn install --production --force
CMD ["node","src/index.js"]
EXPOSE 3000