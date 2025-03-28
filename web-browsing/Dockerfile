#docker build -t web .
#docker run --rm -it web http://spork.org

#other simple websites:
#https://info.cern.ch/
#http://www.aliweb.com/
#https://acme.com/

FROM alpine:3.15

RUN apk add --no-cache \
    w3m \
    nodejs \
    npm \
    git \
    && npm install -g w3mjs

ENTRYPOINT ["w3m"]

CMD ["http://example.com"]
