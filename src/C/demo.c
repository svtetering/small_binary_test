typedef unsigned short umode_t;

extern void _sys_exit();
extern void _sys_write(int fd, char* buf, int count);
extern int _sys_open(char* filename, int flags, umode_t mode);

#define O_WRONLY 0x0001
#define O_CREAT 0x0100

int entry() {
    char path[] = "./test";
    int fd = _sys_open(path, O_WRONLY | O_CREAT, 0);

    char test[] = "LETS FRICKING GOOOOOO\n";
    _sys_write(fd, test, sizeof(test));

    _sys_exit();
}
