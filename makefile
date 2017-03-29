#Compiling openmp codes with 'make'
#Compiling pthread codes with 'make pthread'
#Running program with multiple parameters with 'make shell'


CC = gcc
CXX = g++
#-lm added in case we include math lib
CFLAGS = -Wall -std=c99 -lm -fopenmp
CXXFLAGS = -Wall -std=c99 -lm -fopenmp
#when want to play with pthread add this
LDFLAGS = -lrt -lpthread 


TARGET = HW2

#any headers go here
INCLUDES = 

#any .c or .cpp files go here
SOURCE = HW2.c

#My Latex file.
LATEXTARGET = HW2

#default is to compile
default: openmp 

#depends on all of you source and header files
openmp: ${SOURCE} ${INCLUDES}
		${CC} -o ${TARGET} ${SOURCE} ${CFLAGS}

pthread: ${SOURCE} ${INCLUDES}
		${CC} -o ${TARGET} ${SOURCE} ${CFLAGS} ${LDFLAGS}
	
shell:
	rm ./result.txt -f
	printf '' > result.txt
	for dn in 1 2 3 4 ; do\
		for cn in 1 2 4 8 16 24 32 64; do\
			./${TARGET} $$cn $$dn >> result.txt;\
		done;\
		printf '\n\n' >> result.txt;\
	done

	


