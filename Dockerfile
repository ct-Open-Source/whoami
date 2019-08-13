FROM golang:1.13beta1 as builder
ENV GODEBUG=netdns=10
WORKDIR /go/whoami
COPY . .
RUN make build

# Create a minimal container to run a Golang static binary
FROM scratch
COPY --from=builder /go/whoami/whoami .
ENTRYPOINT ["/whoami"]
EXPOSE 80
