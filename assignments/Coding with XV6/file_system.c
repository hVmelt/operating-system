#include <stdio.h>
#include <sys/stat.h>
#include <stdlib.h>

void inspect_file(const char* filepath) {
    struct stat file_stat;

    printf("Inspecting: %s\n", filepath);

    // 1 & 2. Call stat() and check for errors
    if (stat(filepath, &file_stat) == -1) {
        perror("  Error");   // prints the system error message (e.g. "No such file or directory")
        return;
    }

    // 3. Print file size
    printf("  Size: %lld bytes\n", (long long)file_stat.st_size);

    // 4. Print type using mode macros
    if (S_ISREG(file_stat.st_mode)) {
        printf("  Type: Regular file\n");
    } else if (S_ISDIR(file_stat.st_mode)) {
        printf("  Type: Directory\n");
    } else {
        printf("  Type: Other (symlink, device, socket, etc.)\n");
    }

    printf("\n");
}

int main() {
    FILE *f = fopen("test.txt", "w");
    if(f) { fputs("Hello File System!", f); fclose(f); }

    inspect_file("test.txt");
    inspect_file("."); // Inspect the current directory
    inspect_file("does_not_exist.bin");

    return 0;
}