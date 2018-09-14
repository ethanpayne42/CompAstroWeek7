module init
  use constants, only: pi
  implicit none

contains

subroutine set_init(u, xs, nx, choice)
  real :: u(:,0:)
  real :: xs(0:)
  integer :: nx, choice

  integer :: ind

  do ind=0,nx

    select case (choice)
      case(0)
        if (xs(ind) > 0.25 .and. xs(ind) < 0.75) then
          u(:,ind) = 1
        else
          u(:,ind) = 0
        end if
      case(1)
        u(:,ind) = sin(2*pi*xs(ind))
      case(2)
        u(:,ind) = xs(ind)
    end select
  end do

end subroutine set_init


end module init
