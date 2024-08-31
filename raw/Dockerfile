#docker build -t raw .
#docker run -it raw
FROM alpine:latest

RUN apk add --no-cache nasm bash gcc

WORKDIR /usr/src/bootloader
RUN mkdir sector2
RUN mkdir raw-bios-modes
RUN mkdir biospong
RUN mkdir bin
RUN mkdir edu

COPY sector2/*.asm sector2/.
COPY raw-bios-modes/*.asm raw-bios-modes/.
COPY biospong/*.asm biospong/.
COPY edu/*.asm edu/.

RUN nasm -f bin sector2/mbr.asm -o mbr.bin
RUN nasm -f bin sector2/sector2.asm -o sector2.bin
RUN cat mbr.bin sector2.bin > bin/sector2.img

RUN nasm -f bin raw-bios-modes/mbr.asm -o mbr.bin
RUN nasm -f bin raw-bios-modes/sector2plus.asm -o sector2.bin
RUN cat mbr.bin sector2.bin > bin/raw-bios-modes.img

RUN nasm -f bin biospong/mbr.asm -o mbr.bin
RUN nasm -f bin biospong/pong.asm -o sector2.bin
RUN cat mbr.bin sector2.bin > bin/biospong.img

RUN nasm -f bin edu/mbr.asm -o mbr.bin
RUN nasm -f bin edu/sector2.asm -o sector2.bin
RUN cat mbr.bin sector2.bin > bin/edu.img
CMD ["bash"]
