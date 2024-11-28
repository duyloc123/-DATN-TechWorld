using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechWorld.Controllers
{
    public class OrderViewModel
    {
        public int MaKH {  get; set; }
        public DateTime NgayDat { get; set; }
        public decimal TongTien { get; set; }
        public string Email { get; set; }
        public string PTThanhToan {  get; set; }
        public string TTDonHang { get; set; }
        public string TTThanhToan { get; set; }
    }
}