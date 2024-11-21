using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;
using PagedList;
using System.CodeDom;
using System.Globalization;
using System.Web.Configuration;
using System.IO;

namespace TechWorld.Controllers.Admin
{
    public class AdminController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: Admin
        public ActionResult Index()
        {
            ViewBag.ActivePage = "Index";
            var revenueData = db.DonHangs
            .GroupBy(s => s.NgayDat.Value.Month)
            .Select(g => new DoanhThu
            {
                Month = g.Key,
                Total = g.Sum(s => (float)s.TongTien)
            })
            .ToList();
            int tongKhachHang = db.DonHangs.Select(item => item.KhachHang).Distinct().Count();
            float tongDoanhThu = revenueData.Sum(item => item.Total);
            int tongSanPham = db.SanPhams.Select(item => item.TenSP).Distinct().Count();
            float giamGia = (float)db.SanPhams.Sum(item => item.GiaTien - item.GiaTienDaKhuyenMai);

            var result = db.ChiTietDonHangs
            .GroupBy(x => x.MaSP)
            .Select(g => new TopSanPhamViewModel
            {
                MaSP = g.Key,
                TenSP = g.FirstOrDefault().SanPham.TenSP, 
                HinhAnh = g.FirstOrDefault().SanPham.HinhAnh,
                TongSoLuong = g.Sum(x => x.SoLuong),
                TongTien = (float)g.Sum(x => x.TongTien)
            })
            .OrderByDescending(x => x.TongSoLuong)
            .Take(10)
            .ToList();
            ViewBag.ThongKeSanPham = result;

            ViewBag.tongKhachHang = tongKhachHang;
            ViewBag.tongDoanhThu = tongDoanhThu;
            ViewBag.tongSanPham = tongSanPham;
            ViewBag.giamGia = giamGia;
            return View(revenueData);
        }
        public ActionResult KhachHangList(int? page, int? pageSize)
        {
            ViewBag.ActivePage = "KhachHangList";
            if (page == null) page = 1;
            if (pageSize == null) pageSize = 5;
            var KhachHangList = db.KhachHangs.ToList();
            return View(KhachHangList.ToPagedList((int)page, (int)pageSize));
        }
        public ActionResult FindKhachHang(string nameSearch, int? page, int? pageSize)
        {
            ViewBag.ActivePage = "KhachHangList";

            if (!string.IsNullOrEmpty(nameSearch))
            {
                var find = db.KhachHangs
                             .Where(item => item.HoTen.Contains(nameSearch))
                             .OrderBy(item => item.HoTen)
                             .ToList();

                if (find.Any())
                {
                    // Xử lý phân trang
                    if (page == null) page = 1;
                    if (pageSize == null) pageSize = 5;

                    return View(find.ToPagedList((int)page, (int)pageSize));
                }

                // Không tìm thấy kết quả
                TempData["Message"] = "Không tìm thấy thông tin khách hàng!";
                return View(new List<KhachHang>().ToPagedList(1, pageSize ?? 5));
            }
            return RedirectToAction("KhachHangList");
        }
        
