! Program for the solving of Burger's Equation

program pde_solver
  use pde_method, only: scheme
  use output, only: write_output
  use grid, only: set_grid, set_dt
  use init, only: set_init
  implicit none

  ! Specify the velocity:
  real :: v = 1

  ! specify spacing
  real, parameter :: lx = 1.
  integer, parameter :: nx = 100
  real,parameter :: dx = lx/nx

  ! Instantiate the x array
  real :: xs(0:nx)

  ! Set up iteration parameters and dt
  integer :: i, n, j
  real :: dt

  ! Create the array for the velocities
  real :: u(0:nx)
  real :: up(0:nx)

  real :: t = 0.
  real :: tmax = 1.000
  integer :: istep = 0

  ! Choose the method to use
  integer :: choice

  print*,'choose method: FTCS (0), Lax (1)'
  read*, choice

  call set_dt(dt, dx, v)

  call set_grid(xs, nx, dx)

  call set_init(u, xs, nx)

  call write_output(istep,nx,xs,u,t)

  do while(t < tmax)

    t = t + dt
    istep = istep + 1

    up = u
    do j=0,nx
      call scheme(u, up, n, j, dx, dt, v, nx, choice)
    end do
    call write_output(istep,nx,xs,u,t)
  end do
  print*,'finished writing numeric solution to file'

  close(1)


end program pde_solver
