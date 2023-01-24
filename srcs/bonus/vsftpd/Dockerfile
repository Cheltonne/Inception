FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd

RUN groupadd --gid 1010 ftpusers
RUN useradd --uid 1010 --gid 1010 --home /var/www/html ftpuser

RUN mkdir -p /var/www/html
RUN chown ftpuser:ftpusers /var/www/html

COPY vsftpd.conf /etc/vsftpd.conf

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd.conf"]
