! Program for the solving of Burger's Equation

program pde_solver
  use pde_routines, only: scheme, initial, boundary
  use output, only: write_output
  implicit none

  ! Specify the velocity:
  real :: v = 1

  ! specify spacing
  real, parameter :: lx = 1.
  integer, parameter :: nx = 100
  real,parameter :: dx = lx/nx

  ! Create the x array
  integer :: i, n, j
  real :: xs(0:nx) = 0
  real :: dt

  ! Create the array for the velocities
  real :: u(0:nx)
  real :: up(0:nx)

  real :: t = 0.
  real :: tmax = 1.000
  integer :: istep = 0

  integer :: choice

  print*,'choose method: FTCS (0), Lax (1)'
  read*, choice


  dt = 0.5*dx/v

  ! Construct and x and t arrays
  xs = (/(i*dx, i=0,nx)/)

  call initial(u, xs, nx)

  call write_output(istep,nx,xs,u,t)

  do while(t < tmax)

    ! if (abs(t-0.0) < 1e-4 .or. abs(t-0.2) < 1e-4 .or. &
    !  abs(t-0.5) < 1e-4 .or. abs(t-1.0) < 1e-4) then
    !end if

    t = t + dt
    istep = istep + 1

    up = u
    do j=0,nx
      call scheme(u, up, n, j, dx, dt, v, nx, choice)
    end do
    call write_output(istep,nx,xs,u,t)
  end do
  print*,'finished writing numeric solution to file, wo'

  close(1)


end program pde_solver
