! Module for the PDE routines required

module pde_routines

  implicit none

contains

  ! Subroutine for to fill the initial conditions of
  ! the array
  subroutine initial(u,xs, nx)
    real :: u(0:nx)
    real :: xs(0:nx)
    integer :: nx

    integer :: ind

    do ind=0,nx
      if (xs(ind) > 0.25 .and. xs(ind) < 0.75) then
        u(ind) = 1
      else
        u(ind) = 0
      end if
    end do

  end subroutine initial

  ! Boundaries
  subroutine boundary(u, up, nx, i)
    real :: u(0:nx), up(0:nx)
    integer :: nx, i

    ! TODO this is dodgy but roll with it for now
    u(0) = up(nx)
    u(nx) = up(nx)

  end subroutine boundary

  ! Subroutine for the scheme
  subroutine scheme(u, up, n, j, dx, dt, v, nx, choice)
    real :: dx, dt, v
    real :: u(0:), up(0:)
    integer :: n, j, nx
    real :: fac
    integer :: choice
    fac =(1./2.)*(dt/dx)*v
    !u(j) = up(j) - fac*(up(j+1)-up(j-1))
    if (choice==1) then
      if (j==nx) then
        u(j) = (1./2.)*(up(0)+up(j-1)) - fac*(up(0)-up(j-1))
      elseif (j==0) then
        u(j) = (1./2.)*(up(j+1)+up(nx)) - fac*(up(j+1)-up(nx))
      else
        u(j) = (1./2.)*(up(j+1)+up(j-1)) - fac*(up(j+1)-up(j-1))
      end if
    elseif (choice==0) then
      if (j==nx) then
        u(j) = up(j) - fac*(up(0)-up(j-1))
      elseif (j==0) then
        u(j) = up(j) - fac*(up(j+1)-up(nx))
      else
        u(j) = up(j) - fac*(up(j+1)-up(j-1))
      end if
    end if

  end subroutine scheme


end module pde_routines
