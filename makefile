all: libhello.so
	g++ -o main main.cpp -ldl

libhello.sh:
	g++ -Wall -shared -fPIC -o libhello.so hello.cpp

run: all
	./main

.PHONY: clean

clean:
	rm -f libhello.so main
