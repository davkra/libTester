CC = g++
CFLAGS = -Wall -g -std=c++11

BIN = main
LIB = libTest

INC = -Iinc
LIB_PATH = lib
OBJ_PATH = obj
SRC_PATH = src

SRC = $(filter-out $(SRC_PATH)/main.cpp, $(wildcard $(SRC_PATH)/*.cpp))
OBJ = $(patsubst $(SRC_PATH)/%.cpp, $(OBJ_PATH)/%.o, $(SRC))

all: $(LIB_PATH)/$(LIB).so $(BIN)

rebuild: clean all

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.cpp
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $(INC) -fPIC -c -o $@ $<

$(LIB_PATH)/$(LIB).so: $(OBJ)
	@mkdir -p $(LIB_PATH)
	$(CC) $(CFLAGS) -shared -o $(LIB_PATH)/$(LIB).so $(OBJ)

$(OBJ_PATH)/$(BIN).o: $(SRC_PATH)/$(BIN).cpp
	$(CC) $(CFLAGS) $(INC) -fPIC -c -o $@ $<

$(BIN): $(OBJ_PATH)/$(BIN).o
	$(CC) $(CFLAGS) -o $(BIN) $(OBJ_PATH)/$(BIN).o -L$(LIB_PATH) -lTest

.PHONY: clean all

clean:
	rm -rf $(BIN) *.d *.o *.so $(OBJ_PATH)/ $(LIB_PATH)/

valgrind: all
	valgrind --trace-children=yes env LD_LIBRARY_PATH=$(LIB_PATH) ./$(BIN) --leak-check=full

run: all
	@env LD_LIBRARY_PATH=$(LIB_PATH) ./$(BIN)
