FROM alpine:3.8
#2019-5-28

ENV token=0 \
    botname=6 \
    username1=1 \
    username2=2 \
    username3=3 \
    username4=4 \
    username5=5 \
    username6=6 

RUN  apk --no-cache add \
                        wget \
                        python3-dev \
                        libsodium-dev \
                        openssl-dev \
                        udns-dev \
                        mbedtls-dev \
                        pcre-dev \
                        libev-dev \
                        libtool \
                        libffi-dev  \
                        git \
                        tar \
                        make \
                        py3-pip         && \
     ln -s /usr/bin/python3 /usr/bin/python   && \
     ln -s /usr/bin/pip3    /usr/bin/pip     
     
RUN  git clone -b manyuser git clone https://github.com/johnpoint/lottery_bot.git "/root/lottery_bot" --depth 1 && \
     pip install --upgrade pip                && \
     cd  /root/lottery_bot                    && \
     pip install -r requirements.txt          && \
     apk del --purge .build-deps 

WORKDIR /root/lottery/bot

CMD sed -i "TOKEN = ''|TOKEN = '${token}' |"                               /root/lottery/bot/config.py && \
    echo ${botname}  >> /root/lottery/bot/config.py && \
    echo ${username1}  >> /root/lottery/bot/adminlist && \
    echo ${username2}  >> /root/lottery/bot/adminlist && \
    echo ${username3}  >> /root/lottery/bot/adminlist && \
    echo ${username4}  >> /root/lottery/bot/adminlist && \
    echo ${username5}  >> /root/lottery/bot/adminlist && \
    echo ${username6}  >> /root/lottery/bot/adminlist && \
    python main.py
