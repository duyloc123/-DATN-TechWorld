using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechWorld.Models
{
    public class SanPhamViewModel
    {
        public IPagedList<SanPham> SanPhams { get; set; }
        public List<AnhSP> AnhSPs { get; set; }
    }
}