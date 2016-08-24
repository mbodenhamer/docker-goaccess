FROM debian:jessie
MAINTAINER Matt Bodenhamer <mbodenhamer@mbodenhamer.com>

ARG version=1.0.2

RUN apt-get update && apt-get install -y \
    build-essential \
    libbz2-dev \
    libgeoip-dev \    
    libncursesw5-dev \    
    libtokyocabinet-dev \
    wget \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN wget http://tar.goaccess.io/goaccess-$version.tar.gz \
    && tar -xzvf goaccess-$version.tar.gz \
    && cd goaccess-$version \
    && ./configure --enable-utf8 --enable-geoip --enable-tcb=btree \
    && make \
    && make install \
    && cd .. \
    && rm -rf goaccess-$version \
    && rm goaccess-$version.tar.gz

COPY goaccess.conf /usr/local/etc/

EXPOSE 7890
ENTRYPOINT ["goaccess"]
CMD ["-f", "/var/log/nginx/access.log", \
    "--real-time-html", "-o", "report.html"]
