#include <iostream>
#include <string>
#include "mylib.hpp"

using namespace std;

int main (void) {
    auto x = input<int>("Please, type an integer number");
    cout << "the number typed was: " << x << endl;

    auto f = input<float>("Please, type a real number");
    cout << "the number typed was: " << f << endl;

    auto s = input<string>("Please, type a word");
    cout << "the word typed was: " << s << endl;
}