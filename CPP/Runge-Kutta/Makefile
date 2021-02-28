CXX=clang++
CXXFLAGS=-std=c++17 -O2
CC=clang++

all: main
%.o: %.cpp %.h
main: rk4.o main.o

clean:
	rm main *.o
