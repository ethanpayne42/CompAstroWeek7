module step
  implicit none

contains

  function LW(u0, u1, un1, fac, nu) result(u_new)
    integer :: nu
    real :: u0(nu), u1(nu), un1(nu), fac
    real :: u_new(nu), u1h(nu), un1h(nu)

    u1h = (1./2)*(u0+u1) - (fac/2)*(u1-u0)
    un1h = (1./2)*(un1+u0) - (fac/2)*(u0-un1)

    u_new = u0 - fac*(u1h-un1h)

  end function LW

  subroutine bounds(up,j, u0, un1, u1, nx, nu)
    ! Function to set the u0, un1, and u1
    integer :: nu
    real :: u0(nu), u1(nu), un1(nu)
    real :: up(nu,0:nx)
    integer :: j, nx

    if (j==nx) then
      u0 = up(:,j)
      u1 = up(:,0)
      un1 = up(:,j-1)
    elseif (j==0) then
      u0 = up(:,j)
      u1 = up(:,j+1)
      un1 = up(:,nx)
    else
      u0 = up(:,j)
      u1 = up(:,j+1)
      un1 = up(:,j-1)
    end if

  end subroutine bounds

  subroutine scheme(u, up, j, dx, dt, v, nx, nu)
    real :: dx, dt, v
    real :: u(:,0:), up(nu,0:nx)
    integer :: j, nx
    real :: fac
    real :: u0(nu), u1(nu), un1(nu)
    integer :: nu

    call bounds(up,j, u0, un1, u1, nx, nu)
    fac =(dt/dx)*v
    u(:,j) = LW(u0, u1, un1, fac, nu)

  end subroutine scheme

  subroutine step_1(t, istep, u, &
    dx, dt, v, nx, nu)
    integer :: nu
    integer :: istep, nx, j
    real :: t, v, dx, dt
    real :: u(:,:), up(nu,0:nx)


    t = t + dt
    istep = istep + 1

    up = u
    do j=0,nx
      call scheme(u, up, j, dx, dt, v, nx, nu)
    end do

  end subroutine step_1


end module step
