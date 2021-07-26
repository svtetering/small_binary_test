typedef unsigned short umode_t;

extern void _sys_exit();
extern void _sys_write(int fd, char* buf, int count);
extern int _sys_open(char* filename, int flags, umode_t mode);

#define O_RDONLY    00000000
#define O_WRONLY    00000001
#define O_CREAT     00000100
#define O_TRUNC     00001000

int entry() {
    char path[] = "./test";
    int fd = _sys_open(path, O_WRONLY | O_CREAT | O_TRUNC, 0);

    char test[] = "Does this work?";
    _sys_write(fd, test, sizeof(test) - 1);

    _sys_exit();
}
