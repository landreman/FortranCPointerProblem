module problem_mod
  use, intrinsic :: ISO_C_Binding
  implicit none

  interface
     subroutine C_fun (objective_function) bind(C,name="c_fun")
       import
       type(C_funptr), value :: objective_function
     end subroutine C_fun
     subroutine print_pointer (p) bind(C,name="print_pointer")
       import
       type(C_ptr), value :: p
     end subroutine print_pointer
  end interface

  abstract interface

     subroutine objective_function_interface(problem)
       import
       type(C_ptr), value, intent(in) :: problem
     end subroutine objective_function_interface
  end interface
end module problem_mod


program problem
  use problem_mod
  implicit none

  print *,"Hello from fortran main"

  call C_fun(C_funloc(f_fun))

contains

subroutine f_fun(p)
  use, intrinsic :: ISO_C_Binding
  use problem_mod
  implicit none
  type(C_ptr), value, intent(in) :: p

  print *, "Hello from f_fun"
  call print_pointer(p)

end subroutine f_fun

end program problem
