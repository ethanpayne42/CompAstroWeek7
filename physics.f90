module physics

  implicit none

contains

  subroutine cons2prim(u, prim, nu)
    integer :: nu
    real :: u(nu), prim(nu)

    prim = u

  end subroutine cons2prim

  subroutine prim2cons(u, prim, nu)
    integer :: nu
    real :: u(nu), prim(nu)

    u = prim

  end subroutine prim2cons

end module physics
