module init

  implicit none

contains

subroutine set_init(u, xs, nx)
  real :: u(0:)
  real :: xs(0:)
  integer :: nx

  integer :: ind

  do ind=0,nx
    if (xs(ind) > 0.25 .and. xs(ind) < 0.75) then
      u(ind) = 1
    else
      u(ind) = 0
    end if
  end do

end subroutine set_init


end module init
