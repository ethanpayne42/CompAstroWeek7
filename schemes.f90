module schemes

  implicit none

contains

  function FTCS(u0, u1, un1, fac) result(u_new)
    real :: u0, u1, un1, fac
    real :: u_new

    u_new = u0 - fac*(u1-un1)
  end function FTCS

  function Lax(u0, u1, un1, fac) result(u_new)
    real :: u0, u1, un1, fac
    real :: u_new

    u_new = (1./2.)*(u1+un1) - fac*(u1-un1)

  end function Lax

  function upwind(u0, u1, un1, fac) result(u_new)
    real :: u0, u1, un1, fac
    real :: u_new

    u_new = u0 - fac*(u0-un1)
  end function upwind

end module schemes
