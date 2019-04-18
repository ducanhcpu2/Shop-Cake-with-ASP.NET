namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class bill_detail
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id_bill_detail { get; set; }

        public int? quantity { get; set; }

        [Column(TypeName = "date")]
        public DateTime? created_at { get; set; }

        [Column(TypeName = "date")]
        public DateTime? updated_at { get; set; }

        public double? unit_price { get; set; }

        public int? id_bill { get; set; }

        public int? id_product { get; set; }

        public virtual bill bill { get; set; }

        public virtual product product { get; set; }
    }
}
