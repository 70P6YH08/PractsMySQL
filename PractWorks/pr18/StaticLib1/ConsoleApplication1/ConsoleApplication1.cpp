#include <iostream>
#include "library.h"
using namespace std;

#pragma comment(lib, "C:\\Users\\-221\\Students\\ispp31\\MySQL\\PractWorks\\pr18\\StaticLib1\\x64\\Debug\\StaticLib1.lib")

int main() {
    setlocale(LC_ALL, "Russian");

    double a, b;
    cout << "Введите первое число: ";
    cin >> a;
    cout << "Введите второе число: ";
    cin >> b;

    cout << "Сумма: " << sum(a, b) << endl;
    cout << "Разность: " << sub(a, b) << endl;

    int n;
    cout << "Введите число для факториала: ";
    cin >> n;

    int fact = factorial(n);
    if (fact == -1) {
        cout << "Ошибка: число отрицательное!" << endl;
    }
    else {
        cout << "Факториал " << n << " = " << fact << endl;
    }

    const int DLINA = 80;
    char stroka[DLINA];
    char simvol;

    cin.ignore();

    cout << "Введите строку (до 79 символов): ";
    cin.getline(stroka, DLINA);

    cout << "Введите символ для поиска: ";
    cin >> simvol;

    int index = poisk(stroka, DLINA, simvol);

    if (index != -1) {
        cout << "Символ '" << simvol << "' найден на позиции " << index << endl;
    }
    else {
        cout << "Символ '" << simvol << "' не найден" << endl;
    }

    return 0;
}