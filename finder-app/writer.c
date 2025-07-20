#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
  if (argc < 2) {
    syslog(LOG_ERR, "Must provide a path to the file to be written.\n");
    return 1;
  }
  if (argc < 3) {
    syslog(LOG_ERR, "Must provide a string to write to the file.\n");
    return 1;
  }

  openlog(NULL, 0, LOG_USER);
  int fd =creat(argv[1], 0644);
  if (fd < 0) {
    syslog(LOG_ERR, "Unable to create file %s.\n", argv[1]);
    return 1;
  }

  syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
  if (write(fd, argv[2], strlen(argv[2])) < 0) {
    syslog(LOG_ERR, "Unable to write %s to file %s.\n", argv[2], argv[1]);
  }
  close(fd);
}
