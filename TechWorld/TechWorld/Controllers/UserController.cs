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

            var result = db.ChiTietDonHangs
            .Where(x => x.SanPham.LoaiHang.TenLoai == "Điện thoại")
            .GroupBy(x => x.MaSP)
            .Select(g => new TopSanPhamViewModel
            {
                MaSP = g.Key,
                TenSP = g.FirstOrDefault().SanPham.TenSP,
                HinhAnh = g.FirstOrDefault().SanPham.HinhAnh,
                TongSoLuong = g.Sum(x => x.SoLuong),
                GiaSP = (float)(g.FirstOrDefault().SanPham.GiaTienDaKhuyenMai ?? g.FirstOrDefault().SanPham.GiaTien),
            })
            .OrderByDescending(x => x.TongSoLuong)
            .Take(10)
            .ToList();

            var laptop = db.ChiTietDonHangs
            .Where(x => x.SanPham.LoaiHang.TenLoai == "Laptop" || x.SanPham.LoaiHang.TenLoai == "Laptop Gaming")
            .GroupBy(x => x.MaSP)       
            .Select(g => new TopSanPhamViewModel
            {
                MaSP = g.Key,
                TenSP = g.FirstOrDefault().SanPham.TenSP,
                HinhAnh = g.FirstOrDefault().SanPham.HinhAnh,
                TongSoLuong = g.Sum(x => x.SoLuong),
                GiaSP = (float)(g.FirstOrDefault().SanPham.GiaTienDaKhuyenMai ?? g.FirstOrDefault().SanPham.GiaTien),
            })
            .OrderByDescending(x => x.TongSoLuong)
            .Take(10)
            .ToList();

            var keyboard = db.ChiTietDonHangs
            .Where(x => x.SanPham.LoaiHang.TenLoai == "Keyboard" || x.SanPham.LoaiHang.TenLoai == "Mouse")
            .GroupBy(x => x.MaSP)
            .Select(g => new TopSanPhamViewModel
            {
                MaSP = g.Key,
                TenSP = g.FirstOrDefault().SanPham.TenSP,
                HinhAnh = g.FirstOrDefault().SanPham.HinhAnh,
                TongSoLuong = g.Sum(x => x.SoLuong),
                GiaSP = (float)(g.FirstOrDefault().SanPham.GiaTienDaKhuyenMai ?? g.FirstOrDefault().SanPham.GiaTien),
            })
            .OrderByDescending(x => x.TongSoLuong)
            .Take(10)
            .ToList();

            var monitor = db.ChiTietDonHangs
            .Where(x => x.SanPham.LoaiHang.TenLoai == "Monitor")
            .GroupBy(x => x.MaSP)
            .Select(g => new TopSanPhamViewModel
            {
                MaSP = g.Key,
                TenSP = g.FirstOrDefault().SanPham.TenSP,
                HinhAnh = g.FirstOrDefault().SanPham.HinhAnh,
                TongSoLuong = g.Sum(x => x.SoLuong),
                GiaSP = (float)(g.FirstOrDefault().SanPham.GiaTienDaKhuyenMai ?? g.FirstOrDefault().SanPham.GiaTien),
            })
            .OrderByDescending(x => x.TongSoLuong)
            .Take(10)
            .ToList();

            var newsIndex = db.TinTucs.Where(item => item.TrangThai == "Hiện" && item.TrangDang == "Trang chủ").ToList().Take(4);
            var newsBanner = db.TinTucs.Where(item => item.TrangThai == "Hiện" && item.TrangDang == "Trang chủ/Banner").ToList().Take(6);
            var newsOutStanding = db.TinTucs.Where(item => item.TrangThai == "Nổi bật" && item.TrangDang == "Sales").ToList().Take(1);

            ViewBag.ThongKeMonitor = monitor;
            ViewBag.ThongKeKeyBoard = keyboard;
            ViewBag.ThongKeLaptop = laptop;
            ViewBag.ThongKeSanPham = result;
            ViewBag.newsIndex = newsIndex;
            ViewBag.newsBanner = newsBanner;
            ViewBag.newsOutStanding = newsOutStanding;

            return View();
        }

        public ActionResult Product()
        {
                ViewBag.ActivePage = "Product"; // Đặt trang hiện tại là "Product"
                var sanPhams = db.SanPhams.ToList();
                Session["TenLoai"] = sanPhams.FirstOrDefault().LoaiHang.TenLoai;
                Session["TenSP"] = sanPhams.FirstOrDefault().TenSP;
                return View(sanPhams);
        }

        public ActionResult ProductDetail(int id)
        {
            ViewBag.ActivePage = "Product";

            // Lấy sản phẩm chi tiết
            var product = db.SanPhams.FirstOrDefault(p => p.MaSP == id);
            Session["TenLoai"] = product.LoaiHang.TenLoai;
            Session["TenSP"] = product.TenSP;
            if (product == null)
                return HttpNotFound();

            // Lấy sản phẩm tương tự (cùng danh mục, khác ID)
            var similarProducts = db.SanPhams
                .Where(item => item.MaNCC == product.MaNCC && item.MaSP != id)
                .Take(3)
                .ToList();

            var anhSP = db.AnhSPs.Where(item => item.MASP == id).ToList();

            // Tạo view model
            var viewModel = new ProductDetailViewModel
            {
                ProductDetail = product,
                SimilarProducts = similarProducts,
                HinhAnhSP = anhSP
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
                                orderby item.GiaTienDaKhuyenMai
                                ascending
                                select item).ToList();
            return View(ascProduct);
        }

        public ActionResult SortDesc()
        {
            ViewBag.ActivePage = "Product";
            var ascProduct = (from item in db.SanPhams
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
            var TinTuc = db.TinTucs.Where(item => item.TrangDang == "Tin Tức" && item.TrangThai == "Hiện").ToList();
            var TinTucBanner = db.TinTucs.Where(item => item.TrangDang == "Banner" && item.TrangThai == "Hiện").ToList();

            var viewModel = new NewsViewModel
            {
                TinTuc = TinTuc,
                TinTucBanner = TinTucBanner
            };
            return View(viewModel);
        }
    }
}