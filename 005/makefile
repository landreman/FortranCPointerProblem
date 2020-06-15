ifeq ($(CLUSTER),DRACO)
  FC = mpiifort -g -O0
  CXX = mpiicc -g -O0
  LINKER = mpiifort -cxxlib
else
  FC = mpif90 -g -O0
  CXX = mpicc -g -O0
  LINKER = mpif90 -lstdc++
endif

all: problem

problem: problem_c.o problem_f.o
	$(LINKER) -o $@ $^

problem_c.o: problem_c.cpp
	$(CXX) -c $< -o $@

problem_f.o: problem_f.f90
	$(FC) -c $< -o $@

clean:
	rm -f *.o *.mod *.MOD problem

help:
	@echo FC is $(FC)
