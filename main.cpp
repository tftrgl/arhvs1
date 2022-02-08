#include <iostream>
using namespace std;
extern "C" int func(int);
int main()
{
    int x = 6;
    printf("%i\n", func(x));
    return 0;
}
