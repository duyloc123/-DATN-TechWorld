using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class CartController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: Cart
        public ActionResult Index()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                return View(cart.items);
            }
            return View();
        }

        public ActionResult ShowCount()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                return Json(new { Count = cart.items.Count }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { Count = 0 }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult AddToCart(int id, int quantity)
        {
            try
            {
                var code = new
                {
                    Success = false,
                    msg = "",
                    code = -1,
                    Count = 0
                };

                var checkProduct = db.SanPhams.FirstOrDefault(item => item.MaSP == id);
                if (checkProduct != null)
                {
                    ShoppingCart cart = (ShoppingCart)Session["Cart"];
                    if (cart == null)
                    {
                        cart = new ShoppingCart();
                    }

                    ShoppingCartItem item = new ShoppingCartItem
                    {
                        MaSP = checkProduct.MaSP,
                        TenSP = checkProduct.TenSP,
                        MaLoai = checkProduct.LoaiHang.TenLoai,
                        SoLuong = quantity,
                        HinhAnh = checkProduct.HinhAnh,
                        GiaTien = (float)checkProduct.GiaTienDaKhuyenMai
                    };

                    item.TongTien = item.SoLuong * (decimal)item.GiaTien;
                    cart.AddToCart(item, quantity);
                    Session["Cart"] = cart;

                    return Json(new
                    {
                        Success = true,
                        msg = "Thêm sản phẩm vào giỏ hàng thành công!",
                        code = 1,
                        Count = cart.items.Count,
                    });
                }

                return Json(code);
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    Success = false,
                    msg = "Có lỗi xảy ra: " + ex.Message,
                    code = -1,
                    Count = 0
                });
            }
        }

        [HttpPost]
        public ActionResult DeleteItem(int id)
        {
            var code = new { msg = "", code = -1, Count = 0 };
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                var checkSanPham = cart.items.FirstOrDefault(item => item.MaSP == id);
                if (checkSanPham != null)
                {
                    cart.delete(id);
                    code = new { msg = "", code = 1, Count = cart.items.Count };
                }
            }
            return Json(code);
        }
    }
}