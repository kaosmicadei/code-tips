import dualnumber as dual
from dualnumber import asdual

def uncert(f, sigmas):
    x = f.gradient * sigmas
    return f.value, dual.sqrt(x.dot(x))