FC=gfortran
FFLAGS=-O3 -Wall -Wextra -fdefault-real-8 -fcheck=all

SRC= output.f90 init.f90 grid.f90 pde_method.f90 pde_solver.f90
OBJ=${SRC:.f90=.o}

%.o: %.f90
	$(FC) $(FFLAGS) -o $@ -c $<

fdefault: advec

advec: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

clean: $(OBJ)
	rm *.o *.mod advec
