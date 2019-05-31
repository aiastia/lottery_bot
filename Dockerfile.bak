FROM alpine:3.8


ENV admin=0                     \
    token=6                                    

RUN  apk --no-cache add \
                        python3-dev \
                        libsodium-dev \
                        openssl-dev \
                        mbedtls-dev           && \
     apk --no-cache add --virtual .build-deps \
                        git \
                        tar \
                        make \
                        py3-pip        && \
     ln -s /usr/bin/python3 /usr/bin/python   && \
     ln -s /usr/bin/pip3    /usr/bin/pip      && \
     git clone -b master https://github.com/aiastia/lottery_bot.git "/root/bot" --depth 1 && \
     pip install --upgrade pip                && \
     cd  /root/bot                   && \
     pip install pyTelegramBotAPI
     
WORKDIR /root/bot/bot

CMD cat ${token} >>/root/bot/bot/adminlist && \
    sed -i "s|TOKEN = ''|TOKEN = '${token}'|"  /root/bot/bot/config.py && \
    python main.py
