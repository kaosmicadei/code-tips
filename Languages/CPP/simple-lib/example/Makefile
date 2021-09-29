CXX=clang++
CXXFLAGS=--std=c++17 -Wall -O2
RM=rm -f
SRCDIR=./src
BUILDDIR=./build
HDRDIR=../mylib/header
LIBDIR=../mylib/lib
LIB=mylib
TARGET=main

all: $(TARGET)

$(TARGET): $(SRCDIR)/$(TARGET).cpp
	$(CXX) $(CXXFLAGS) -o $(BUILDDIR)/$@ $< -I$(HDRDIR) -L$(LIBDIR) -l$(LIB)

run: $(BUILDDIR)/$(TARGET)
	$(BUILDDIR)/$(TARGET)

clean:
	$(RM) $(BUILDDIR)/$(TARGET)