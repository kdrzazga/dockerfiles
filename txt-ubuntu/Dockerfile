#docker build -t txt-ubuntu -f Dockerfile .
#docker run -it txt-ubuntu /bin/bash
#docker run txt-ubuntu

FROM ubuntu:latest

# Set environment variables to prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package repositories and install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl wget nano fbset fbterm mc gcc ncurses-dev bf elixir npm

RUN mkdir /usr/art
RUN mkdir /usr/stories
COPY txt/art/* /usr/art
COPY txt/stories/* /usr/stories

RUN mkdir opt/programming
RUN mkdir opt/programming/brainfuck
RUN mkdir opt/programming/elixir
RUN mkdir opt/programming/playwright

COPY brainfuck/* /opt/programming/brainfuck 
COPY elixir/* /opt/programming/elixir 
COPY playwright/* /opt/programming/playwright 

WORKDIR /opt/programming/playwright
#RUN npm install -g playwright
#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash  #already copied

#RUN source ~/.bashrc
#RUN npm install --lts
#RUN npx playwright install
#RUN npx playwright install-deps
#RUN npm init playwright@latest -y

WORKDIR /usr/art
RUN gcc intro.c -o intro -lncurses

CMD ["./intro"]
CMD ["./bin/bash"]

#RUN fbset -fb /dev/fb0 -g 320 200 320 200 8