/* *  Created on: March 24th 2017 *  Author: Thomas Diaz, Fotis Tsakiris
 * */Language: C Language 
Program: This program simulates Floyd Warshall's algorithm with 2000 nodes and a seed that is ranged from 1-10 to create the Graph. It prints the current graph of Matrix A, then proceeds to initialize floyd algorithm and print Matrix B containing the revised graph. 

Compile: 
icc -o test -fopenmp test.c

Export Threads:
export OMP_NUM_THREADS= 1 

Initialize: 
./test 

Makefile: 
Make all 

Input: 
The program will request you enter a # that will generate a matrix or graph of n number of nodes. The max number of nodes is 2000. 
