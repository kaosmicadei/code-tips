#ifndef RK4_H
#define RK4_H

template <typename T>
struct RK4 {
    using bin_op_t = T(*)(T,T);
    T x;
    T y;
    T step;
    bin_op_t f;

    void next (void);
};

#endif
