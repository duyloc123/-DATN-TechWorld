﻿using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class InfomationUserController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: DangNhap
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Singin()
        {
            return View();
        }

        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] formData = Encoding.UTF8.GetBytes(str);
            byte[] tg = md5.ComputeHash(formData);
            string byte2String = null;
            for (int i = 0; i < tg.Length; i++)
            {
                byte2String += tg[i].ToString("x2");
            }
            return byte2String;
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Signin(string user, string password)
        {
            if (ModelState.IsValid)
            {
                var admin = db.KhachHangs.Where(p => p.Email.Equals(user) && p.MatKhau.Equals(password) && p.ChucVu == "admin");
                if (admin.Count() > 0)
                {
                    return Json(new { success = true, redirectUrl = Url.Action("Index", "Admin") });
                }
                else
                {
                    var data = db.KhachHangs.Where(p => p.Email.Equals(user) && p.MatKhau.Equals(password));
                    if (data.Count() > 0)
                    {
                        Session["MaKH"] = data.FirstOrDefault().MaKH;
                        Session["TenKhachHang"] = data.FirstOrDefault().HoTen;
                        Session["Gmail"] = data.FirstOrDefault().Email;
                        Session["DiaChi"] = data.FirstOrDefault().DiaChi;
                        Session["SoDienThoai"] = data.FirstOrDefault().SoDienThoai;
                        Session["MaKH"] = data.FirstOrDefault().MaKH;

                        return Json(new { success = true, redirectUrl = Url.Action("Index", "User") });
                    }
                }
            }

            return Json(new { success = false, message = "Đăng nhập không thành công, vui lòng kiểm tra lại thông tin" });
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(KhachHang kh, string hoTen, string email, string Address, string NumberPhone,string password)
        {
            if (ModelState.IsValid)
            {
                var check = db.KhachHangs.FirstOrDefault(item => item.Email == kh.Email);
                if(check == null)
                {
                    db.Configuration.ValidateOnSaveEnabled = false;
                    kh.HoTen = hoTen;
                    kh.Email = email;
                    kh.DiaChi = Address;
                    kh.SoDienThoai = NumberPhone;
                    kh.MatKhau = password;
                    db.KhachHangs.Add(kh);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Đăng ký tài khoản thành công, vui lòng đăng nhập!", redirectUrl = Url.Action("Index", "User") });
                }
                else
                {
                    return Json(new { success = false, message = "Email đã tồn tại." });
                }
            }
            return Json(new { success = false, message = "Thông tin không hợp lệ." });
        }

        public ActionResult Exit()
        {
            Session.Clear();
            return RedirectToAction("Index","User");
        }

        // Thông tin khách hàng
        public ActionResult UserInfomation(int id)
        {
            ViewBag.ActivePage = "ThongTinKH";

            var infomation = db.KhachHangs.Where(item => item.MaKH == id);
            return View(infomation);
        }
        [HttpPost]
        public ActionResult updateUser(KhachHangModel req)
        {
            if(req != null)
            {
                var kh = db.KhachHangs.Find(req.MaKH);
                kh.HoTen = req.HoTen;
                kh.Email = req.Email;
                kh.DiaChi = req.DiaChi;
                kh.SoDienThoai = req.SoDienThoai;
                kh.MatKhau = req.MatKhau;
                db.SaveChanges();
                return RedirectToAction("Index","User");
            }
            return RedirectToAction("UserInfomation");
        }

        // Quản lý đơn hàng
        public ActionResult DonHangUser(int id)
        {
            ViewBag.ActivePage = "DonHangUser";
            Session["MaKH"] = db.DonHangs.FirstOrDefault().MAKH;

            var DonHang = db.DonHangs.Where(item => item.MAKH == id).ToList();
            return View(DonHang); 
        }

        public ActionResult SearchDonHang(string nameSearch, int id)
        {
            ViewBag.ActivePage = "DonHangUser";

            Session["MaKH"] = db.DonHangs.FirstOrDefault().MAKH;

            if (!string.IsNullOrEmpty(nameSearch))
            {
                var find = db.DonHangs.Where(item => item.MaDH.Contains(nameSearch)).ToList();

                if (find.Any())
                {
                    return View(find);
                }
                TempData["Message"] = "Không tìm thấy mã đơn hàng!";
            }
            var DonHang = db.DonHangs.Where(item => item.MAKH == id).ToList();
            return View(DonHang);
        }
    }
}