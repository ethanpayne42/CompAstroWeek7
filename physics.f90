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

  subroutine get_f(nu,u,f,lambda)
    integer :: nu
    real :: f(nu), u(nu), lambda, p(nu)

    f = (1./2.)*u(nu)**2
    lambda = u(1) ! TODO THIS IS A TRASSSSHHHH

  end subroutine get_f

end module physics
