using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class ComputerComponentController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: ComputerComponent
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ComputerList()
        {
            ViewBag.ActivePage = "Product";
            var categories = new List<string> { "Main", "CPU", "VGA", "Case", "Nguồn/Tản", "Ổ cứng/Ram/Thẻ nhớ"};
            var list = db.SanPhams.Where(item => categories.Contains(item.LoaiHang.TenLoai)).ToList();
            return View(list);
        }

        public ActionResult ComputerSearch(string Search)
        {
            ViewBag.ActivePage = "Product";
            var categories = new List<string> { "Main", "CPU", "VGA", "Case", "Nguồn/Tản", "Ổ cứng/Ram/Thẻ nhớ" };
            var search = db.SanPhams.Where(item => categories.Contains(item.LoaiHang.TenLoai) && item.TenSP.Contains(Search)).ToList();
            return View(search);
        }

        public ActionResult ComputerAsc()
        {
            ViewBag.ActivePage = "Product";
            var categories = new List<string> { "Main", "CPU", "VGA", "Case", "Nguồn/Tản", "Ổ cứng/Ram/Thẻ nhớ" };
            var ascComputer = (from item in db.SanPhams
                               where categories.Contains(item.LoaiHang.TenLoai)
                               orderby item.GiaTienDaKhuyenMai
                               ascending
                               select item).ToList();
            return View(ascComputer);
        }

        public ActionResult ComputerDesc()
        {
            ViewBag.ActivePage = "Product";
            var categories = new List<string> { "Main", "CPU", "VGA", "Case", "Nguồn/Tản", "Ổ cứng/Ram/Thẻ nhớ" };
            var descComputer = (from item in db.SanPhams
                               where categories.Contains(item.LoaiHang.TenLoai)
                               orderby item.GiaTienDaKhuyenMai
                               descending
                               select item).ToList();
            return View(descComputer);
        }

        public ActionResult ComputerCategory(string name)
        {
            ViewBag.ActivePage = "Product";
            Session["ComputerCategory"] = name;
            var list = db.SanPhams.Where(item => item.LoaiHang.TenLoai == name).ToList();
            return View(list); 
        }

        public ActionResult ComputerCategorySearch(string Search)
        {
            ViewBag.ActivePage = "Product";
            string name = Session["ComputerCategory"] as string;
            var search = db.SanPhams.Where(item => item.TenSP.Contains(Search) && item.LoaiHang.TenLoai == name).ToList();
            return View(search);
        }

        public ActionResult ComputerCategoryAsc()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["ComputerCategory"] as string;
            var ascCategory = (from item in db.SanPhams
                               where item.LoaiHang.TenLoai == name
                               orderby item.GiaTienDaKhuyenMai
                               ascending select item).ToList();
            return View(ascCategory); 
        }

        public ActionResult ComputerCategoryDesc()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["ComputerCategory"] as string;
            var descCategory = (from item in db.SanPhams
                               where item.LoaiHang.TenLoai == name
                               orderby item.GiaTienDaKhuyenMai
                               descending
                               select item).ToList();
            return View(descCategory);
        }
    }
}