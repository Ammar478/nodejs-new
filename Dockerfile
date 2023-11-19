FROM node:18-alpine3.14

WORKDIR /usr/src/app

COPY package*.json package-lock.json ./

RUN npm install --frozen-lockfile

COPY prisma/schema.prisma ./prisma/
RUN npx prisma generate

COPY . .

EXPOSE 8080

CMD ["npm", "run","start:migrate:prod"]
