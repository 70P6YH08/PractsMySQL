#include "library.h"
double sum(double a, double b) {
    return a + b;
}

double sub(double a, double b) {
    return a - b;
}
int factorial(int n) {
    if (n < 0) return -1;
    if (n == 0 || n == 1) return 1;
    return n * factorial(n - 1);
}
int poisk(char stroka[], int dlina, char simvol) {
    for (int i = 0; i < dlina; i++) {
        if (stroka[i] == simvol) {
            return i;
        }
    }
    return -1;
}