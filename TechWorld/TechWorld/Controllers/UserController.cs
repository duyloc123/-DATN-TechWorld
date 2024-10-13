using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TechWorld.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            ViewBag.ActivePage = "Index";
            return View();
        }

        public ActionResult Product()
        {
            ViewBag.ActivePage = "Product"; // Đặt trang hiện tại là "Product"
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.ActivePage = "Contact";
            return View();
        }

        public ActionResult News()
        {
            ViewBag.ActivePage = "News";
            return View();
        }
    }
}