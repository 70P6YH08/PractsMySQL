using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace pr18
{
    /// <summary>
    /// Логика взаимодействия для QueryWindow.xaml
    /// </summary>
    public partial class QueryWindow : Window
    {
        public QueryWindow()
        {
            InitializeComponent();
        }

        private void Table_Button_Click(object sender, RoutedEventArgs e)
        {
            string tableString = TableTextBox.Text;
            DataTable dataTable = DataAccessLayer.GetInfoByQuery(tableString);

            TableDataGrid.ItemsSource = dataTable.DefaultView;
        }

        private void Query_Button_Click(object sender, RoutedEventArgs e)
        {
            string queryString = QueryTextBox.Text;
            object resultQuery =  DataAccessLayer.GetValueByStringQuery(queryString);

            ResultQueryLabel.Content = resultQuery;
        }
    }
}
