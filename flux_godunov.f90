module flux_godunov
  use physics, only: get_f
  implicit none

contains

  subroutine get_flux(ul,ur,f,nu, lambda)
    integer :: nu
    real :: ul(nu), ur(nu), f(nu)
    real :: fl(nu), fr(nu)
    real :: lambda_l, lambda_r, vsh, lambda

    vsh = (1./2)*(ur(1)+ul(1))

    call get_f(nu, ul, fl, lambda_l)
    call get_f(nu, ur, fr, lambda_r)

    lambda = max(abs(lambda_l), abs(lambda_r))

    f = (1./2)*(fr+fl - lambda*(ur-ul))

  end subroutine get_flux

end module flux_godunov
