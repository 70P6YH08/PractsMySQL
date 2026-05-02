#include <iostream>
#include "mylib.h"
using namespace std;

int main() {
    setlocale(LC_ALL, "Russian");
    double a, b;
    cout << "===== Проверка суммы и разности =====" << endl;
    cout << "Введите первое число: ";
    cin >> a;
    cout << "Введите второе число: ";
    cin >> b;
    cout << "Сумма: " << sum(a, b) << endl;
    cout << "Разность: " << sub(a, b) << endl;
    cout << endl;

    int n;
    cout << "===== Проверка факториала =====" << endl;
    cout << "Введите число для факториала: ";
    cin >> n;

    int fact = factorial(n);
    if (fact == -1) {
        cout << "Ошибка: факториал отрицательного числа не определен" << endl;
    }
    else {
        cout << "Факториал " << n << " = " << fact << endl;
    }
    cout << endl;

    const int DLINA = 80;
    char stroka[DLINA];
    char simvol;

    cout << "===== Проверка поиска символа в строке =====" << endl;
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