using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations.Model;
using System.Linq;
using System.Web;

namespace TechWorld.Models
{
    public class LoaiHangNCCViewModel
    {
        public int MaSP {  get; set; }
        public string TenSP { get; set; }
        public string GiaTien {  get; set; }
        public int SoLuong { get; set; }
        public string MoTa {  get; set; }
        public string MoTaSanPham { get; set; }
        public string HinhAnh {  get; set; }
        public string GiamGia { get; set; }
        public int MaLoai { get; set; }
        public int MaNCC {  get; set; }
        public string NgayNhap {  get; set; }
        public List<LoaiHang> LoaiHangList { get; set; }
        public List<NhaCungCap> NhaCungCapList { get; set; }
        public SanPham SanPham { get; set; }
    }
}