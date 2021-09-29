#include "mylib.hpp"
#include <iostream>
#include <string>

using namespace std;

template<typename T>
T input(const char* message) {
    T in;
    cout << message << endl;
    cin >> in;
    return in;
}

template int input<int>(const char*);
template float input<float>(const char*);
template double input<double>(const char*);
template string input<string>(const char*);
