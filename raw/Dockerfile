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

COPY compile_edu.sh compile_edu.sh
COPY raw-bios-modes/*.asm raw-bios-modes/.
COPY biospong/. biospong/.
COPY edu/. edu/.

RUN nasm -f bin raw-bios-modes/mbr.asm -o mbr.bin
RUN nasm -f bin raw-bios-modes/sector2plus.asm -o sector2.bin
RUN cat mbr.bin sector2.bin > bin/raw-bios-modes.img

RUN nasm -f bin biospong/mbr.asm -o mbr.bin
RUN nasm -f bin biospong/pong.asm -o sectors23.bin
RUN nasm -f bin biospong/pong2.asm -o sectors45.bin
RUN cat mbr.bin sectors23.bin sectors45.bin > bin/biospong.img

RUN source compile_edu.sh
CMD ["bash"]
