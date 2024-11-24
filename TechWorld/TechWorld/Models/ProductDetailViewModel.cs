using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechWorld.Models
{
    public class ProductDetailViewModel
    {
        public SanPham ProductDetail { get; set; }
        public List<SanPham> SimilarProducts { get; set; }
        public List<AnhSP> HinhAnhSP { get; set; }
    }
}