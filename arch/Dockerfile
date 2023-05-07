#docker build -t tools-arch -f Dockerfile .
#docker run -it tools-arch
FROM archlinux/base

# Update packages and install dependencies
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    nano \
    mc \
    curl \
	qemu

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN qemu-img create -f qcow2 boot5.img 5M && \
	qemu-system-x86_64 -enable-kvm -cdrom boot5.iso menu=on -drive file=boot5.iso

# Start the container with a command of your choice
CMD ["/bin/bash"]
