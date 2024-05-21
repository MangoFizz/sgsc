//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SGSC
{
    using System;
    using System.Collections.Generic;
    
    public partial class CreditRequest
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CreditRequest()
        {
            this.CreditConditions = new HashSet<CreditCondition>();
            this.Payment = new HashSet<Payment>();
        }
    
        public int CreditRequestId { get; set; }
        public string FileNumber { get; set; }
        public Nullable<double> Amount { get; set; }
        public Nullable<int> Status { get; set; }
        public Nullable<int> TimePeriod { get; set; }
        public string Purpose { get; set; }
        public Nullable<decimal> InterestRate { get; set; }
        public Nullable<System.DateTime> CreationDate { get; set; }
        public Nullable<int> EmployeeId { get; set; }
        public Nullable<int> CustomerId { get; set; }
        public int PaymentsInterval { get; set; }
        public string Description { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual BankAccount TransferBankAccount { get; set; }
        public virtual BankAccount DirectDebitBankAccount { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CreditCondition> CreditConditions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Payment> Payment { get; set; }
        public virtual Employee Employee { get; set; }
    }
}
