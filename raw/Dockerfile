#docker build -t raw .
#docker run -it raw
FROM alpine:latest

RUN apk add --no-cache nasm bash gcc

WORKDIR /usr/src/bootloader
RUN mkdir sector2
RUN mkdir raw-bios-modes
RUN mkdir biospong
RUN mkdir bin

COPY sector2/*.asm sector2/.
COPY raw-bios-modes/*.asm raw-bios-modes/.
COPY bios-pong/*.asm biospong/.

RUN nasm -f bin sector2/mbr.asm -o mbr.img
RUN nasm -f bin sector2/sector2.asm -o sector2.img
RUN cat mbr.img sector2.img > bin/sector2.bin

RUN nasm -f bin raw-bios-modes/mbr.asm -o mbr.img
RUN nasm -f bin raw-bios-modes/sector2plus.asm -o sector2.img
RUN cat mbr.img sector2.img > bin/raw-bios-modes.bin

RUN nasm -f bin biospong/mbr.asm -o mbr.img
RUN nasm -f bin biospong/pong.asm -o sector2.img
RUN cat mbr.img sector2.img > bin/biospong.bin

CMD ["bash"]
