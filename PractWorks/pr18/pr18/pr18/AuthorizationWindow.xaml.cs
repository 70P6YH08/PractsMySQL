using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        public AuthorizationWindow()
        {
            InitializeComponent();
        }

        private void Authorization_Button_Click(object sender, RoutedEventArgs e)
        {
            string loginLabel = LoginTextBox.Text;
            string passwordLabel = PasswordTextBox.Text;

            DataAccessLayer.loginUser = loginLabel;
            DataAccessLayer.passwordUser = passwordLabel;

            if (DataAccessLayer.TestConnection())
            {
                MessageBox.Show($"Здравствуйте {loginLabel}!");
            }
            else
            {
                MessageBox.Show("Неверный логин или пароль!");
            }
        }
    }
}
