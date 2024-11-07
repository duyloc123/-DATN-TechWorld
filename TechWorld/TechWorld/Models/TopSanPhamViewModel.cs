using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechWorld.Models
{
    public class TopSanPhamViewModel
    {
        public int MaSP {  get; set; }
        public string TenSP { get; set; }
        public string HinhAnh { get; set; }
        public int TongSoLuong { get; set; }
        public float TongTien { get; set; }
        public float GiaSP {  get; set; }
    }
}