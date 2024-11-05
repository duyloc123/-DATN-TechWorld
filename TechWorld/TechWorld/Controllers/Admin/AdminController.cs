using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;

namespace TechWorld.Controllers.Admin
{
    public class AdminController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: Admin
        public ActionResult Index()
        {
            ViewBag.ActivePage = "Index";
            return View();
        }
        public ActionResult KhachHangList()
        {
            ViewBag.ActivePage = "KhachHangList";
            var KhachHangList = db.KhachHangs.ToList();
            return View(KhachHangList);
        }
        public ActionResult FindKhachHang(string nameSearch)
        {
            if (nameSearch != "")
            {
                ViewBag.ActivePage = "KhachHangList";
                var find = db.KhachHangs.Where(item => item.HoTen.Contains(nameSearch));
                return View(find);
            }
            return RedirectToAction("KhachHangList");
        }
        public ActionResult NhaCungCapList()
        {
            ViewBag.ActivePage = "NhaCungCapList";
            var NhaCungCapList = db.NhaCungCaps.ToList();
            return View(NhaCungCapList);
        }
        [HttpPost]
        public ActionResult createNhaCungCap(NhaCungCap req, HttpPostedFileBase HinhAnh)
        {
            var code = new { Success = false, Code = -1 };
            if (ModelState.IsValid)
            {
                if (HinhAnh.ContentLength > 0)
                {
                    string rootFolder = Server.MapPath("/DataImageSql/");
                    string pathImage = rootFolder + HinhAnh.FileName;
                    HinhAnh.SaveAs(pathImage);
                    req.HinhAnh = "DataImageSql/" + HinhAnh.FileName;
                }

                db.NhaCungCaps.Add(req);
                db.SaveChanges();


                code = new { Success = true, Code = 1 };
            }
            return RedirectToAction("NhaCungCapList");
        }
        [HttpGet]
        public ActionResult deleteNhaCungCap(int id)
        {
            var findNhaCungCap = db.NhaCungCaps.Find(id);
            db.NhaCungCaps.Remove(findNhaCungCap);
            db.SaveChanges();
            return RedirectToAction("NhaCungCapList");
        }
        [HttpGet]
        public ActionResult updateNhaCungCap(int id)
        {
            ViewBag.ActivePage = "NhaCungCapList";
            var listNhaCungCap = db.NhaCungCaps.ToList();
            var findNhaCungCap = db.NhaCungCaps.Find(id);
            Session["MaNCC"] = findNhaCungCap.MaNCC.ToString();
            Session["TenNCC"] = findNhaCungCap.TenNCC.ToString();
            Session["SoDienThoaiNCC"] = findNhaCungCap.SoDienThoaiNCC.ToString();
            Session["DiaChiNCC"] = findNhaCungCap.DiaChiNCC.ToString();
            return View(listNhaCungCap);
        }
        [HttpPost]
        public ActionResult submitUpdateNCC(int id, NhaCungCapModel req, HttpPostedFileBase HinhAnh)
        {
            var findNhaCungCap = db.NhaCungCaps.Find(id);

            if (findNhaCungCap != null)
            {
                if (req.HinhAnh != null)
                {
                    string rootFolder = Server.MapPath("/DataImageSql/");
                    string pathImage = rootFolder + HinhAnh.FileName;
                    HinhAnh.SaveAs(pathImage);
                    req.HinhAnh = "DataImageSql/" + HinhAnh.FileName;
                    findNhaCungCap.HinhAnh = req.HinhAnh;
                }
                findNhaCungCap.TenNCC = req.TenNCC;
                findNhaCungCap.DiaChiNCC = req.DiaChiNCC;
                findNhaCungCap.SoDienThoaiNCC = req.SoDienThoaiNCC;
                db.SaveChanges();
            }

            return RedirectToAction("NhaCungCapList");
        }
        public ActionResult findNCC(string nameSearch)
        {
            ViewBag.ActivePage = "NhaCungCapList";
            if (nameSearch != "")
            {
                var find = db.NhaCungCaps.Where(item => item.TenNCC.Contains(nameSearch)).ToList();
                return View(find);
            }
            return RedirectToAction("NhaCungCapList");
        }

