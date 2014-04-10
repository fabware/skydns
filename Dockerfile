FROM crosbymichael/golang

ADD . /go/src/github.com/fabware/skydns

RUN cd /go/src/github.com/fabware/skydns && \
    go get github.com/codegangsta/cli && \
    go get && \
    go install . ./...

VOLUME ["/data"]

EXPOSE 8080
EXPOSE 53/udp

ENTRYPOINT ["/go/bin/skydns", "-http", "0.0.0.0:8080", "-dns", "0.0.0.0:53"]
CMD ["-nameserver", "8.8.8.8:53"]
