FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y install automake autoconf libtool ragel libboost-dev gcc lua5.2 git wget pkg-config libreadline-dev g++ make liblua5.2-dev libsodium18 libedit-dev
RUN wget https://github.com/jgm/pandoc/releases/download/1.13.2/pandoc-1.13.2-1-amd64.deb -O /tmp/pandoc.deb && dpkg -i /tmp/pandoc.deb
EXPOSE 53
EXPOSE 8083
RUN cd /tmp && git clone https://github.com/PowerDNS/pdns.git && cd pdns/pdns/dnsdistdist  && autoreconf -i  && ./configure && make && make install
CMD ["/usr/local/bin/dnsdist"]
ADD dnsdist.conf /usr/local/etc/dnsdist.conf
