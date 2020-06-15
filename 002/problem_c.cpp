#include <iostream>

/*
int main(int argc, char* argv[]) {
  std::cout << "Hello from C++" << std::endl;
  return 0;
}
*/

class MyClass {
public:
  double var;
};

typedef void (*objective_function_type)(int* N_parameters, const double* state_vector, double* objective_value, int* failed, MyClass* problem);

extern "C" {

  //void f_fun(double*);
  //void f_fun(int*, const double*, double*, int*, MyClass*);

  void c_fun(objective_function_type my_function) {
    //double var = 3.14;
    //double* p = &var;
    MyClass* p = new MyClass();

    int N = 3;
    double x[3];
    x[0] = 100;
    x[1] = 101;
    x[2] = 102;
    double f = 3.14;
    int l = 42;

    std::cout << "Hello from C++. p =" << p << std::endl;

    //f_fun(&N, x, &f, &l, p);
    my_function(&N, x, &f, &l, p);

  }

  //void print_pointer(double* p) {
  void print_pointer(MyClass* p) {
    std::cout << "C++: print_pointer: p = " << p << std::endl;
  }

}
