FROM alpine:latest as BUILD

RUN apk add --no-cache build-base gcc abuild binutils cmake git

RUN cd / \
    && git clone https://github.com/Wind4/vlmcsd.git vlmgit \
    && cd vlmgit \
    && make 

FROM alpine:latest

COPY --from=BUILD /vlmgit/bin/vlmcsd /vlmcsd

EXPOSE 1688

CMD ["/vlmcsd", "-D", "-d", "-t", "3", "-e", "-v"]

