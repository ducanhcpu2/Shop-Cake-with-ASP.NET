//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace shop_cake.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public product()
        {
            this.bill_detail = new HashSet<bill_detail>();
        }
    
        public int id_product { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public Nullable<double> unit_price { get; set; }
        public Nullable<double> promotion_price { get; set; }
        public string image { get; set; }
        public string unit { get; set; }
        public Nullable<byte> @new { get; set; }
        public Nullable<System.DateTime> created_at { get; set; }
        public Nullable<System.DateTime> updated_at { get; set; }
        public Nullable<int> id_product_type { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<bill_detail> bill_detail { get; set; }
        public virtual product_types product_types { get; set; }
    }

    public partial class product_productType_ViewModel
    {
        public int id_product { get; set; }
        public string product_name { get; set; }
        public string image { get; set; }
        public Nullable<double> unit_price { get; set; }
        public Nullable<double> promotion_price { get; set; }
        public string product_types_name { get; set; }
    }
}
