# libTester

Author: David Krall

---

## Table of Content

- [libTester](#libtester)
  - [Table of Content](#table-of-content)
  - [TL;DR](#tldr)
  - [Project structure](#project-structure)
  - [C/C++ Shared Library](#cc-shared-library)
  - [javatester](#javatester)
    - [Build scripts](#build-scripts)
  - [Miscellaneous](#miscellaneous)
  - [References](#references)

---

HelloWorld program for testing Java Native Interface (JNI).

Compile a Shared Library in C/C++ using g++ and create a native Shared Library for Java. Load the Shared Library in the Main class MyNativeClass and run the functions written in C/C++.

## TL;DR

1. Run the demo with the `run_demo.sh` script

    ```bash
    ./run_demo.sh
    ```

2. All libraries and the mvn project will be built and the Java `main()` will be executed.

## Project structure

In this project there is one part for the C/C++ function declarations and implementations and one part for the Java implementation. (the `javatester`)

*All compile steps can also be recreated using the `run_demo.sh` bash script.*

## C/C++ Shared Library

The Shared Library (`libTest.so`) can be compiling using `CMake` and `make`, while being in the root of the project directory.

```bash
cmake . && make
```

The source code is located in the `src/` directory, the header files in `inc/` and the created Shared Library will be created in the `lib/` directory.

## javatester

In this project the previously created `libTest.so` file will be using to create a Java compatible Shared Library using the Java Native Interface. Afterwards, the created Shared Library will be loaded in a Java program, which is packaged in a `jar` file.

This is a maven project called `javatester` and inside the folder will be two scripts `01_build.sh` and `02_run.sh`. First the Maven project should be build and the jar file should be packaged, while being in the project directory `javatester`.

```bash
mvn clean package
```

`01_build.sh` will create the required Java Native Header file and build the Native Shared Library `libmyNativeLibrary.so`, which will be used in the Java Main class `MyNativeClass.java`. `02_run.sh` will configure the paths to the required libraries `libTest.so` and `libmyNativeLibrary.so` and run the Main class `MyNativeClass`.

```bash
./01_build.sh
./02_run.sh
```

The Maven project contains the code for the Java Main class `MyNativeClass.java` in `src/main/java/at/libtester/`. The C/C++ code for the Native Interface can be found in `src/main/java`, together with the Shared Library `libmyNativeLibrary.so` in `src/main/java/lib`.

**Be careful about the file structure in this project, else there might be problems running the Main class!**

```bash
java.lang.NoClassDefFoundError: at/libtester/MyNativeClass (wrong name: MyNativeClass)
```

**You must run `java` from the directory containing the `at` directory. Navigate to the parent directory of `at`!**

After running the Main class, the output of the called C/C++ functions should be visible in the terminal.

### Build scripts

These are short explanations of the used scripts in the `javatester`.

`01_build.sh`

```bash
# Build header file
javac -h . at/libtester/MyNativeClass.java

# Build shared object file
mkdir -p ./lib/
g++ -I../../../../inc/ -I"/usr/lib/jvm/java-17-openjdk-amd64/include/" -I"/usr/lib/jvm/java-17-openjdk-amd64/include/linux/" -shared -fPIC -o ./lib/libmyNativeLibrary.so at_libtester_MyNativeClass.cpp ../../../../lib/libTest.so
```

`02_run.sh`

```bash
# Configure library paths
export LD_LIBRARY_PATH=../../../../javatester/src/main/java/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=../../../../lib:$LD_LIBRARY_PATH

# Run the Main class MyNativeClass
java -cp ../../../target/javatester-1.0-SNAPSHOT.jar at.libtester.MyNativeClass
```

## Miscellaneous

To find out, if the Shared Library was compiled successfully, the bash `file` command can be used:

```bash
file libmyNativeLibrary.so
```

In Visual Studio Code the `jni.h` file might not be found on the C/C++ path and must be added manually.

```json
{
    "C_Cpp.default.includePath": [
    "/usr/lib/jvm/java-17-openjdk-amd64/include/*"
  ]
}
```

## References

- [https://github.com/spbwilson/jni-example](https://github.com/spbwilson/jni-example)
- [https://mustafa-aydogan.medium.com/how-to-call-c-functions-from-java-how-to-use-jni-java-native-interface-fd6aafcb9ee9](https://mustafa-aydogan.medium.com/how-to-call-c-functions-from-java-how-to-use-jni-java-native-interface-fd6aafcb9ee9)
- [https://medium.com/@Neelesh-Janga/run-native-code-in-a-java-environment-using-jni-0dac9c3e6c39](https://medium.com/@Neelesh-Janga/run-native-code-in-a-java-environment-using-jni-0dac9c3e6c39)
