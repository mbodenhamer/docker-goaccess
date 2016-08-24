FROM debian:jessie
MAINTAINER Matt Bodenhamer <mbodenhamer@mbodenhamer.com>

RUN apt-get update && apt-get install -y \
    libgeoip-dev \    
    libncursesw5-dev \    
    libtokyocabinet-dev \
    wget

RUN echo "deb http://deb.goaccess.io/ jessie main" > /etc/apt/sources.list.d/goaccess.list \
    && wget -O - https://deb.goaccess.io/gnugpg.key | apt-key add - \
    && apt-get update && apt-get install -y goaccess \
    && rm -rf /var/lib/apt/lists/*
