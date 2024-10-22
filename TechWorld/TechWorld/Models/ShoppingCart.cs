using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechWorld.Models
{
    public class ShoppingCart
    {
        public List<ShoppingCartItem> items { get; set; }

        public ShoppingCart()
        {
            this.items = new List<ShoppingCartItem>();
        }
        public void AddToCart(ShoppingCartItem item, int soluong)
        {
            var check = items.FirstOrDefault(x => x.MaSP == item.MaSP);
            if (check != null)
            {
                check.SoLuong += soluong;
                check.TongTien = (decimal)check.GiaTien * check.SoLuong;
            }
            else
            {
                items.Add(item);
            }
        }
        public void delete(int id)
        {
            var checkItem = items.SingleOrDefault(item => item.MaSP == id);
            if (checkItem != null)
            {
                items.Remove(checkItem);
            }
        }
    }
    public class ShoppingCartItem
    {
        public int MaSP { get; set; }
        public string TenSP { get; set; }
        public string MaLoai { get; set; }
        public string HinhAnh { get; set; }
        public int SoLuong { get; set; }
        public float GiaTien { get; set; }
        public decimal TongTien { get; set; }
        public DateTime NgayDatHang { get; set; }
    }
}