using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class EarphoneController : Controller
    {
        TechWorldEntities db =  new TechWorldEntities();
        // GET: Earphone
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult EarphoneList()
        {
            ViewBag.Active = "Product";
            var list = db.SanPhams.Where(item => item.LoaiHang.TenLoai == "Earphone");
            return View(list);
        }

        public ActionResult EarphoneCategory(string name)
        {
            ViewBag.Active = "Product";
            Session["EarphoneCategory"] = name;
            var category = db.SanPhams.Where(item => item.LoaiHang.TenLoai == "Earphone" && item.NhaCungCap.TenNCC == name).ToList();
            return View(category);
        }

        public ActionResult EarphoneSearch(string Search)
        {
            ViewBag.Active = "Product";
            var searchEarPhone = db.SanPhams.Where(item => item.TenSP.Contains(Search) && item.LoaiHang.TenLoai == "Earphone").ToList();
            return View(searchEarPhone);
        }

        public ActionResult CategorySearch(string Search)
        {
            ViewBag.Active = "Product";
            string name = Session["EarphoneCategory"] as string;
            var searchCategory = db.SanPhams.Where(item => item.TenSP.Contains(Search) && 
            (item.NhaCungCap.TenNCC == name && item.LoaiHang.TenLoai == "Earphone")).ToList();
            return View(searchCategory);
        }

        public ActionResult EarphoneAsc()
        {
            ViewBag.Active = "Product";
            var ascEarphone = (from item in db.SanPhams
                              where item.LoaiHang.TenLoai == "Earphone"
                              orderby item.GiaTienDaKhuyenMai
                              ascending
                              select item).ToList();
            return View(ascEarphone);
        }

        public ActionResult CategoryAsc()
        {
            ViewBag.Active = "Product";
            string name = Session["EarphoneCategory"] as String;
            var ascEarphone = (from item in db.SanPhams
                               where item.LoaiHang.TenLoai == "Earphone" && item.NhaCungCap.TenNCC == name
                               orderby item.GiaTienDaKhuyenMai
                               ascending
                               select item).ToList();
            return View(ascEarphone);
        }

        public ActionResult EarphoneDesc()
        {
            ViewBag.Active = "Product";
            var descEarphone = (from item in db.SanPhams
                                where item.LoaiHang.TenLoai == "Earphone"
                                orderby item.GiaTienDaKhuyenMai
                                descending
                                select item).ToList();
            return View(descEarphone);
        }

        public ActionResult CategoryDesc()
        {
            ViewBag.Active = "Product";
            string name = Session["EarphoneCategory"] as String;
            var descEarphone = (from item in db.SanPhams
                               where item.LoaiHang.TenLoai == "Earphone" && item.NhaCungCap.TenNCC == name
                               orderby item.GiaTienDaKhuyenMai
                               descending
                               select item).ToList();
            return View(descEarphone);
        }
    }
}