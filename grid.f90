module grid

  implicit none

 contains

subroutine set_grid(xs, nx, dx)

  real, intent(out) :: xs(0:)
  real, intent(in) :: dx
  integer, intent(in) :: nx
  integer :: i

  ! Construct and x and t arrays
  xs = (/(i*dx, i=0,nx)/)

end subroutine set_grid

subroutine set_dt(dt, dx, v)
  real :: dt
  real :: dx
  real :: v

  dt = 0.5*dx/v
end subroutine set_dt


end module grid
