using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class UserController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: User
        public ActionResult Index()
        {
            ViewBag.ActivePage = "Index";
            return View();
        }

        public ActionResult Product()
        {
                ViewBag.ActivePage = "Product"; // Đặt trang hiện tại là "Product"
                var sanPhams = db.SanPhams.ToList();
                return View(sanPhams);
        }

        public ActionResult Contact()
        {
            ViewBag.ActivePage = "Contact";
            return View();
        }

        public ActionResult News()
        {
            ViewBag.ActivePage = "News";
            var news = db.TinTucs.ToList();
            return View(news);
        }
    }
}