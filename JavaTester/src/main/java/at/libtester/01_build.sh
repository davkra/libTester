#!/bin/bash
cd "$(dirname "$0")"

# Build header file
javac -h . MyNativeClass.java

# Build shared object file
mkdir -p ./lib/
g++ -I/home/david/Dokumente/libTester/inc -I"/usr/lib/jvm/java-17-openjdk-amd64/include/" -I"/usr/lib/jvm/java-17-openjdk-amd64/include/linux/" -shared -fPIC -o ./lib/libmyNativeLibrary.so MyNativeClass.cpp /home/david/Dokumente/libTester/lib/libTest.so
