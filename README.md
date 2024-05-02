# libTester

Author David Krall

---

## JavaTester

```bash
g++ -I"/usr/lib/jvm/java-11-openjdk-i386/include/" -I"/usr/lib/jvm/java-11-openjdk-i386/include/linux/" -shared -fPIC -m32 -o libmyNativeLibrary.so MyNativeClass.cpp
```

```bash
file libmyNativeLibrary.so
```

```bash
cd /usr/lib/jvm/java-1.11.0-openjdk-i386
```

```bash
java MyNativeClass
```

```bash
javac -h . MyNativeClass.java
```

```bash
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
```
