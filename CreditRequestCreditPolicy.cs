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
    
    public partial class CreditRequestCreditPolicy
    {
        public int IdCreditRequestCreditPolicy { get; set; }
        public Nullable<int> CreditPolicyId { get; set; }
        public int CreditRequestId { get; set; }
    
        public virtual CustomerContactInfo CustomerContactInfo { get; set; }
        public virtual Contact Contact { get; set; }
    }
}
