using SGSC.Utils;
using System.Windows;
using System.Windows.Controls;

namespace SGSC.Pages
{
    public partial class HomePageCreditAdvisor : Page
    {
        public HomePageCreditAdvisor()
        {
            InitializeComponent();
            creditAdvisorSidebar.Content = new Frames.CreditAdvisorSidebar("home");
		}

        private void ButtonClicNuevo_Cliente(object sender, RoutedEventArgs e)
        {            
            var customerInfoPage = new CustomerInfoPage(1);
            if (NavigationService != null)
            {
                NavigationService.Navigate(customerInfoPage);
            }
        }

		private void Frame_Navigated(object sender, System.Windows.Navigation.NavigationEventArgs e)
		{

		}
	}
}
