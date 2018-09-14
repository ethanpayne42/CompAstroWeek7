module init
  use constants, only: pi
  use physics
  implicit none

contains

subroutine set_init(u, xs, nx, choice, nu)
  real :: u(:,0:)
  real :: p(nu,0:nx)
  real :: xs(0:)
  integer :: nx, choice, nu

  integer :: ind

  do ind=0,nx

    select case (choice)
      case(0)
        if (xs(ind) > 0.25 .and. xs(ind) < 0.75) then
          p(:,ind) = 1
        else
          p(:,ind) = 0
        end if
      case(1)
        p(:,ind) = sin(2*pi*xs(ind))
      case(2)
        p(:,ind) = xs(ind)
    end select
    call prim2cons(u(:,ind),p(:,ind),nu)
  end do

end subroutine set_init


end module init
