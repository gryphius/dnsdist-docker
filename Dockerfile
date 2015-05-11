FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y install automake autoconf libtool ragel libboost-dev gcc lua5.2 git wget pkg-config libreadline-dev g++ make liblua5.2-dev
RUN wget https://github.com/jgm/pandoc/releases/download/1.13.2/pandoc-1.13.2-1-amd64.deb -O /tmp/pandoc.deb && dpkg -i /tmp/pandoc.deb
EXPOSE 53
RUN cd /tmp && git clone https://github.com/PowerDNS/pdns.git && cd pdns/pdns/dnsdistdist && ./populate && autoreconf -i  && ./configure && make && make install 
ENTRYPOINT ["/usr/local/bin/dnsdist"]
CMD ["8.8.4.4","8.8.8.8"]
ADD dnsdist.conf /usr/local/etc/dnsdist.conf
