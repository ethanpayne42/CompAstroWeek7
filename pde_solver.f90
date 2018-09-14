! Program for the solving of Burger's Equation

program pde_solver
  use pde_method, only: scheme
  use output, only: write_output
  use grid, only: set_grid, set_dt
  use init, only: set_init
  use step, only: step_1
  implicit none

  ! Specify the velocity:
  real :: v = 1

  ! specify spacing
  real, parameter :: lx = 1.
  integer :: nx = 100
  real :: dx

  ! Instantiate the x array
  real, allocatable :: xs(:)
  real, allocatable :: u(:)

  ! Set up iteration parameters and time and step data
  real :: dt
  real :: t = 0.
  real :: tmax = 1.0
  integer :: istep = 0

  ! Choose the method to use
  integer :: meth_choice, init_choice

  ! Set the Courant factor
  real :: cou

  dx = lx/nx
  nx = nx-1

  ! Allocate array
  allocate(xs(0:nx))
  allocate(u(0:nx))

  print*,'Set the Courant factor'
  read*,cou

  print*,'choose initial conditions:'
  print*,'Box function (0)'
  print*,'Sin function (1)'
  print*,'Straight line (2)'
  read*, init_choice

  print*,'choose method:'
  print*,'FTCS (0)'
  print*,'Lax (1)'
  print*,'Upwind (2)'
  print*,'Lax-Wendroff (3)'
  read*, meth_choice

  call set_dt(dt, dx, v, cou)
  call set_grid(xs, nx, dx)
  call set_init(u, xs, nx, init_choice)
  call write_output(istep,nx,xs,u,t, meth_choice)

  do while(t < tmax)

    call step_1(t, istep, u, dx, dt, v, nx, meth_choice)
    call write_output(istep,nx,xs,u,t, meth_choice)
  end do
  print*,'finished writing numeric solution to file'


end program pde_solver
