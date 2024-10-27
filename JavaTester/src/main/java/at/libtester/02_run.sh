#!/bin/bash
cd "$(dirname "$0")"

export LD_LIBRARY_PATH=./lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/david/Dokumente/libTester/lib:$LD_LIBRARY_PATH
java MyNativeClass
