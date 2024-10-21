using System;
using System.Collections.Generic;
using System.IO;
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

        public ActionResult ProductDetail(int id)
        {
            ViewBag.ActivePage = "Product";

            // Lấy sản phẩm chi tiết
            var product = db.SanPhams.FirstOrDefault(p => p.MaSP == id);
            if (product == null)
                return HttpNotFound();

            // Lấy sản phẩm tương tự (cùng danh mục, khác ID)
            var similarProducts = db.SanPhams
                .Where(item => item.MaNCC == product.MaNCC && item.MaSP != id)
                .Take(3)
                .ToList();

            // Tạo view model
            var viewModel = new ProductDetailViewModel
            {
                ProductDetail = product,
                SimilarProducts = similarProducts
            };

            return View(viewModel);
        }

        public ActionResult ProductFind(string Search)
        {
            ViewBag.ActivePage = "Product";

            var search = db.SanPhams.Where(item => item.TenSP.Contains(Search)).ToList();
            return View(search);
        }

        public ActionResult SortAsc()
        {
            ViewBag.ActivePage = "Product";
            var ascProduct = (from item in db.SanPhams
                                where item.MaLoai != 1
                                orderby item.GiaTienDaKhuyenMai
                                ascending
                                select item).ToList();
            return View(ascProduct);
        }

        public ActionResult SortDesc()
        {
            ViewBag.ActivePage = "Product";
            var ascProduct = (from item in db.SanPhams
                              where item.MaLoai != 1
                              orderby item.GiaTienDaKhuyenMai
                              descending
                              select item).ToList();
            return View(ascProduct);
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