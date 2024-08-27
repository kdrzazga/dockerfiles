#docker build -t biospong .
#docker run -it biospong
FROM alpine:latest

RUN apk add --no-cache nasm bash

WORKDIR /usr/src/biospong

COPY *.asm .

RUN nasm -f bin mbr.asm -o mbr.img
#RUN nasm -f bin pong.asm -o pong.img
#RUN cat mbr.img pong.img > biospong.bin

CMD ["bash"]
