using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class LaptopController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: Laptop
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LaptopList()
        {
            var list = db.SanPhams.Where(item => item.LoaiHang.TenLoai == "Laptop").ToList(); 
            return View(list);
        }

        public ActionResult LaptopCategory(int? id)
        {
            ViewBag.CategoryId = id; // Lưu id category để sử dụng trong view
            ViewBag.ActivePage = "Product";

            var products = db.SanPhams.Where(p => p.NhaCungCap.MaNCC == id).ToList();
            return View(products);
        }

        public ActionResult SearchLaptop(string Search)
        {
            ViewBag.ActivePage = "Product";

            var search = db.SanPhams.Where(item => item.TenSP.Contains(Search)).ToList();
            return View(search);
        }

        public ActionResult SortAsc()
        {

            ViewBag.ActivePage = "Product";
            var ascMobile = (from item in db.SanPhams
                             where item.LoaiHang.TenLoai == "Laptop"
                             orderby item.GiaTienDaKhuyenMai
                             ascending
                             select item).ToList();
            return View(ascMobile);
        }

        public ActionResult SortDesc()
        {
            ViewBag.ActivePage = "Product";
            var descMobile = (from item in db.SanPhams
                              where item.LoaiHang.TenLoai == "Laptop"
                              orderby item.GiaTienDaKhuyenMai
                              descending
                              select item).ToList();
            return View(descMobile);
        }
    }
}