## libajnetmask.so


### 64bit Kernel

```bash
curl -L "https://github.com/red171/applejuice-docker-core/raw/master/files/lib/libajnetmask-x86-64.so" -o /usr/lib/libajnetmask.so
# libajnetmask-x86-64.so: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, BuildID[sha1]=1ec17906f584a07929b330db277898930c3aaf4c, not stripped
``` 

### 32bit Kernel (original)

```bash
curl -L "https://github.com/red171/applejuice-docker-core/raw/master/files/lib/libajnetmask-x86.so" -o /usr/lib/libajnetmask.so
# libajnetmask-x86.so: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked, not stripped
``` 

### 32bit Kernel on ARM

```bash
curl -L "https://github.com/red171/applejuice-docker-core/raw/master/files/lib/libajnetmask-arm-x86.so" -o /usr/lib/libajnetmask.so
# libajnetmask-arm-x86.so: ELF 32-bit LSB shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, BuildID[sha1]=10ca6ea33afbb8ba52404cbf6dd320af761f45f1, not stripped
```

### 32bit Kernel on Cubieboard, Cubietruck (ARM)

```bash
curl -L "https://github.com/red171/applejuice-docker-core/raw/master/files/lib/libajnetmask-arm-x86_cubieboard3_cubietruck.so" -o /usr/lib/libajnetmask.so
# libajnetmask_arm_cubieboard3_cubietruck.so: ELF 32-bit LSB shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, BuildID[sha1]=7d36e82598cf5aef4ef33f4b06951129924d752f, not stripped
``` 