using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection.PortableExecutable;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace pr18
{
    public static class DataAccessLayer
    {
        public static string hostName = "localhost";
        public static string portName = "3306";
        public static string databaseName = "pr1";
        public static string loginUser = "root";
        public static string passwordUser = "root";


        public static string connectionString
        {
            get
            {
                var stringBuilder = new MySqlConnectionStringBuilder();
                stringBuilder.Server = hostName;
                stringBuilder.UserID = loginUser;
                stringBuilder.Password = passwordUser;
                stringBuilder.Database = databaseName;
                return stringBuilder.ConnectionString;
            }
        }

        public static bool TestConnection()
        {
            try
            {
                using (var connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    return true;
                }
            }
            catch
            {
                return false;
            }

        }

        public static DataTable GetInfoByQuery(string tableName)
        {
            try
            {
                DataTable table = new DataTable();
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand command = new MySqlCommand("SELECT * FROM " + tableName, connection);
                    table.Load(command.ExecuteReader());
                }
                return table;
            }
            catch
            {
                return new DataTable();
            }
        }

        public static object GetValueByStringQuery(string stringQuery)
        {
            try
            {
                using (var connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand mySqlCommand = new MySqlCommand(stringQuery, connection);
                    object result = mySqlCommand.ExecuteScalar();
                    return result;
                }
            }
            catch
            {
                return null;
            }
        }

        public static int GetCountUpdateStringByStringQuery(string stringQuery)
        {
            try
            {
                using (var connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand mySqlCommand = new MySqlCommand(stringQuery, connection);
                    int result = mySqlCommand.ExecuteNonQuery();
                    if (result > 0)
                        return result;
                    else
                        return 0;
                }
            }
            catch
            {
                return -1;
            }
        }

        public static string DeleteBookById(string id)
        {
            try
            {
                using (var connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand mySqlCommand = new MySqlCommand(
                        "DELETE FROM books WHERE book_id = @id",
                        connection);
                    mySqlCommand.Parameters.AddWithValue("@id", id);
                    int deleteBook = mySqlCommand.ExecuteNonQuery();
                    if (deleteBook > 0)
                        return "Книга удалена";
                    else
                        return "Книга не найдена!";

                }
            }
            catch
            {
                return "Неизвестная команда";
            }
        }

        public static string InsertBookByValues(params string[] values)
        {
            try
            {
                using (var connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    MySqlCommand mySqlCommand = new MySqlCommand(
                        $"INSERT INTO books(book_id, author_id, title, genre, price, weight, pages, public_year, count)" +
                        $"VALUES(@bookId, @authorId, @title, @genre, @price, @weight, @pages, @publicYear, @count)",
                        connection);

                    mySqlCommand.Parameters.AddWithValue("@bookId", values[0]);
                    mySqlCommand.Parameters.AddWithValue("@authorId", values[1]);
                    mySqlCommand.Parameters.AddWithValue("@title", values[2]);
                    mySqlCommand.Parameters.AddWithValue("@genre", values[3]);
                    mySqlCommand.Parameters.AddWithValue("@price", values[4]);
                    mySqlCommand.Parameters.AddWithValue("@weight", values[5]);
                    mySqlCommand.Parameters.AddWithValue("@pages", values[6]);
                    mySqlCommand.Parameters.AddWithValue("@publicYear", values[7]);
                    mySqlCommand.Parameters.AddWithValue("@count", values[8]);
                    int inserBook = mySqlCommand.ExecuteNonQuery();
                    if (inserBook > 0)
                        return "Книга добалена";
                    else
                        return "Ошибка добавления!";
                }
            }
            catch
            {
                return "Неизвестная команда";
            }
        }
    }
}
