﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SGSC
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class sgscEntities : DbContext
    {
        public sgscEntities()
            : base("name=sgscEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<BankAccount> BankAccounts { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<CreditCondition> CreditConditions { get; set; }
        public virtual DbSet<CreditPolicy> CreditPolicies { get; set; }
        public virtual DbSet<CreditRequest> CreditRequests { get; set; }
        public virtual DbSet<CustomerAddress> CustomerAddresses { get; set; }
        public virtual DbSet<CustomerContactInfo> CustomerContactInfoes { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<WorkCenter> WorkCenters { get; set; }
        public virtual DbSet<Bank> Banks { get; set; }
        public virtual DbSet<Colony> Colonies { get; set; }
    }
}
