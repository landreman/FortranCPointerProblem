#include <iostream>

typedef void (*objective_function_type)(int*);
typedef void (*objective_function_int_type)(int*);

extern "C" {

  void f_fun_bound(int*);

  void c_fun(objective_function_type my_function) {
    int N = 3;
    int* p = &N;

    std::cout << "Hello from C++. p =" << p << std::endl;

    my_function(p);

    std::cout << "Now C++ will call fortran without using a function pointer." << std::endl;

    f_fun_bound(p);

  }

  void c_fun_int(objective_function_int_type my_function) {
    int N = 3;

    std::cout << "Hello from c_fun_int. N = " << N << std::endl;

    my_function(&N);

  }

  void print_pointer(int* p) {
    std::cout << "C++: print_pointer: p = " << p << std::endl;
  }

}
