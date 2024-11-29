using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class LaptopGamingController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: LaptopGaming
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LaptopGamingList()
        {
            ViewBag.ActivePage = "Product";

            var list = db.SanPhams.Where(item => item.LoaiHang.TenLoai == "Laptop Gaming").ToList();
            return View(list);
        }

        public ActionResult LaptopGamingCategory(string name)
        {
            ViewBag.ActivePage = "Product";
            Session["LaptopGamingCategory"] = name;

            var products = db.SanPhams.Where(item => item.NhaCungCap.TenNCC == name).ToList();
            return View(products);
        }

        public ActionResult SearchLaptopGaming(string Search)
        {
            ViewBag.ActivePage = "Product";

            var search = db.SanPhams.Where(item => item.TenSP.Contains(Search)).ToList();
            return View(search);
        }

        public ActionResult SearchLaptopGamingCategory(string Search)
        {
            ViewBag.ActivePage = "Product";
            // Sử dụng giá trị name đã lưu
            string name = Session["LaptopGamingCategory"] as string;
            var searchLaptopGaming = db.SanPhams.Where(item => item.TenSP.Contains(Search) && item.NhaCungCap.TenNCC == name).ToList();
            return View(searchLaptopGaming);
        }

        public ActionResult SortAsc()
        {

            ViewBag.ActivePage = "Product";
            var ascLaptopGaming = (from item in db.SanPhams
                             where item.LoaiHang.TenLoai == "Laptop Gaming"
                             orderby item.GiaTienDaKhuyenMai
                             ascending
                             select item).ToList();
            return View(ascLaptopGaming);
        }

        public ActionResult SortAscLaptopGamingCategory()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["LaptopGamingCategory"] as string;
            var ascLaptopGaming = (from item in db.SanPhams
                             where item.NhaCungCap.TenNCC == name && item.LoaiHang.TenLoai == "Laptop Gaming"
                             orderby item.GiaTienDaKhuyenMai
                             ascending
                             select item).ToList();
            return View(ascLaptopGaming);
        }

        public ActionResult SortDesc()
        {
            ViewBag.ActivePage = "Product";
            var descLaptopGaming = (from item in db.SanPhams
                              where item.LoaiHang.TenLoai == "Laptop Gaming"
                              orderby item.GiaTienDaKhuyenMai
                              descending
                              select item).ToList();
            return View(descLaptopGaming);
        }

        public ActionResult SortDescLaptopGamingCategory()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["LaptopGamingCategory"] as string;
            var ascLaptopGaming = (from item in db.SanPhams
                             where item.NhaCungCap.TenNCC == name && item.LoaiHang.TenLoai == "Laptop Gaming"
                             orderby item.GiaTienDaKhuyenMai
                             ascending
                             select item).ToList();
            return View(ascLaptopGaming);
        }
    }
}