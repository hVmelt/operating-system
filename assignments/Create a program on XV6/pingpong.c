#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[])
{
    int p1[2], p2[2];
    pipe(p1);
    pipe(p2);

    int rounds = 200000; // number of exchanges
    int pid = fork();

    if (pid == 0)
    {
        // Child
        close(p1[1]);
        close(p2[0]);

        char buf;

        for (int i = 0; i < rounds; i++)
        {
            read(p1[0], &buf, 1);
            write(p2[1], &buf, 1);
        }

        exit(0);
    }
    else
    {
        // Parent
        close(p1[0]);
        close(p2[1]);

        char buf = 'x';

        int start = uptime();

        for (int i = 0; i < rounds; i++)
        {
            write(p1[1], &buf, 1);
            read(p2[0], &buf, 1);
        }

        int end = uptime();

        wait(0);

        int ticks = end - start;
        if (ticks == 0)
            ticks = 1;

        int exchanges = (rounds * 100) / ticks;

        printf("round trips: %d\n", rounds);
        printf("ticks: %d\n", ticks);
        printf("exchanges/sec: %d\n", exchanges);
    }

    exit(0);
}