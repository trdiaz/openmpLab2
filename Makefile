CC=icc
OMP_PARALLEL=TRUE
GROMACS_DIR=<GROMACS HOME DIRECTORY>
LAPACK_DIR=<LAPACK HOME DIRECTORY>

LIB_DIRS=$(GROMACS_DIR)/lib -L $(LAPACK_DIR) 
INC_DIRS=$(GROMACS_DIR)/include/gromacs/ -I $(LAPACK_DIR)/lapacke/include 

ifeq ($(OMP_PARALLEL), TRUE)
CFLAGS=-Wall -O3 -openmp -DOMP_PARALLEL=TRUE
LIBFLAGS=-g -lgmx -ldl -lfftw3 -lm -llapacke -llapack -lblas
else
CFLAGS=-Wall -O3
LIBFLAGS=-g -lgmx -ldl -lfftw3 -lm -llapacke -llapack -lblas
endif


OBJECTS=test.o

all: $(OBJECTS)
	$(CC) $(OBJECTS) -o g_spec -L $(LIB_DIRS) $(LIBFLAGS) $(CFLAGS)

test.o: test.c 
	$(CC) $(CFLAGS) -c -I $(INC_DIRS) test.c -L $(LIB_DIRS) $(LIBFLAGS)

clean:
	rm *.o