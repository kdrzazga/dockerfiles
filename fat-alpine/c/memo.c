/*
gcc -o memo memo.c
./memo add "hello world"
./memo add "abc"
./memo get
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/shm.h>

#define SHM_SIZE 1024

int main(int argc, char *argv[]) {
    if (argc < 2) {
		printf("This program is used to store data in memory.\n");
		printf("You can add pieces of text to the shared RAM buffer and retrieve them later.\n");
		printf("\n");
        printf("Usage: %s add <text to store>\n", argv[0]);
        printf("Usage: %s get\n", argv[0]);
        return 1;
    }

    key_t key = ftok("memo.c", 'R');
    if (key == -1) {
        perror("ftok");
        return 1;
    }

    int shmid = shmget(key, SHM_SIZE, 0666 | IPC_CREAT);
    if (shmid == -1) {
        perror("shmget");
        return 1;
    }

    char *shmaddr = shmat(shmid, (void *)0, 0);
    if (shmaddr == (char *)(-1)) {
        perror("shmat");
        return 1;
    }

    if (argc > 2 && strcmp(argv[1], "add") == 0) {
        // Append text to shared memory
        strcat(shmaddr, argv[2]);
        strcat(shmaddr, "\n");
        printf("Text added to shared memory: %s\n", argv[2]);
    } else if (strcmp(argv[1], "get") == 0) {
        // Print the contents of shared memory
        printf("Contents of shared memory:\n%s", shmaddr);
    } else {
        printf("Unknown command\n");
    }

    if (shmdt(shmaddr) == -1) {
        perror("shmdt");
        return 1;
    }

    return 0;
}
