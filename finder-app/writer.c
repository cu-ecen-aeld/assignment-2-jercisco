#include <syslog.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <writefile> <writestr>\n", argv[0]);
        return 1;
    }

    char *writefile = argv[1];
    char *writestr = argv[2];

    FILE *fp = fopen(writefile, "w");
    if (fp == NULL) {
        syslog(LOG_ERR, "Error: Could not create file %s", writefile);
        return 1;
    }

    fprintf(fp, "%s", writestr);

    if (fclose(fp) != 0) {
        syslog(LOG_ERR, "Error: Could not close file %s", writefile);
        return 1;
    }

    openlog("writer", LOG_PID, LOG_USER);
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
    syslog(LOG_DEBUG, "File %s created successfully", writefile);
    closelog();

    return 0;
}