        // Loại Hàng
        public ActionResult LoaiHangList()
        {
            ViewBag.ActivePage = "LoaiHangList";
            var list = db.LoaiHangs.ToList();
            return View(list);
        }
        [HttpPost]
        public ActionResult createLoaiHang(LoaiHang req, HttpPostedFileBase HinhAnh)
        {
            if (HinhAnh.ContentLength > 0)
            {
                string rootFolder = Server.MapPath("/DataImageSql/");
                string pathImage = rootFolder + HinhAnh.FileName;
                HinhAnh.SaveAs(pathImage);
                req.HinhAnh = "DataImageSql/" + HinhAnh.FileName;
            }
            db.LoaiHangs.Add(req);
            db.SaveChanges();
            return RedirectToAction("LoaiHangList");
        }
        [HttpGet]
        public ActionResult deleteLoaiHang(int id)
        {
            var delete = db.LoaiHangs.Find(id);
            if (delete != null)
            {
                db.LoaiHangs.Remove(delete);
                db.SaveChanges();
                return RedirectToAction("LoaiHangList");
            }
            return RedirectToAction("Error", "Shared");
        }
        [HttpGet]
        public ActionResult updateLoaiHang(int id)
        {
            ViewBag.ActivePage = "LoaiHangList";
            var findUpdate = db.LoaiHangs.Find(id);
            var list = db.LoaiHangs.ToList();
            Session["MaLoai"] = findUpdate.MaLoai.ToString();
            Session["TenLoai"] = findUpdate.TenLoai.ToString();
            return View(list);
        }
        [HttpPost]
        public ActionResult submitUpdateLoaiHang(int id, LoaiHangModel req, HttpPostedFileBase HinhAnh)
        {
            var findLoaiHang = db.LoaiHangs.Find(id);
            if (findLoaiHang != null)
            {
                findLoaiHang.TenLoai = req.TenLoai;
                if (req.HinhAnh != null)
                {
                    string rootFolder = Server.MapPath("/DataImageSql/");
                    string pathImage = rootFolder + HinhAnh.FileName;
                    HinhAnh.SaveAs(pathImage);
                    req.HinhAnh = "DataImageSql/" + HinhAnh.FileName;
                    findLoaiHang.HinhAnh = req.HinhAnh;
                }
                db.SaveChanges();
            }

            return RedirectToAction("LoaiHangList");
        }
        public ActionResult findLoaiHang(string nameSearch)
        {
            ViewBag.ActivePage = "LoaiHangList";
            if (nameSearch != "")
            {
                var find = db.LoaiHangs.Where(item => item.TenLoai.Contains(nameSearch)).ToList();
                return View(find);
            }
            return RedirectToAction("LoaiHangList");
        }

