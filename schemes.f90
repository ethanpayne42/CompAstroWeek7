module schemes

  implicit none

contains

  function Lax(u0, u1, un1, fac) result(u_new)
    real :: u0, u1, un1, fac
    real :: u_new

    u_new = (1./2.)*(u1+un1) - fac*(u1-un1)

  end function Lax

  function FTCS(u0, u1, un1, fac) result(u_new)
    real :: u0, u1, un1, fac
    real :: u_new

    u_new = u0 - fac*(u1-un1)

  end function FTCS

end module schemes
