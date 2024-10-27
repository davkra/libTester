# libTester

Author David Krall

---

HelloWorld program for testing Java Native Interface (JNI).

Compile a Shared Library in C/C++ using g++ and create a native Shared Library for Java. Load the Shared Library in the Main class MyNativeClass and run the functions written in C/C++.

## TL;DR

1. Run the demo with the `run_demo.sh` scrip

    ```bash
    ./run_demo.sh
    ```

2. All libraries and the mvn project will be built and the Java `main()` will be executed.

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

## References

[https://github.com/spbwilson/jni-example](https://github.com/spbwilson/jni-example)

[https://mustafa-aydogan.medium.com/how-to-call-c-functions-from-java-how-to-use-jni-java-native-interface-fd6aafcb9ee9](https://mustafa-aydogan.medium.com/how-to-call-c-functions-from-java-how-to-use-jni-java-native-interface-fd6aafcb9ee9)

[https://medium.com/@Neelesh-Janga/run-native-code-in-a-java-environment-using-jni-0dac9c3e6c39](https://medium.com/@Neelesh-Janga/run-native-code-in-a-java-environment-using-jni-0dac9c3e6c39)
