FROM debian:jessie

RUN apt-get update && apt-get install proftpd -y
    
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY proftpd.conf /etc/proftpd/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["proftpd", "-n"]
