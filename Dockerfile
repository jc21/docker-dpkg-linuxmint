FROM jc21/dpkg-mint:latest
LABEL maintainer="Jamie Curnow <jc@jc21.com>"

USER root

RUN wget "http://ftp.us.debian.org/debian/pool/main/g/golang-1.13/golang-1.13_1.13-1_all.deb" -O /tmp/golang-1.13_1.13-1_all.deb \
 && wget "http://ftp.us.debian.org/debian/pool/main/g/golang-1.13/golang-1.13-src_1.13-1_amd64.deb" -O /tmp/golang-1.13-src_1.13-1_amd64.deb \
 && wget "http://ftp.us.debian.org/debian/pool/main/g/golang-1.13/golang-1.13-go_1.13-1_amd64.deb" -O /tmp/golang-1.13-go_1.13-1_amd64.deb \
 && wget "http://ftp.us.debian.org/debian/pool/main/g/golang-1.13/golang-1.13-doc_1.13-1_all.deb" -O /tmp/golang-1.13-doc_1.13-1_all.deb \
 && dpkg -i \
   /tmp/golang-1.13_1.13-1_all.deb \
   /tmp/golang-1.13-src_1.13-1_amd64.deb \
   /tmp/golang-1.13-go_1.13-1_amd64.deb \
   /tmp/golang-1.13-doc_1.13-1_all.deb \
 && rm -f /tmp/*.deb

USER builder

# installed in /usr/lib/go-1.13
ENV GOROOT=/usr/lib/go-1.13
ENV GOPATH=/home/builder/go
ENV PATH="/usr/lib/go-1.13/bin:/home/builder/go/bin:${PATH}"
