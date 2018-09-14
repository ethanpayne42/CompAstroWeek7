module flux
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

    if (ul(1) > ur(1)) then
      if (vsh > 0) then
        f = fl
      elseif ( vsh <= 0 ) then
        f = fr
      end if
    elseif (ul(1) < ur(1)) then
      if ( ul(1) > 0) then
        f = fl
      elseif ( ur(1) < 0 ) then
        f = fr
      else
        f = 0
      end if
    end if

  end subroutine get_flux

end module flux
