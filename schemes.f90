module schemes

  implicit none

contains

  function FTCS(u0, u1, un1, fac) result(u_new)
    real :: u0, u1, un1, fac
    real :: u_new

    u_new = u0 - (fac/2)*(u1-un1)
  end function FTCS

  function Lax(u0, u1, un1, fac) result(u_new)
    real :: u0, u1, un1, fac
    real :: u_new

    u_new = (1./2.)*(u1+un1) - (fac/2)*(u1-un1)

  end function Lax

  function upwind(u0, u1, un1, fac) result(u_new)
    real :: u0, u1, un1, fac
    real :: u_new

    u_new = u0 - fac*(u0-un1)
  end function upwind

  function LW(u0, u1, un1, fac) result(u_new)
    real :: u0, u1, un1, fac
    real :: u_new
    real :: u1h, un1h

    u1h = (1./2)*(u0+u1) - (fac/2)*(u1-u0)
    un1h = (1./2)*(un1+u0) - (fac/2)*(u0-un1)

    u_new = u0 - fac*(u1h-un1h)

  end function LW



end module schemes
