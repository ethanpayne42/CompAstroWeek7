module output
  implicit none
contains
  ! A subroutine to write output to a file
subroutine write_output(istep,nx,x,u,time,choice)
  integer, intent(in) :: istep,nx, choice
  real, intent(in) :: x(nx), u(nx), time
  character(len=40) :: filename
  integer :: iunit,i
  write(filename,"(a,i1.1,a,i5.5,a)") 'data/output_',choice,'_',int(time*1000),'.dat' !TODO This is a bit scrappy
  print*,'writing to file ',trim(filename),' at time ',time
  open(newunit=iunit,file=filename,status='replace')
  write(iunit,*),time,istep
  do i=1,nx
  write(iunit,*) x(i),u(i)
  enddo
  close(iunit)
end subroutine write_output
end module output
