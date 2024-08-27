#docker build -t boot2 .
#docker run -it boot2
FROM alpine:latest

RUN apk add --no-cache nasm bash

WORKDIR /usr/src/bootloader

COPY *.asm .

RUN nasm -f bin mbr.asm -o mbr.img
RUN nasm -f bin sector2.asm -o sector2.img
RUN cat mbr.img sector2.img > bootloader.bin

EXPOSE 5900
#CMD ["qemu-system-i386", "-drive", "format=raw,file=bootloader.bin", "-nographic", "-serial", "stdio"]

#CMD ["qemu-system-i386", "-drive", "format=raw,file=bootloader.bin &"]
CMD ["bash"]
