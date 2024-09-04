 nasm -f bin edu/mbr.asm -o mbr.bin
 nasm -f bin edu/sector23.asm -o sector23.bin
 nasm -f bin edu/sector45.asm -o sector45.bin
 nasm -f bin edu/sector67.asm -o sector67.bin
 nasm -f bin edu/sector89.asm -o sector89.bin

echo "compiled"
 
 cat mbr.bin sector23.bin sector45.bin sector67.bin sector89.bin > bin/edu.img

echo "merged to bin/edu.img"
