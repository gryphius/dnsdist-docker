#!/bin/sh
docker run -p 5300:53/tcp -p 5300:53/udp -ti dnsdist $1 $2 $3 $4 $5 $6 $7 $8 $9
