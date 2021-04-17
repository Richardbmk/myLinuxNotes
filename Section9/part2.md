# Section 15: Software Management

## 120. Compiling Programs from Source Code vs. Package Manager

- $ apt show apache2

## 121. Compiling C Programs

- $ sudo apt update && sudo apt install build-essential ==> Install gcc, g++, make, and more

- $ gcc --version ==> is GNU C Compiler
- $ g++ --version ==> is GNU C++ Compiler
- $ make --version ==> is a utility used to build

- $ vim hello.c

"""
#include <stdio.h>

int main() {
    printf("Hello, word!\n");
    return 0;
}
"""

- $ gcc hello.c -o hello ==> This command creates a binary file in the command working directory. It a executable file compiled
- $ ./hello

## 122. Compiling Software From Source Code: Lab ProFTPD

- http://proftpd.org/
- $ wget -c ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.7a.tar.gz
- $ ls
- Find the integrity of the file in the web
    - http://proftpd.org/md5_pgp.html (4a9b8877b2e9b08d70e71ad56c19e2c9)
- $ md5sum md5sum proftpd-1.3.7a.tar.gz ==> Checking the integrity of the archive
    - Result: 4a9b8877b2e9b08d70e71ad56c19e2c9  proftpd-1.3.7a.tar.gz
    - They have the same number!
- $ tar -xzvf proftpd-1.3.7a.tar.gz ==> Extracting the archive
- $ ls 


- $ cd proftpd-1.3.7a/
- $ ls
- $ ls src/ ==> source code of the server
- $ ls -l configure
- $ ./configure --help
- $ ./configure --help | less

- $ ./configure --prefix=/opt/proftpd
- $ make 
- $ sudo make install

- $ cd ..
- $ rm -rf proftpd-1.3.7a* 

- $ cd /opt/proftpd/ ==> To remove the server you just need to move this directory
- $ pwd
- $ ls

- $ cd sbin/
- $ pwd
- $ ls
- $ sudo ./proftpd & 

- $ ps -ef | grep proftpd
- $ pgrep -l proftpd

- $ sudo pkill proftpd
- $ pgrep -l proftpd

- $ sudo ./proftpd -n ==> Start the server in the foreground

- connect to the server in the browser:
- ftp://localhost

- $ ls -l /opt/proftpd/etc/ ==> The configuration file to of the server
- $ cat /opt/proftpd/etc/proftpd.conf ==> The configuration file to of the server

- **FAST WAY TO DO ALL THESS STEPS**
- $ wget -c ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.7a.tar.gz
- $ tar -xzvf proftpd-1.3.7a.tar.gz ==> Extracting the archive
- $ cd proftpd-1.3.7a/
- $ ./configure --prefix=/opt/proftpd1 && make && sudo make install

