using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class ProductMobileController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: ProductMobile
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult IphoneList()
        {
            ViewBag.ActivePage = "Product";

            var list = db.SanPhams.Where(item => item.LoaiHang.TenLoai == "Dien Thoai").ToList();
            return View(list);
        }

        public ActionResult IphoneCategory(string name) 
        {
            ViewBag.ActivePage = "Product";
            ViewBag.IphoneCategory = name;
            // Lưu giá trị name
            Session["IphoneCategory"] = name;

            var products = db.SanPhams.Where(item => item.NhaCungCap.TenNCC == name).ToList();
            return View(products);
        }

        public ActionResult SearchIphone(string Search)
        {
            ViewBag.ActivePage = "Product";

            var search = db.SanPhams.Where(item => item.TenSP.Contains(Search)).ToList();
            return View(search);
        }

        public ActionResult SearchIphoneCategory(string Search)
        {
            ViewBag.ActivePage = "Product";
            // Sử dụng giá trị name đã lưu
            string name = Session["IphoneCategory"] as string;
            var searchApple = db.SanPhams.Where(item => item.TenSP.Contains(Search) && item.NhaCungCap.TenNCC == name).ToList();
            return View(searchApple);
        }

        public ActionResult SortAsc()
        {

            ViewBag.ActivePage = "Product";
            var ascMobile = (from item in db.SanPhams
                             where item.LoaiHang.TenLoai == "Dien Thoai"
                             orderby item.GiaTienDaKhuyenMai 
                             ascending 
                             select item).ToList();
            return View(ascMobile);
        }

        public ActionResult SortAscCategory()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["IphoneCategory"] as string;
            var ascMobile = (from item in db.SanPhams
                             where item.NhaCungCap.TenNCC == name && item.LoaiHang.TenLoai == "Dien Thoai"
                             orderby item.GiaTienDaKhuyenMai
                             ascending
                             select item).ToList();
            return View(ascMobile);
        }

        public ActionResult SortDesc()
        {
            ViewBag.ActivePage = "Product";
            var descMobile = (from item in db.SanPhams
                              where item.LoaiHang.TenLoai == "Dien Thoai"
                              orderby item.GiaTienDaKhuyenMai
                              descending
                              select item).ToList();
            return View(descMobile);
        }

        public ActionResult SortDescCategory()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["IphonCategory"] as string;
            var descMobile = (from item in db.SanPhams
                              where item.LoaiHang.TenLoai == "Dien Thoai" && item.NhaCungCap.TenNCC == name
                              orderby item.GiaTienDaKhuyenMai
                              descending
                              select item).ToList();
            return View(descMobile);
        }

        // Product Mobile Details
        public ActionResult ProductMobileDetail()
        {

            return View();
        }
    }
}