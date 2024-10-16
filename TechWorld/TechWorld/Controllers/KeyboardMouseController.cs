using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class KeyboardMouseController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: KeyboardMouse
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult KeyBoardMouseList()
        {
            ViewBag.ActiveBag = "Product";

            var list = db.SanPhams.Where(item => item.LoaiHang.TenLoai == "Keyboard" || item.LoaiHang.TenLoai == "Mouse").ToList();
            return View(list); 
        }

        public ActionResult KeyBoardMouseCategory(string name)
        {
            ViewBag.ActiveBag = "Product";
            Session["KeyBoardMouseCategory"] = name;

            var list = db.SanPhams.Where(item => item.LoaiHang.TenLoai == name || item.NhaCungCap.TenNCC == name).ToList();
            return View(list);
        }

        public ActionResult KeyBoardMouseFind(string Search)
        {
            ViewBag.ActivePage = "Product";

            var search = db.SanPhams.Where(item => item.TenSP.Contains(Search) 
                        && (item.LoaiHang.TenLoai == "Keyboard" 
                        || item.LoaiHang.TenLoai == "Mouse")).ToList();
            return View(search);
        }


        public ActionResult KeyBoardMouseCategoryFind(string Search)
        {
            ViewBag.ActivePage = "Product";
            // Sử dụng giá trị name đã lưu
            string name = Session["KeyBoardMouseCategory"] as string;
            var searchKeyBoardMouseCategory = db.SanPhams.Where(item => item.TenSP.Contains(Search) && item.NhaCungCap.TenNCC == name).ToList();
            return View(searchKeyBoardMouseCategory);
        }

        public ActionResult KeyBoardMouseSortAsc() 
        {
            ViewBag.ActivePage = "Product";
            var ascKeyBoardMouse = (from item in db.SanPhams
                             where item.LoaiHang.TenLoai == "Keyboard" || item.LoaiHang.TenLoai == "Mouse"
                             orderby item.GiaTienDaKhuyenMai
                             ascending
                             select item).ToList();
            return View(ascKeyBoardMouse);
        }

        public ActionResult KeyBoardMouseCategorySortAsc()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["KeyBoardMouseCategory"] as string;
            var ascCategory = (from item in db.SanPhams
                                   where item.NhaCungCap.TenNCC == name && (item.LoaiHang.TenLoai == "Keyboard" || item.LoaiHang.TenLoai == "Mouse")
                                   orderby item.GiaTienDaKhuyenMai
                                   ascending
                                   select item).ToList();
            return View(ascCategory);
        }

        public ActionResult KeyBoardMouseCategorySortDesc()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["KeyBoardMouseCategory"] as string;
            var descCategory = (from item in db.SanPhams
                               where item.NhaCungCap.TenNCC == name && (item.LoaiHang.TenLoai == "Keyboard" || item.LoaiHang.TenLoai == "Mouse")
                               orderby item.GiaTienDaKhuyenMai
                               descending
                               select item).ToList();
            return View(descCategory);
        }

        public ActionResult KeyBoardMouseSortDesc()
        {
            ViewBag.ActivePage = "Product";
            var descMobile = (from item in db.SanPhams
                             where item.LoaiHang.TenLoai == "Keyboard" || item.LoaiHang.TenLoai == "Mouse"
                             orderby item.GiaTienDaKhuyenMai
                             descending
                             select item).ToList();
            return View(descMobile);
        }
    }
}