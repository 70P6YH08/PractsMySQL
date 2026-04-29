import mysql.connector
from mysql.connector import cursor

try:
    conn = mysql.connector.connect(host='localhost',user='root',passwd = 'root', db='pr1')
    cursor = conn.cursor()
    query = input("Запрос: ")
    price = input("Цена книги: ")

    cursor.execute(query, (price,))
    # for i in cursor.fetchall():
    #     print(i)

    for i in cursor.fetchall():
        print(f"Название: {i[2]}, цена: {i[4]}")

    conn.close()

except mysql.connector.Error as error:
    print(f"Ошибка MySQL: {error}")


# SELECT * FROM books WHERE price > %s