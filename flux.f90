module flux

  implicit none

contains

  subroutine get_flux(ul,ur,f,nu)
    integer :: nu
    real :: ul(nu), ur(nu), f(nu)

    !f = flux_function(ul,ur)

  end subroutine get_flux

end module flux
