#docker build -t txt-ubuntu -f Dockerfile .

FROM ubuntu:latest

# Set environment variables to prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package repositories and install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl wget nano fbset fbterm mc gcc ncurses-dev bf

RUN mkdir /usr/art
COPY art/* /usr/art

WORKDIR /usr/art
RUN gcc intro.c -o intro -lncurses

#CMD ["./intro"]
CMD ["./bin/bash"]

#RUN fbset -fb /dev/fb0 -g 320 200 320 200 8