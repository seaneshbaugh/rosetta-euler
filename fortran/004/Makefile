FC=gfortran

FCFLAGS=-ffree-form -fdefault-integer-8 -fdefault-real-8 -fbackslash -fimplicit-none -std=f2008 -pedantic -Wall -fbacktrace -fno-align-commons

PROGRAMS=004

all: $(PROGRAMS)

%: %.o
	$(FC) $(FCFLAGS) -o $@ $^

%.o: %.f95
	$(FC) $(FCFLAGS) -c $<

clean:
	rm -f *.o *.mod 004
