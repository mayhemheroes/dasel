FROM golang:1.19.1-buster as go-target
ADD . /dasel
WORKDIR /dasel/cmd/dasel
RUN go build

FROM golang:1.19.1-buster
COPY --from=go-target /dasel/cmd/dasel/dasel /
COPY --from=go-target /dasel/tests/assets/example.json /testsuite/

ENTRYPOINT []
CMD ["/dasel", "select", "-f", "@@"]
