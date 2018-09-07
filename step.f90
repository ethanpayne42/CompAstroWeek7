module step
  use pde_method, only: scheme
  implicit none

contains

  subroutine step_1(t, istep, u, &
    dx, dt, v, nx, choice)

    integer :: istep, nx, choice, j
    real :: t, v, dx, dt
    real :: u(0:), up(0:nx)


    t = t + dt
    istep = istep + 1

    up = u
    do j=0,nx
      call scheme(u, up, j, dx, dt, v, nx, choice)
    end do

  end subroutine step_1


end module step
