#include "mylib.hpp"
#include <iostream>

using namespace std;

template<typename T>
T input(const char* message) {
    T in;
    cout << message << endl;
    cin >> in;
    return in;
}
