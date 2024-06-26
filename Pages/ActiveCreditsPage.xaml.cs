﻿using SGSC.Frames;
using SGSC.Utils;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using static SGSC.Pages.ActiveCreditsPage;

namespace SGSC.Pages
{
    /// <summary>
    /// Interaction logic for ActiveCreditsPage.xaml
    /// </summary>
    public partial class ActiveCreditsPage : Page
    {
        private class ActiveCredit
        {
            public string CreditPageNumber { get; set; }
            public string ClientFullName { get; set; }
            public string CreditPeriod { get; set; }
            public string CreditAmount { get; set; }
            public string CreditPendingDebt { get; set; }
            public string CreditEfficiency { get; set; }
        }

        private ObservableCollection<ActiveCredit> ActiveCredits;
        private int CurrentPage = 1;
        private int TotalPages = 1;
        private const int ItemsPerPage = 10;
        private bool UpdatingPagination = false;

		public ActiveCreditsPage()
        {
            InitializeComponent();
            UserSessionFrame.Content = new UserSessionFrame();
            collectionExecutiveSidebar.Content = new CollectionExecutiveSidebar("activeCredits");
            GetActiveCredits();
		}

        private void UpdatePagination()
        {
            UpdatingPagination = true;

			try
            {
                using (var context = new sgscEntities())
                {
                    var activeCreditsCount = context.CreditRequests.Where(request => request.FileNumber.Contains(tbPageNumberFilter.Text) &&
                        (request.Customer.Name + " " + request.Customer.FirstSurname + " " + request.Customer.SecondSurname).Contains(tbCustomerNameFilter.Text) &&
                        request.Status == 4).Count();
					TotalPages = (int)Math.Ceiling((double)activeCreditsCount / ItemsPerPage);
                    lbCurrentPage.Content = $"Página {CurrentPage}/{TotalPages}";
                    cbPages.Items.Clear();
					for (uint i = 1; i <= TotalPages; i++)
                    {
                        cbPages.Items.Add(i);
                    }
                    cbPages.SelectedIndex = CurrentPage - 1;

                    btnNextPage.IsEnabled = CurrentPage < TotalPages;
                    btnPreviousPage.IsEnabled = CurrentPage > 1;
				}
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al intentar obtener los datos de los créditos activos: " + ex.Message);
            }

            UpdatingPagination = false;

		}

        private void GetActiveCredits()
        {
            try
            {
                using (var context = new sgscEntities())
                {
                    var activeCredits = context.CreditRequests.Where(request => request.FileNumber.Contains(tbPageNumberFilter.Text) && 
                        (request.Customer.Name + " " + request.Customer.FirstSurname + " " + request.Customer.SecondSurname).Contains(tbCustomerNameFilter.Text) && 
                        request.Status == 4).OrderBy(request => request.FileNumber).Skip((CurrentPage - 1) * ItemsPerPage).Take(ItemsPerPage);

					var activeCreditsArray = activeCredits.ToList();
                    ActiveCredits = new ObservableCollection<ActiveCredit>();
                    foreach (var item in activeCreditsArray)
                    {
                        ActiveCredits.Add(new ActiveCredit
                        {
                            CreditPageNumber = item.FileNumber,
                            ClientFullName = item.Customer.FullName,
                            CreditPeriod = item.TimePeriod.Value.ToString(),
                            CreditAmount = $"$ {item.Amount}",
                            CreditPendingDebt = "$ 0",
                            CreditEfficiency = "0%"
                        });
                    }
                    dgCredits.ItemsSource = ActiveCredits;
                }
                UpdatePagination();
			}
			catch (Exception ex)
            {
                MessageBox.Show("Error al intentar obtener los datos de los créditos activos: " + ex.Message);
            }
        }

        private void LogoutButton_Click(object sender, RoutedEventArgs e)
        {
            UserSession.LogOut();
        }

        private void tbFilter_TextChanged(object sender, TextChangedEventArgs e)
        {
            GetActiveCredits();
        }

		private void btnNextPage_Click(object sender, RoutedEventArgs e)
		{
            CurrentPage++;
            GetActiveCredits();
		}

		private void btnPreviousPage_Click(object sender, RoutedEventArgs e)
		{
			CurrentPage--;
            GetActiveCredits();
		}

		private void cbPages_SelectionChanged(object sender, SelectionChangedEventArgs e)
		{
            if(UpdatingPagination)
            {
                return;
            }
            CurrentPage = cbPages.SelectedIndex + 1;
			GetActiveCredits();
		}
	}
}
