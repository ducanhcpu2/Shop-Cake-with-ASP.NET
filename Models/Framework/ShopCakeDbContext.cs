namespace Models.Framework
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ShopCakeDbContext : DbContext
    {
        public ShopCakeDbContext()
            : base("shop_cakeEntities")
        {
        }

        public virtual DbSet<admin> admins { get; set; }
        public virtual DbSet<bill> bills { get; set; }
        public virtual DbSet<bill_detail> bill_detail { get; set; }
        public virtual DbSet<customer> customers { get; set; }
        public virtual DbSet<news> news { get; set; }
        public virtual DbSet<product> products { get; set; }
        public virtual DbSet<product_types> product_types { get; set; }
        public virtual DbSet<slide> slides { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<news>()
                .Property(e => e.image)
                .IsUnicode(false);

            modelBuilder.Entity<product>()
                .Property(e => e.image)
                .IsUnicode(false);

            modelBuilder.Entity<product_types>()
                .Property(e => e.image)
                .IsUnicode(false);
        }
    }
}
