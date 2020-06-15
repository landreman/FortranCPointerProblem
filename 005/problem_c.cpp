#include <iostream>

typedef void (*objective_function_type)(int*);

extern "C" {

  void c_fun(objective_function_type my_function) {
    int N = 3;
    int* p = &N;

    std::cout << "Hello from C++. p =" << p << std::endl;

    my_function(p);

  }

  void print_pointer(int* p) {
    std::cout << "C++: print_pointer: p = " << p << std::endl;
  }

}
