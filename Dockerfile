FROM node:20.20.2-alpine3.22 AS builder
WORKDIR /app
COPY package*.json .
COPY server.js .
RUN npm install



FROM node:20.20.2-alpine3.22
WORKDIR /app
EXPOSE 8080
ENV MONGO_URL=mongodb://mongodb:27017/catalogue \
    MONGO="true"
RUN addgroup -S roboshop && adduser -S -G roboshop roboshop && chown -R roboshop:roboshop /app
COPY --from=builder /app .
USER roboshop
CMD ["node", "server.js"]


# FROM node:20
# WORKDIR /app
# COPY package*.json .
# RUN npm install
# COPY server.js .
# ENV MONGO_URL=mongodb://mongodb:27017/catalogue \
#     MONGO="true"
# CMD ["node", "server.js"]
