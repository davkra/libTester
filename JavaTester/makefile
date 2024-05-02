
all:	MyNativeClass.java
	javac -h . MyNativeClass.java
	mkdir -p ./lib/
	g++ -I../inc -I"/usr/lib/jvm/java-11-openjdk-i386/include/" -I"/usr/lib/jvm/java-11-openjdk-i386/include/linux/" -shared -fPIC -m32 -o ./lib/libmyNativeLibrary.so MyNativeClass.cpp ../src/hello.cpp ../src/add.cpp

run: all
	@env LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./lib java MyNativeClass 