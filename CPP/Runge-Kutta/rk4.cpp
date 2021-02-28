#include "rk4.h"

template <typename T>
void RK4<T>::next (void) {
    T k1 =  step * f(x, y);
    T k2 =  step * f(x + step/2, y + k1/2);
    T k3 =  step * f(x + step/2, y + k2/2);
    T k4 =  step * f(x + step, y + k3);
    y += (k1 + 2*k2 + 2*k3 + k4)/6;
    x += step;
}

template void RK4<float>::next (void);
template void RK4<double>::next (void);
