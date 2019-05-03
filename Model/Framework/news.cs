namespace Model.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class news
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id_news { get; set; }

        [StringLength(200)]
        public string title { get; set; }

        [StringLength(200)]
        public string content { get; set; }

        [StringLength(100)]
        public string image { get; set; }

        [Column(TypeName = "date")]
        public DateTime? created_at { get; set; }

        [Column(TypeName = "date")]
        public DateTime? updated_at { get; set; }
    }
}
