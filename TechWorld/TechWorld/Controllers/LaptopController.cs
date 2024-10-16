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
            ViewBag.ActivePage = "Product";
            var list = db.SanPhams.Where(item => item.LoaiHang.TenLoai == "Laptop").ToList(); 
            return View(list);
        }

        public ActionResult LaptopCategory(string name)
        {
            ViewBag.ActivePage = "Product";
            Session["LaptopCategory"] = name;

            var products = db.SanPhams.Where(p => p.NhaCungCap.TenNCC == name && p.LoaiHang.TenLoai == "Laptop").ToList();
            return View(products);
        }

        public ActionResult SearchLaptop(string Search)
        {
            ViewBag.ActivePage = "Product";

            var search = db.SanPhams.Where(item => item.TenSP.Contains(Search)).ToList();
            return View(search);
        }

        public ActionResult SearchLaptopCategory(string Search)
        {
            ViewBag.ActivePage = "Product";
            // Sử dụng giá trị name đã lưu
            string name = Session["LaptopCategory"] as string;
            var searchLaptop = db.SanPhams.Where(item => item.TenSP.Contains(Search) && item.NhaCungCap.TenNCC == name).ToList();
            return View(searchLaptop);
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

        public ActionResult SortAscLaptopCategory()
        {

            ViewBag.ActivePage = "Product";
            string name = Session["LaptopCategory"] as string;

            var ascMobile = (from item in db.SanPhams
                             where item.LoaiHang.TenLoai == "Laptop" && item.NhaCungCap.TenNCC == name
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

        public ActionResult SortDescLaptopCategory()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["LaptopCategory"] as string;
            var descMobile = (from item in db.SanPhams
                              where item.LoaiHang.TenLoai == "Laptop" && item.NhaCungCap.TenNCC == name
                              orderby item.GiaTienDaKhuyenMai
                              descending
                              select item).ToList();
            return View(descMobile);
        }
    }
}