#include <iostream>
#include "rk4.h"
using namespace std;

int main (void) {
    auto f = [](auto x, auto y) { return -2*x*y; };
    RK4<float> p = { 0, 1, .1, f };
    for (int i = 0; i <= 20; i++) {
        cout << p.x << "\t" << p.y << endl;
        p.next();
    }
    return 0;
}
