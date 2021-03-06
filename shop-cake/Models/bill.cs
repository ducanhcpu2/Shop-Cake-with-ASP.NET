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
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class bill
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public bill()
        {
            this.bill_detail = new HashSet<bill_detail>();
        }
    
        public int id_bill { get; set; }
        public Nullable<System.DateTime> date_order { get; set; }
        public Nullable<double> total { get; set; }
        public string payment { get; set; }
        public string note { get; set; }
        public Nullable<System.DateTime> created_at { get; set; }
        public Nullable<System.DateTime> updated_at { get; set; }
        public Nullable<int> id_customer { get; set; }
    
        public virtual customer customer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<bill_detail> bill_detail { get; set; }
    }

    public partial class Item
    {
        public int id;
        public string name;
        public string description;
        public Nullable<double> unit_price;
        public Nullable<double> promotion_price;
        public string image;
        public string unit;
        public Nullable<byte> @new;
        public Nullable<System.DateTime> created_at;
        public Nullable<System.DateTime> updated_at;
        public int id_product_type;

        public int quantity;
    }

    public partial class bill_customerViewModel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id_bill { get; set; }
        [Key]

        public Nullable<System.DateTime> date_order { get; set; }
        public Nullable<double> total { get; set; }
        public string payment { get; set; }
        public string note { get; set; }
        public Nullable<System.DateTime> created_at { get; set; }
        public Nullable<System.DateTime> updated_at { get; set; }
        public string namecustomer { get; set; }
        public string emailcustomer { get; set; }
    }

    public partial class ShoppingCart
    {
        public List<Item> Item = new List<Item>();

        public void InsertItem(int id, string name, Nullable<double> unit_price, Nullable<double> promotion_price, string image, Nullable<byte> @new)
        {
            var obj = Item.Find(r => r.id == id);
            if (obj != null)
            {
                UpdateItem(id, 1);
            }
            else
            {
                Item.Add(new Models.Item() { id = id, name = name, unit_price = unit_price, promotion_price = promotion_price, image = image, @new = @new });
                UpdateItem(id, 1);
            }
        }

        public void UpdateItem(int id, int amount)
        {
            foreach (var i in Item)
            {
                if (i.id == id)
                {
                    i.quantity += amount;
                }
            }
        }


        public void UpdateNewQuantity(int id, int amount)
        {
            foreach (var i in Item)
            {
                if (i.id == id)
                {
                    i.quantity = amount;
                }
            }
        }

        public void RemoveItem(int id)
        {
            //foreach (var i in Item)
            //{
            //    if (i.id == id)
            //    {
            //        Item.Remove(i);
            //    }
            //}

            var a = Item.Find(r=>r.id == id);
            Item.Remove(a);
        }

        public Nullable<double> TotalPrice()
        {
            Nullable<double> sum = 0;
            foreach (var i in Item)
            {
                if (i.promotion_price > 0)
                {
                    sum += i.quantity * i.promotion_price;
                }
                else
                {
                    sum += i.quantity * i.unit_price;
                }
            }
            return sum;
        }

        public int TotalItem()
        {
            return Item.Count;
        }
    }
}
