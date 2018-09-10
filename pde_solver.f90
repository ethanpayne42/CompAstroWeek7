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
  integer, parameter :: nx = 100
  real,parameter :: dx = lx/nx
  integer,parameter :: n = nx-1

  ! Instantiate the x array
  real :: xs(0:n)

  ! Set up iteration parameters and time and step data
  real :: dt
  real :: t = 0.
  real :: tmax = 1.0
  integer :: istep = 0

  ! Create the array for the velocities
  real :: u(0:n)

  ! Choose the method to use
  integer :: meth_choice, init_choice

  ! Set the Courant factor
  real :: cou

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
  call set_grid(xs, n, dx)
  call set_init(u, xs, n, init_choice)
  call write_output(istep,n,xs,u,t)

  do while(t < tmax)

    call step_1(t, istep, u, dx, dt, v, n, meth_choice)
    call write_output(istep,n,xs,u,t)
  end do
  print*,'finished writing numeric solution to file'


end program pde_solver
