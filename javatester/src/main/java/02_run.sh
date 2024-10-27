#!/bin/bash
cd "$(dirname "$0")"

export LD_LIBRARY_PATH=../../../../javatester/src/main/java/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=../../../../lib:$LD_LIBRARY_PATH

java -Djava.library.path=../../../../lib:../../../../javatester/src/main/java/lib at.libtester.MyNativeClass
