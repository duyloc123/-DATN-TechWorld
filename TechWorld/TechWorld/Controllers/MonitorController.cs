using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class MonitorController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: Monitor
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult MonitorList() 
        {
            ViewBag.ActivePage = "Product";
            var list = db.SanPhams.Where(item => item.LoaiHang.TenLoai == "Monitor").ToList();
            return View(list); 
        }

        public ActionResult MonitorCategory(string name)
        {
            ViewBag.ActivePage = "Product";
            Session["MonitorCategory"] = name;

            var monitor = db.SanPhams.Where(item => item.NhaCungCap.TenNCC == name && item.LoaiHang.TenLoai == "Monitor").ToList();
            return View(monitor);
        }

        public ActionResult MonitorSearch(string Search)
        {
            ViewBag.ActivePage = "Product";
            var search = db.SanPhams.Where(item => item.TenSP.Contains(Search) && item.LoaiHang.TenLoai == "Monitor").ToList();
            return View(search);
        }
        public ActionResult MonitorCategorySearch(string Search)
        {
            ViewBag.ActivePage = "Product";
            // Sử dụng giá trị name đã lưu
            string name = Session["MonitorCategory"] as string;
            var searchMonitor = db.SanPhams.Where(item => item.TenSP.Contains(Search) && item.NhaCungCap.TenNCC == name).ToList();
            return View(searchMonitor);
        }

        public ActionResult MonitorSortAsc()
        {
            ViewBag.ActivePage = "Product";
            var ascMonitor = (from item in db.SanPhams
                                   where item.LoaiHang.TenLoai == "Monitor"
                                   orderby item.GiaTienDaKhuyenMai
                                   ascending
                                   select item).ToList();
            return View(ascMonitor);
        }

        public ActionResult MonitorCategorySortAsc()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["MonitorCategory"] as string;
            var ascMonitorCategory = (from item in db.SanPhams
                                   where item.NhaCungCap.TenNCC == name && item.LoaiHang.TenLoai == "Monitor"
                                   orderby item.GiaTienDaKhuyenMai
                                   ascending
                                   select item).ToList();
            return View(ascMonitorCategory);
        }

        public ActionResult MonitorSortDesc()
        {
            ViewBag.ActivePage = "Product";
            var descMonitor = (from item in db.SanPhams
                              where item.LoaiHang.TenLoai == "Monitor"
                              orderby item.GiaTienDaKhuyenMai
                              ascending
                              select item).ToList();
            return View(descMonitor);
        }

        public ActionResult MonitorCategorySortDesc()
        {
            ViewBag.ActivePage = "Product";
            string name = Session["MonitorCategory"] as string;
            var descMonitorCategory = (from item in db.SanPhams
                                      where item.NhaCungCap.TenNCC == name && item.LoaiHang.TenLoai == "Monitor"
                                       orderby item.GiaTienDaKhuyenMai
                                      descending
                                      select item).ToList();
            return View(descMonitorCategory);
        }
    }
}