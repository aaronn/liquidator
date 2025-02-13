FROM arm32v7/node:8.16.0-jessie

RUN adduser -system dydx
RUN mkdir -p /home/dydx/app
RUN chown dydx -R /home/dydx/app
USER dydx

WORKDIR /home/dydx/app

COPY ./.babelrc* ./
COPY ./.env* ./
COPY ./package.json ./package-lock.json ./
RUN npm ci --loglevel warn

COPY ./src ./src
RUN npm run build

CMD ["npm", "start"]
