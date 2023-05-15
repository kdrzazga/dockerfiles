#include <stdio.h>
#include <sys/utsname.h>

int main() {
    struct utsname sysinfo;

    if (uname(&sysinfo) == -1) {
        perror("uname");
        return 1;
    }

    printf("Operating System: %s\n", sysinfo.sysname);
    printf("Node Name: %s\n", sysinfo.nodename);
    printf("Release: %s\n", sysinfo.release);
    printf("Version: %s\n", sysinfo.version);
    printf("Machine: %s\n", sysinfo.machine);

    return 0;
}
