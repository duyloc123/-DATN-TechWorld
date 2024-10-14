using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
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

        public ActionResult IphoneCategory(int? id) 
        {
            ViewBag.ActivePage = "Product";

            var category = db.SanPhams.Where(item => item.NhaCungCap.MaNCC == id).ToList();
            return View(category); 
        }

    }
}