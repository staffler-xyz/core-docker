## libajnetmask.so


### 64bit Kernel

```bash
curl -L "https://github.com/red171/applejuice-docker-core/raw/master/files/lib/libajnetmask-amd64.so" -o /usr/lib/libajnetmask.so
# libajnetmask-amd64.so: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, BuildID[sha1]=1ec17906f584a07929b330db277898930c3aaf4c, not stripped
``` 

### 32bit Kernel (original)

```bash
curl -L "https://github.com/red171/applejuice-docker-core/raw/master/files/lib/libajnetmask-i386.so" -o /usr/lib/libajnetmask.so
# libajnetmask-i386.so: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked, not stripped
``` 

### 32bit Kernel (armhf, armel)

```bash
curl -L "https://github.com/red171/applejuice-docker-core/raw/master/files/lib/libajnetmask-armhf.so" -o /usr/lib/libajnetmask.so
# libajnetmask-armhf.so: ELF 32-bit LSB shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, BuildID[sha1]=10ca6ea33afbb8ba52404cbf6dd320af761f45f1, not stripped
```

### 64bit Kernel (arm64, aarch64)

```bash
curl -L "https://github.com/red171/applejuice-docker-core/raw/master/files/lib/libajnetmask-arm64.so" -o /usr/lib/libajnetmask.so
# libajnetmask-arm64.so: ELF 64-bit LSB shared object, ARM aarch64, version 1 (SYSV), dynamically linked, BuildID[sha1]=b2dbd7180158f52784d925c7b0abec111b2acecd, not stripped
``` 