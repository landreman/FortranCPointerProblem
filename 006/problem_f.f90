module problem_mod
  use, intrinsic :: ISO_C_Binding
  implicit none

  interface
     subroutine C_fun (objective_function) bind(C,name="c_fun")
       import
       type(C_funptr), value :: objective_function
     end subroutine C_fun
     subroutine C_fun_int (objective_function) bind(C,name="c_fun_int")
       import
       type(C_funptr), value :: objective_function
     end subroutine C_fun_int
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

     subroutine objective_function_interface_int(d)
       import
       !integer(C_int), value, intent(in) :: d
       integer(C_int), intent(in) :: d
     end subroutine objective_function_interface_int
  end interface
end module problem_mod


program problem
  use problem_mod
  implicit none

  print *,"Hello from fortran main"

  call C_fun(C_funloc(f_fun))

  call C_fun_int(C_funloc(f_fun_int))

contains

  subroutine f_fun(p)
    use, intrinsic :: ISO_C_Binding
    use problem_mod
    implicit none
    type(C_ptr), value, intent(in) :: p
    
    print *, "Hello from f_fun"
    call print_pointer(p)
    
  end subroutine f_fun
  
  subroutine f_fun_int(N)
    use, intrinsic :: ISO_C_Binding
    use problem_mod
    implicit none
    !integer(C_int), value, intent(in) :: N
    integer(C_int), intent(in) :: N
    
    print *, "Hello from f_fun_int. N=",N
    
  end subroutine f_fun_int
  
end program problem



subroutine f_fun_bound(p) bind(C,name="f_fun_bound")
  use, intrinsic :: ISO_C_Binding
  use problem_mod
  implicit none
  type(C_ptr), value, intent(in) :: p

  print *, "Hello from f_fun_bound"
  call print_pointer(p)

end subroutine f_fun_bound
