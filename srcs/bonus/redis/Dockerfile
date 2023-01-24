FROM debian:buster

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    tcl \
	redis \
    && rm -rf /var/lib/apt/lists/*

COPY redis.conf /etc/redis/redis.conf

RUN mkdir -p /var/lib/redis \
    && chown -R redis:redis /var/lib/redis /etc/redis \
    && chmod 770 /var/lib/redis /etc/redis

EXPOSE 6379

USER redis

CMD ["redis-server", "/etc/redis/redis.conf"]
