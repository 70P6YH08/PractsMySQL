using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
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
            catch (Exception ex)
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
            catch (Exception ex)
            {
                return -1;
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
                    return result;
                }
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
    }
}