        // Nhà Cung Cấp
        public ActionResult NhaCungCapList(int? page, int? pageSize)
        {
            ViewBag.ActivePage = "NhaCungCapList";
            var NhaCungCapList = db.NhaCungCaps.ToList();
            if (page == null) page = 1;
            if (pageSize == null) pageSize = 5;
            return View(NhaCungCapList.ToPagedList((int)page, (int)pageSize));
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
        public ActionResult findNCC(string nameSearch, int? page, int? pageSize)
        {
            ViewBag.ActivePage = "NhaCungCapList";
            if (nameSearch != "")
            {
                var find = db.NhaCungCaps.Where(item => item.TenNCC.Contains(nameSearch)).ToList();

                if (find.Any())
                {
                    // Xử lý phân trang
                    if (page == null) page = 1;
                    if (pageSize == null) pageSize = 5;

                    return View(find.ToPagedList((int)page, (int)pageSize));
                }

                // Không tìm thấy kết quả
                TempData["Message"] = "Không tìm thấy thông tin nhà cung cấp!";
                return View(new List<NhaCungCap>().ToPagedList(1, pageSize ?? 5));
            }
            return RedirectToAction("NhaCungCapList");
        }

        // Loại Hàng
        public ActionResult LoaiHangList(int? page, int? pageSize)
        {
            ViewBag.ActivePage = "LoaiHangList";
            if (page == null) page = 1;
            if (pageSize == null) pageSize = 5;
            var list = db.LoaiHangs.ToList();
            return View(list.ToPagedList((int)page, (int)pageSize));
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
        public ActionResult findLoaiHang(string nameSearch, int? page, int? pageSize)
        {
            ViewBag.ActivePage = "LoaiHangList";
            if (page == null) page = 1;
            if (pageSize == null) pageSize = 5;
            if (nameSearch != "")
            {
                var find = db.LoaiHangs.Where(item => item.TenLoai.Contains(nameSearch)).ToList();
                if (find.Any())
                {
                    // Xử lý phân trang
                    if (page == null) page = 1;
                    if (pageSize == null) pageSize = 5;

                    return View(find.ToPagedList((int)page, (int)pageSize));
                }

                // Không tìm thấy kết quả
                TempData["Message"] = "Không tìm thấy thông tin loại hàng!";
                return View(new List<LoaiHang>().ToPagedList(1, pageSize ?? 5));
            }
            return RedirectToAction("LoaiHangList");
        }

        // Sản Phẩm
        public ActionResult SanPham(int? page, int? pageSize)
        {
            ViewBag.ActivePage = "SanPhamList";
            if (page == null) page = 1;
            if (pageSize == null) pageSize = 5;
            var listSanPham = db.SanPhams.ToList();
            return View(listSanPham.ToPagedList((int)page, (int)pageSize));
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
        [ValidateInput(false)]
        public ActionResult createSanPham(SanPham req, HttpPostedFileBase HinhAnh)
        {
            if (ModelState.IsValid)
            {
                // Xử lý upload hình ảnh (như code cũ)
                if (HinhAnh != null && HinhAnh.ContentLength > 0)
                {
                    string rootFolder = Server.MapPath("/DataImageSql/");
                    string pathImage = Path.Combine(rootFolder, HinhAnh.FileName);
                    HinhAnh.SaveAs(pathImage);
                    req.HinhAnh = "DataImageSql/" + HinhAnh.FileName;
                }

                // Tạo đối tượng SanPham mới
                var sp = new SanPham
                {
                    TenSP = req.TenSP,
                    NgayNhap = req.NgayNhap,
                    GiaTien = req.GiaTien,
                    SoLuong = req.SoLuong,
                    MoTa = req.MoTa,
                    MoTaSanPham = req.MoTaSanPham,
                    HinhAnh = req.HinhAnh,
                    MaNCC = req.MaNCC,
                    MaLoai = req.MaLoai,
                    TinhTrangSP = "Còn hàng"
                };

                // Xử lý giảm giá
                if (!string.IsNullOrEmpty(req.GiamGia))
                {
                    sp.GiamGia = req.GiamGia;
                    sp.GiaTienDaKhuyenMai = req.GiaTien - (req.GiaTien * float.Parse(req.GiamGia) / 100);
                }

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
                MoTaSanPham = sanPham.MoTaSanPham,
                GiamGia = sanPham.GiamGia.ToString(),
            };
            viewModel.LoaiHangList = db.LoaiHangs.ToList();
            viewModel.NhaCungCapList = db.NhaCungCaps.ToList();
            return View(viewModel);
        }
        [HttpPost]
        [ValidateInput(false)]
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
                sanPham.MoTaSanPham = req.MoTaSanPham;
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
        public ActionResult findSanPham(string nameSearch, int? page, int? pageSize)
        {
            ViewBag.ActivePage = "SanPhamList";
            if (page == null) page = 1;
            if (pageSize == null) pageSize = 5;
            if (nameSearch != "")
            {
                var find = db.SanPhams.Where(item => item.TenSP.Contains(nameSearch)).ToList();
                if (find.Any())
                {
                    // Xử lý phân trang
                    if (page == null) page = 1;
                    if (pageSize == null) pageSize = 5;

                    return View(find.ToPagedList((int)page, (int)pageSize));
                }

                // Không tìm thấy kết quả
                TempData["Message"] = "Không tìm thấy thông tin sản phẩm!";
                return View(new List<SanPham>().ToPagedList(1, pageSize ?? 5));
            }
            return RedirectToAction("SanPham");
        }

        // Tin Tức
        public ActionResult TinTuc(int? page, int? pageSize)
        {
            ViewBag.ActivePage = "TinTuc";
            if (page == null) page = 1;
            if (pageSize == null) pageSize = 5;
            var TinTuc = db.TinTucs.ToList();
            return View(TinTuc.ToPagedList((int)page, (int)pageSize));
        }
        public ActionResult createTinTuc()
        {
            ViewBag.ActivePage = "TinTuc";
            return View();
        }
        [HttpPost]
        public ActionResult createTinTuc(TinTuc req, HttpPostedFileBase HinhAnh)
        {
            if (ModelState.IsValid)
            {
                // Xử lý upload hình ảnh (như code cũ)
                if (HinhAnh != null && HinhAnh.ContentLength > 0)
                {
                    string rootFolder = Server.MapPath("/DataImageSql/");
                    string pathImage = Path.Combine(rootFolder, HinhAnh.FileName);
                    HinhAnh.SaveAs(pathImage);
                    req.HinhAnh = "DataImageSql/" + HinhAnh.FileName;
                }

                // Tạo đối tượng SanPham mới
                var tintuc = new TinTuc
                {
                    TieuDe = req.TieuDe,
                    NoiDung = req.NoiDung,
                    NgayDang = req.NgayDang,
                    TacGia = req.TacGia,
                    TrangThai = req.TrangThai,
                    TrangDang = req.TrangDang,
                    HinhAnh = req.HinhAnh,
                };

                db.TinTucs.Add(tintuc);
                db.SaveChanges();
            }
            return RedirectToAction("TinTuc");
        }
        public ActionResult deleteTinTuc(int id)
        {
            var delete = db.TinTucs.Find(id);
            if(delete != null)
            {
                db.TinTucs.Remove(delete);
                db.SaveChanges();
            }
            return RedirectToAction("TinTuc");
        }
        public ActionResult updateTinTuc(int id)
        {
            ViewBag.ActivePage = "TinTuc";
            var tinTuc = db.TinTucs.FirstOrDefault(item => item.MaTin == id);
            var TinTuc = new TinTucModel
            {
                MaTin = tinTuc.MaTin,
                TieuDe = tinTuc.TieuDe,
                NoiDung = tinTuc.NoiDung,
                TacGia = tinTuc.TacGia,
                TrangThai = tinTuc.TrangThai,
                NgayDang = tinTuc.NgayDang.ToString("yyyy-MM-dd")
            };
            return View(TinTuc);
        }
        [HttpPost]
        public ActionResult updateTinTuc(TinTucModel model, HttpPostedFileBase HinhAnh)
        {
            if (ModelState.IsValid)
            {
                var tinTuc = db.TinTucs.Find(model.MaTin);
                tinTuc.TieuDe = model.TieuDe;
                tinTuc.NoiDung = model.NoiDung;
                tinTuc.NgayDang = DateTime.Parse(model.NgayDang);
                tinTuc.TacGia = model.TacGia;
                tinTuc.TrangThai = model.TrangThai;
                tinTuc.TrangDang = model.TrangDang;
                if (model.HinhAnh != null)
                {
                    string rootFolder = Server.MapPath("/DataImageSql/");
                    string pathImage = rootFolder + HinhAnh.FileName;
                    HinhAnh.SaveAs(pathImage);
                    model.HinhAnh = "DataImageSql/" + HinhAnh.FileName;
                    tinTuc.HinhAnh = model.HinhAnh;
                }

                db.SaveChanges();
                return RedirectToAction("TinTuc");
            }
            return RedirectToAction("updateTinTuc");
        }
        public ActionResult findTinTuc(string nameSearch, int? page, int? pageSize)
        {
            ViewBag.ActivePage = "TinTuc";
            if (page == null) page = 1;
            if (pageSize == null) pageSize = 5;
            if (nameSearch != "")
            {
                var find = db.TinTucs.Where(item => item.TieuDe.Contains(nameSearch)).ToList();
                if (find.Any())
                {
                    if (page == null) page = 1;
                    if (pageSize == null) pageSize = 5;

                    return View(find.ToPagedList((int)page, (int)pageSize));
                }
                TempData["Message"] = "Không tìm thấy thông tin tin tức!";
                return View(new List<TinTuc>().ToPagedList(1, pageSize ?? 5));
            }
            return RedirectToAction("TinTuc");
        }
        // Đơn Hàng
        public ActionResult DonHang(int? page, int? pageSize)
        {
            ViewBag.ActivePage = "DonHangList";
            if (page == null) page = 1;
            if (pageSize == null) pageSize = 5;
            var donHangList = db.DonHangs.ToList();
            return View(donHangList.ToPagedList((int)page, (int)pageSize));
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
        public ActionResult updateDonHang(string id, DonHang dh)
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
        public ActionResult findDonHang(string nameSearch, int? page, int? pageSize)
        {

            ViewBag.ActivePage = "DonHangList";
            if (page == null) page = 1;
            if (pageSize == null) pageSize = 5;
            if (nameSearch != "")
            {
                var find = db.DonHangs.Where(item => item.MaDH.Contains(nameSearch)).ToList();
                if (find.Any())
                {
                    // Xử lý phân trang
                    if (page == null) page = 1;
                    if (pageSize == null) pageSize = 5;

                    return View(find.ToPagedList((int)page, (int)pageSize));
                }

                // Không tìm thấy kết quả
                TempData["Message"] = "Không tìm thấy thông tin đơn hàng!";
                return View(new List<DonHang>().ToPagedList(1, pageSize ?? 5));
            }
            return RedirectToAction("DonHang");
        }

        // Doanh Thu
        public ActionResult DoanhThu()
        {
            var revenueData = db.DonHangs
            .GroupBy(s => s.NgayDat.Value.Month)
            .Select(g => new DoanhThu
            {
                Month = g.Key,
                Total = g.Sum(s => (float)s.TongTien)
            })
            .ToList();
            return View(revenueData);
        }

        // Đăng Xuất
        public ActionResult DangXuat()
        {
            return RedirectToAction("Index", "User");
        }

    }
}