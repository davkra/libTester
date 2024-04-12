CC = g++
CFLAGS = -Wall -g -std=c++11
INC = -I.

BIN = main
SRC = $(wildcard *.cpp)
OBJ = $(patsubst %.cpp, %.o, $(SRC))
LIB = libTest

all: $(BIN)

%.o: %.cpp
	$(CC) $(CFLAGS) $(INC) -fPIC -c $<

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -shared -o libTest.so $(OBJ)
	$(CC) $(CFLAGS) -o $(BIN) $(BIN).o -L. -lTest

.PHONY: clean all

clean:
	rm -f $(BIN) *.d *.o *.so

valgrind:
	valgrind env LD_LIBRARY_PATH=. ./$(BIN)
