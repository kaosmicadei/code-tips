CXX=clang++
CXXFLAGS=--std=c++17 -Wall -O2
AR=ar -r
LIBDIR=./lib
OBJDIR=./obj
SRCDIR=./src
HDRDIR=./header
TARGET=mylib

all: $(TARGET)

$(TARGET): $(TARGET).o
	$(AR) $(LIBDIR)/lib$(TARGET).a $(OBJDIR)/$(TARGET).o

%.o: $(SRCDIR)/%.cpp $(HDRDIR)/%.hpp
	$(CXX) $(CXXFLAGS) -c -o $(OBJDIR)/$@ $< -I$(HDRDIR)

clean:
	$(RM) $(LIBDIR)/* $(OBJDIR)/*