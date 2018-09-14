module output
  use physics
  implicit none
contains
  ! A subroutine to write output to a file
subroutine write_output(istep,nx,x,u,time, nu)
  integer, intent(in) :: istep,nx, nu
  real, intent(in) :: x(nx), u(1,nx), time
  character(len=40) :: filename
  real :: p(nu)
  integer :: iunit,i
  write(filename,"(a,i5.5,a)") 'data/output_',istep,'.dat' !TODO This is a bit scrappy
  print*,'writing to file ',trim(filename),' at time ',time
  open(newunit=iunit,file=filename,status='replace')
  write(iunit,*),time,istep
  do i=1,nx
    call cons2prim(u(:,i), p, nu)
    write(iunit,*) x(i),p
  enddo
  close(iunit)
end subroutine write_output
end module output
