#docker build -t boot2 .
#docker run -it boot2
FROM alpine:latest

RUN apk add --no-cache nasm qemu bash qemu-img qemu-system-i386 curl

WORKDIR /usr/src/bootloader

COPY bootloader.asm .

RUN nasm -f bin bootloader.asm -o bootloader.img

EXPOSE 5900
#CMD ["qemu-system-i386", "-drive", "format=raw,file=bootloader.bin", "-nographic", "-serial", "stdio"]

#CMD ["qemu-system-i386", "-drive", "format=raw,file=bootloader.bin &"]
CMD ["bash"]
