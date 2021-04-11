FROM ubuntu
RUN apt-get update && apt-get install -y gcc-multilib gdb nasm g++
WORKDIR /home/
COPY 5var.cpp /home/
COPY var5.asm /home/
RUN g++ -Wall -o 5var 5var.cpp
RUN nasm -f elf64 var5.asm -o var5.o
RUN ld var5.o -o var5

