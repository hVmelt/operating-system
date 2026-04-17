#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define ARENA_SIZE 1024

typedef struct {
    uint8_t memory[ARENA_SIZE];
    size_t offset;
} Arena;

// Initialize the arena
void arena_init(Arena* a) {
    a->offset = 0;
}

void* arena_alloc(Arena* a, size_t size) {
    // 1. Check if there is enough space left
    if (a->offset + size > ARENA_SIZE) {
        // 2. Not enough space — return NULL
        return NULL;
    }

    // 3. Get pointer to the current free memory position
    void* ptr = a->memory + a->offset;

    // 4. Bump the offset forward by the requested size
    a->offset += size;

    // 5. Return the pointer
    return ptr;
}

int main() {
    Arena my_arena;
    arena_init(&my_arena);

    int* num = (int*)arena_alloc(&my_arena, sizeof(int));
    if (num) {
        *num = 42;
        printf("Allocated number: %d\n", *num);
    } else {
        printf("Allocation failed!\n");
    }

    char* big_string = (char*)arena_alloc(&my_arena, 2048);
    if (!big_string) printf("Successfully caught out-of-memory error!\n");

    return 0;
}