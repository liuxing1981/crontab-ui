FROM ubuntu
EXPOSE 8000
COPY . /var/app
WORKDIR /var/app
VOLUME ["var/app/crontabs"]
RUN apt-get update && \
    apt-get install -qqy curl cron xz-utils && \
    curl -sL https://nodejs.org/dist/v6.9.1/node-v6.9.1-linux-x64.tar.xz -o - | tar xJf - && \
    mkdir -p /usr/local/bin/nodejs/ && \
    touch /tmp/crontab && \
    mv node-v6.9.1-linux-x64/* /usr/local/bin/nodejs/ && \
    rm -rf node-v6.9.1-linux-x64
ENV PATH $PATH:/usr/local/bin/nodejs/bin
RUN npm install
CMD [ "node","app.js" ]

