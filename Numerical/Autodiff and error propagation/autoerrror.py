from numbers import Real
import numpy as np

class Dual:
    def __init__(self, value, gradient):
        if isinstance(value, Real) and all([isinstance(x, Real) for x in gradient]):
            self.value = value
            self.gradient = np.array(gradient)
        else:
            raise ValueError

    def __str__(self):
        return "{} + {}".format(self.value, self.gradient)
    
    # ADDITION
    def __add__(self, x):
        if isinstance(x, Dual):
            return Dual(self.value + x.value, self.gradient + x.gradient)
        return Dual(x, [0]).__add__(self)
    
    def __radd__(self, x):
        return Dual(x, [0]).__add__(self)

    # SUBTRACTION
    def __sub__(self, x):
        if isinstance(x, Dual):
            return Dual(self.value - x.value, self.gradient - x.gradient)
        return Dual(x, [0]).__sub__(self)
    
    def __rsub__(self, x):
        return Dual(x, [0]).__sub__(self)

    def __neg__(self):
        return Dual(-self.value, -self.gradient)

    # MULTIPLICATION
    def __mul__(self, x):
        if isinstance(x, Dual):
            return Dual(self.value * x.value, self.gradient * x.value + self.value * x.gradient)
        return Dual(x, [0]).__mul__(self)

    def __rmul__(self, x):
        return Dual(x, [0]).__mul__(self)

    def __pow__(self, x):
        if isinstance(x, Dual):
            return Dual(self.value**x.value, x.value * self.value**(x.value-1) * self.gradient + self.value**x.value * np.log(self.value) * x.gradient)
        return self.__pow__(Dual(x, [0]))
    
    def __rpow__(self, x):
        return Dual(x, [0]).__pow__(self)

    # DIVISION
    def __truediv__(self, x):
        if isinstance(x, Dual):
            return Dual(self.value / x.value, (self.gradient * x.value - self.value * x.gradient) / x.value**2)
        return self.__truediv__(Dual(x, [0]))

    def __rtruediv__(self, x):
        return Dual(x, [0]).__truediv__(self)
            
def sqrt(x):
    if isinstance(x, Dual):
        return Dual(np.sqrt(x.value), x.gradient / np.sqrt(x.value))
    return np.sqrt(x)

def uncert(f, sigmas):
    x = f.gradient * sigmas
    return sqrt(x.dot(x))

x = Dual(1,[1,0,0])
y = Dual(2,[0,1,0])
z = Dual(3,[0,0,1])
print(sqrt(2))
