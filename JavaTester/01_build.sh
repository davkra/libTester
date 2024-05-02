#!/bin/bash
cd "$(dirname "$0")"

# Build header file
javac -h . MyNativeClass.java

# Build shared object file
mkdir -p ./lib/
g++ -I../inc -I"/usr/lib/jvm/java-11-openjdk-i386/include/" -I"/usr/lib/jvm/java-11-openjdk-i386/include/linux/" -shared -fPIC -m32 -o ./lib/libmyNativeLibrary.so MyNativeClass.cpp ../src/hello.cpp ../src/add.cpp
