module step
  use flux_godunov
  use physics, only: cons2prim
  implicit none

contains
  subroutine bounds(up,j, u0, un1, u1, nx, nu)
    ! Function to set the u0, un1, and u1
    integer :: nu
    real :: u0(nu), u1(nu), un1(nu)
    real :: up(nu,0:nx)
    integer :: j, nx

    if (j==nx) then
      u0 = up(:,j)
      u1 = up(:,0)
      un1 = up(:,j-1)
    elseif (j==0) then
      u0 = up(:,j)
      u1 = up(:,j+1)
      un1 = up(:,nx)
    else
      u0 = up(:,j)
      u1 = up(:,j+1)
      un1 = up(:,j-1)
    end if

  end subroutine bounds

  subroutine scheme(u, up, j, dx, dt, nx, &
    nu, lambda)
    real :: dx, dt
    real :: u(:,0:), up(nu,0:nx)
    integer :: j, nx
    real :: fac
    real :: u0(nu), u1(nu), un1(nu)
    real :: fp1(nu), fn1(nu)
    integer :: nu
    real :: lambda_r, lambda_l, lambda

    call bounds(up,j, u0, un1, u1, nx, nu)
    fac = dt/dx

    call get_flux(u0,u1,fp1,nu, lambda_r)
    call get_flux(un1,u0,fn1,nu, lambda_l)

    lambda = max(lambda_r,lambda_l)

    u(:,j) = u0 - fac*(fp1-fn1)

  end subroutine scheme

  subroutine step_1(t, istep, u, &
    dx, dt, nx, nu, dtnew, cou)
    integer :: nu
    integer :: istep, nx, j
    real :: t, dx, dt
    real :: u(:,:), up(nu,0:nx)
    real :: lambda, cou, dtnew
    real :: lambdas(0:nx)

    istep = istep + 1

    up = u
    do j=0,nx
      call scheme(u, up, j, dx, dt, &
                  nx, nu, lambda)

      lambdas(j) = lambda
    end do

    call get_dtnew(dtnew,lambdas,dx,cou)

  end subroutine step_1

  subroutine get_dtnew(dtnew, lambdas, &
    dx, cou)
    real :: cou, dtnew, lambdas(:), dx
    real :: factor

    factor = minval(dx/lambdas)

    dtnew = cou*factor

  end subroutine get_dtnew


end module step
