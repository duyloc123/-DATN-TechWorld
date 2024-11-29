using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class GamingChairController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: GamingChair
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GamingChairList()
        {
            ViewBag.ActivePage = "Product";
            var list = db.SanPhams.Where(item => item.LoaiHang.TenLoai == "Gaming Chair").ToList();
            return View(list);
        }

        public ActionResult ChairCategory(string name)
        {
            ViewBag.ActivePage = "Product";
            Session["GamingChairCategory"] = name;
            var list = db.SanPhams.Where(item => item.NhaCungCap.TenNCC == name && item.LoaiHang.TenLoai == "Gaming Chair").ToList();
            return View(list);
        }

        public ActionResult GamingChairSearch(string Search)
        {
            ViewBag.ActivePage = "Product";
            var search = db.SanPhams.Where(item => item.TenSP.Contains(Search) && item.LoaiHang.TenLoai == "Gaming Chair").ToList();
            return View(search);
        }

        public ActionResult ChairCategorySearch(string Search)
        {
            ViewBag.ActivePage = "Product";
            string name = Session["GamingChairCategory"] as string;
            var search = db.SanPhams.Where(item => item.TenSP.Contains(Search) &&
            (item.LoaiHang.TenLoai == "Gaming Chair" && item.NhaCungCap.TenNCC == name)).ToList();
            return View(search);
        }

        public ActionResult ChairCategoryAsc()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["GamingChairCategory"] as string;
            var asc = (from item in db.SanPhams
                       where item.LoaiHang.TenLoai == "Gaming Chair" && item.NhaCungCap.TenNCC == name
                       orderby item.GiaTienDaKhuyenMai
                       select item).ToList();
            return View(asc);
        }

        public ActionResult GamingChairAsc()
        {
            ViewBag.ActivePage = "Product";
            var asc = (from item in db.SanPhams
                    where item.LoaiHang.TenLoai == "Gaming Chair"
                    orderby item.GiaTienDaKhuyenMai
                    ascending
                    select item).ToList();
            return View(asc);
        }

        public ActionResult GamingChairDesc()
        {
            ViewBag.ActivePage = "Product";
            var desc = (from item in db.SanPhams
                        where item.LoaiHang.TenLoai == "Gaming Chair"
                        orderby item.GiaTienDaKhuyenMai
                        descending
                        select item).ToList();
            return View(desc);
        }
        public ActionResult ChairCategoryDesc()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["GamingChairCategory"] as string;
            var desc = (from item in db.SanPhams
                        where item.LoaiHang.TenLoai == "Gaming Chair" && item.NhaCungCap.TenNCC == name
                        orderby item.GiaTienDaKhuyenMai
                        descending
                        select item).ToList();
            return View(desc);
        }
    }
}