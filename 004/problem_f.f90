module problem_mod
  use, intrinsic :: ISO_C_Binding
  implicit none

  !type mango_problem
  !   type(C_ptr) :: object = C_NULL_ptr
  !end type mango_problem

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
     !subroutine objective_function_interface(N_parameters, state_vector, objective_value, failed, problem)
     !  import
     !  integer(C_int), intent(in) :: N_parameters
     !  real(C_double), intent(in) :: state_vector(N_parameters)
     !  real(C_double), intent(out) :: objective_value
     !  integer(C_int), intent(out) :: failed
     !  type(mango_problem), value, intent(in) :: problem
     !  !type(C_ptr), value, intent(in) :: user_data
     !end subroutine objective_function_interface

     subroutine objective_function_interface(problem)
       import
       !type(mango_problem), value, intent(in) :: problem
       type(C_ptr), value, intent(in) :: problem
       !type(C_ptr), value, intent(in) :: user_data
     end subroutine objective_function_interface
  end interface
end module problem_mod


program problem
  use problem_mod
  implicit none

  print *,"Hello from fortran main"

  call C_fun(C_funloc(f_fun))

contains

!subroutine f_fun(N, x, f, l, p) bind(C,name="f_fun")
!subroutine f_fun(N, x, f, l, p)
subroutine f_fun(p)
  use, intrinsic :: ISO_C_Binding
  use problem_mod
  implicit none
  !integer(C_int), intent(in) :: N
  !real(C_double), intent(in) :: x(N)
  !real(C_double), intent(out) :: f
  !integer(C_int), intent(out) :: l
  !!type(C_ptr), value :: p
  !type(mango_problem), value, intent(in) :: p
  type(C_ptr), value, intent(in) :: p

  print *, "Hello from f_fun"
  !print *,"N=",N,", size(x)=",size(x)
  !print *,"x=",x
  !print *,"l=",l
  !call print_pointer(p%object)
  call print_pointer(p)

  !f = 2.7;
  !l = 84;
end subroutine f_fun

end program problem
