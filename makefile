CC = g++
CFLAGS = -Wall -g -std=c++11

BIN = main
LIB = libTest

INC = -Iinc
LIB_PATH = lib
OBJ_PATH = obj
SRC_PATH = src

SRC = $(wildcard $(SRC_PATH)/*.cpp)
OBJ = $(patsubst $(SRC_PATH)/%.cpp, $(OBJ_PATH)/%.o, $(SRC))

all: $(BIN)

rebuild: clean all

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.cpp
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $(INC) -fPIC -c -o $@ $<

$(BIN): $(OBJ)
	@mkdir -p $(LIB_PATH)
	$(CC) $(CFLAGS) -shared -o $(LIB_PATH)/$(LIB).so $(OBJ)
	$(CC) $(CFLAGS) -o $(BIN) $(OBJ_PATH)/$(BIN).o -L$(LIB_PATH) -lTest

.PHONY: clean all

clean:
	rm -rf $(BIN) *.d *.o *.so $(OBJ_PATH)/ $(LIB_PATH)/

valgrind: all
	valgrind env LD_LIBRARY_PATH=$(LIB_PATH) ./$(BIN)

run: main
	@env LD_LIBRARY_PATH=$(LIB_PATH) ./$(BIN)
