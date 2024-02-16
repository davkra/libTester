// main.cpp
#include <dlfcn.h>
#include <iostream>

int main() {
    // Load the shared library
    void* handle = dlopen("./libhello.so", RTLD_LAZY);
    if (!handle) {
        std::cerr << "Cannot load library: " << dlerror() << std::endl;
        return 1;
    }

    // Get the function pointer
    typedef void (*SayHelloFunction)();
    SayHelloFunction sayHello = (SayHelloFunction)dlsym(handle, "sayHello");
    if (!sayHello) {
        std::cerr << "Cannot find function: " << dlerror() << std::endl;
        dlclose(handle);
        return 1;
    }

    // Call the function
    sayHello();

    // Close the library
    dlclose(handle);

    return 0;
}
