using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechWorld.Models
{
    public class ShoppingCart
    {
        public List<ShoppingCartItem> Items { get; set; }
        public ShoppingCart() 
        {
            this.Items = new List<ShoppingCartItem>();
        }
        public void AddToCart(ShoppingCartItem item, int Quantity)
        {
            // Kiểm tra sản phẩm có trong list
            var checkExits = Items.FirstOrDefault(x => x.MaSP == item.MaSP);
            if (checkExits != null)
            {
                checkExits.SoLuong += Quantity;
                checkExits.TongTien = checkExits.GiaTien * checkExits.SoLuong;
                return;
            }
            Items.Add(item);
        }

        public void Delete(int id)
        {
            var checkDelete = Items.SingleOrDefault(x => x.MaSP == id);
            if (checkDelete != null)
            {
                Items.Remove(checkDelete);
            }
        }

        public void UpdateQuantity(int id,  int quantity)
        {
            var checkExits = Items.SingleOrDefault(x => x.MaSP == id);
            if (checkExits != null)
            {
                checkExits.SoLuong = quantity;
                checkExits.TongTien = checkExits.GiaTien * checkExits.SoLuong;
            }
        }
        
        public decimal GetTotalPrice()
        {
            return Items.Sum(x => x.TongTien);
        }

        public int GetTotalQuantity()
        {
            return Items.Sum(x => x.SoLuong);
        }
    }

    public class ShoppingCartItem
    {
        public int MaSP { get; set; }
        public string TenSP { get; set; }
        public int SoLuong { get; set; }
        public string Image { get; set; }
        public decimal GiaTien { get; set; }
        public decimal TongTien { get; set; }
    }
}