        // Sản Phẩm
        public ActionResult SanPham()
        {
            ViewBag.ActivePage = "SanPhamList";
            var listSanPham = db.SanPhams.ToList();
            return View(listSanPham);
        }
        public ActionResult createSanPham()
        {
            ViewBag.ActivePage = "SanPhamList";
            var viewModel = new LoaiHangNCCViewModel
            {
                LoaiHangList = db.LoaiHangs.ToList(),
                NhaCungCapList = db.NhaCungCaps.ToList(),
            };
            return View(viewModel);
        }
        [HttpPost]
        public ActionResult createSanPham(SanPham req, HttpPostedFileBase HinhAnh)
        {
            if (HinhAnh.ContentLength > 0)
            {
                string rootFolder = Server.MapPath("/DataImageSql/");
                string pathImage = rootFolder + HinhAnh.FileName;
                HinhAnh.SaveAs(pathImage);
                req.HinhAnh = "DataImageSql/" + HinhAnh.FileName;
                SanPham sp = new SanPham();
                sp.TenSP = req.TenSP;
                sp.NgayNhap = req.NgayNhap;
                sp.GiaTien = req.GiaTien;
                sp.SoLuong = req.SoLuong;
                sp.MoTa = req.MoTa;
                sp.MoTaSanPham = req.MoTa;
                sp.HinhAnh = req.HinhAnh;
                sp.MaNCC = req.MaNCC;
                sp.MaLoai = req.MaLoai;
                if (req.GiamGia != "")
                {
                    sp.GiamGia = req.GiamGia;
                    sp.GiaTienDaKhuyenMai = req.GiaTien - (req.GiaTien * float.Parse(req.GiamGia) / 100);
                }
                sp.TinhTrangSP = "Còn hàng";
                db.SanPhams.Add(sp);
                db.SaveChanges();
            }
            return RedirectToAction("SanPham");
        }
        [HttpGet]
        public ActionResult deleteSanPham(int id)
        {
            var findSanPham = db.SanPhams.Find(id);
            db.SanPhams.Remove(findSanPham);
            db.SaveChanges();
            return RedirectToAction("SanPham");
        }
        public ActionResult updateSanPham(int id)
        {
            ViewBag.ActivePage = "SanPhamList";
            var sanPham = db.SanPhams.FirstOrDefault(item => item.MaSP == id);
            var viewModel = new LoaiHangNCCViewModel
            {
                MaSP = sanPham.MaSP,
                MaLoai = (int)sanPham.MaLoai,
                MaNCC = (int)sanPham.MaNCC,
                TenSP = sanPham.TenSP,
                GiaTien = sanPham.GiaTien.ToString(),
                NgayNhap = sanPham.NgayNhap.ToString("yyyy-MM-dd"),
                SoLuong = sanPham.SoLuong,
                MoTa = sanPham.MoTa,
                GiamGia = sanPham.GiamGia.ToString(),
            };
            viewModel.LoaiHangList = db.LoaiHangs.ToList();
            viewModel.NhaCungCapList = db.NhaCungCaps.ToList();
            return View(viewModel);
        }
        [HttpPost]
        public ActionResult updateSanPham(LoaiHangNCCViewModel req, HttpPostedFileBase HinhAnh)
        {
            if (ModelState.IsValid)
            {
                var sanPham = db.SanPhams.Find(req.MaSP);
                sanPham.MaLoai = req.MaLoai;
                sanPham.MaNCC = req.MaNCC;
                sanPham.TenSP = req.TenSP;
                sanPham.GiaTien = float.Parse(req.GiaTien);
                sanPham.GiamGia = req.GiamGia;
                sanPham.NgayNhap = DateTime.Parse(req.NgayNhap);
                sanPham.SoLuong = req.SoLuong;
                sanPham.MoTa = req.MoTa;
                if(req.HinhAnh != null)
                {
                    string rootFolder = Server.MapPath("/DataImageSql/");
                    string pathImage = rootFolder + HinhAnh.FileName;
                    HinhAnh.SaveAs(pathImage);
                    req.HinhAnh = "DataImageSql/" + HinhAnh.FileName;
                    sanPham.HinhAnh = req.HinhAnh;
                }
                if(req.SoLuong == 0)
                {
                    sanPham.TinhTrangSP = "Hết hàng";
                }
                else
                {
                    sanPham.TinhTrangSP = "Còn hàng";
                }
                if(req.GiamGia != "")
                {
                    float giaTien = float.Parse(req.GiaTien);
                    float giamGia = float.Parse(req.GiamGia);
                    sanPham.GiaTienDaKhuyenMai = giaTien - (giaTien * giamGia / 100);
                }
                else
                {
                    sanPham.GiaTienDaKhuyenMai = 0;
                }
                db.SaveChanges();
                return RedirectToAction("SanPham");
            }
            return RedirectToAction("updateSanPham");
        }
        public ActionResult findSanPham(string nameSearch)
        {
            ViewBag.ActivePage = "SanPhamList";
            if (nameSearch != "")
            {
                var find = db.SanPhams.Where(item => item.TenSP.Contains(nameSearch)).ToList();
                return View(find);
            }
            return RedirectToAction("SanPham");
        }

        // Đơn Hàng
        public ActionResult DonHang()
        {
            ViewBag.ActivePage = "DonHangList";
            var donHangList = db.DonHangs.ToList();
            return View(donHangList);
        }
        [HttpGet]
        public ActionResult deleteDonHang(int id)
        {
            var deleteDH = db.DonHangs.Find(id);
            if (deleteDH != null)
            {
                db.DonHangs.Remove(deleteDH);
                db.SaveChanges();
                return RedirectToAction("DonHang");
            }
            return View();
        }
        [HttpPost]
        public ActionResult updateDonHang(int id, DonHang dh)
        {
            var donHang = db.DonHangs.FirstOrDefault(item => item.MaDH == id);

            if (donHang == null)
            {
                return HttpNotFound("Không tìm thấy đơn hàng.");
            }

            donHang.PTThanhToan = dh.PTThanhToan;
            donHang.TTDonHang = dh.TTDonHang;
            donHang.TTThanhToan = dh.TTThanhToan;

            db.SaveChanges();

            TempData["Message"] = "Cập nhật đơn hàng thành công!";
            return RedirectToAction("DonHang");
        }
        public ActionResult findDonHang(string nameSearch)
        {
            ViewBag.ActivePage = "DonHangList";
            if (nameSearch != "")
            {
                var find = db.DonHangs.Where(item => item.KhachHang.HoTen.Contains(nameSearch)).ToList();
                return View(find);
            }
            return RedirectToAction("DonHang");
        }

        // Doanh Thu
        public ActionResult DoanhThu()
        {
            ViewBag.ActivePage = "DoanhThu";
            return View();
        }
    }
}