#!/bin/bash

# Check if a file name argument is provided
if [ $# -eq 0 ]; then
  echo "Please provide a file name (without the extension) as an argument."
  exit 1
fi

# Assign the file name argument to a variable
name=$1

# Assemble the .asm file
nasm -f elf64 "${name}.asm" -o "${name}.o"

# Link the object file
ld "${name}.o" -o "${name}"

echo "Done."
