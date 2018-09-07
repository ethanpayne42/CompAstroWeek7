! Module for the PDE routines required

module pde_method
  use schemes
  implicit none

contains

  subroutine iterables(up,j, u0, un1, u1, nx)
    ! Function to set the u0, un1, and u1
    real :: u0, u1, un1
    real :: up(0:)
    integer :: j, nx

    if (j==nx) then
      u0 = up(j)
      u1 = up(0)
      un1 = up(j-1)
    elseif (j==0) then
      u0 = up(j)
      u1 = up(j+1)
      un1 = up(nx)
    else
      u0 = up(j)
      u1 = up(j+1)
      un1 = up(j-1)
    end if

  end subroutine iterables

  ! Subroutine for the scheme
  subroutine scheme(u, up, j, dx, dt, v, nx, choice)
    real :: dx, dt, v
    real :: u(0:), up(0:)
    integer :: j, nx
    real :: fac
    integer :: choice
    real :: u0, u1, un1

    call iterables(up,j, u0, un1, u1, nx)

    select case(choice)
    case(0)
      fac =(1./2.)*(dt/dx)*v
      u(j) = FTCS(u0, u1, un1, fac)
    case(1)
      fac =(1./2.)*(dt/dx)*v
      u(j) = Lax(u0, u1, un1, fac)
    case(2)
      fac =(dt/dx)*v
      u(j) = upwind(u0, u1, un1, fac)
    case(3)
      fac =(dt/dx)*v
      u(j) = LW(u0, u1, un1, fac)
    end select

  end subroutine scheme


end module pde_method
