// hello.cpp
#include <iostream>

extern "C" {
    void sayHello() {
        std::cout << "Hello, World!" << std::endl;
    }
}
