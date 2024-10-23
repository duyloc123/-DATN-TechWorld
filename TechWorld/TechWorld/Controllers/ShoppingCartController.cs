using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TechWorld.Models;

namespace TechWorld.Controllers
{
    public class ShoppingCartController : Controller
    {
        TechWorldEntities db = new TechWorldEntities();
        // GET: ShoppingCart
        public ActionResult Index()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if(cart != null)
            {
                return View(cart.Items);
            }
            return View();
        }

        // Show Count
        public ActionResult ShowCount()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                return Json(new { Count = cart.Items.Count }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { Count = 0 }, JsonRequestBehavior.AllowGet);
        }

        // Post method AJAX
        [HttpPost]
        public ActionResult AddToCart(int id, int quantity)
        {
            var code = new { Success = false, msg = "", code = -1, Count = 0 };
            var checkProduct = db.SanPhams.FirstOrDefault(x => x.MaSP == id);
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
                    SoLuong = quantity,
                    Image = checkProduct.HinhAnh,
                    GiaTien = checkProduct.GiaTienDaKhuyenMai > 0 ? (decimal)checkProduct.GiaTienDaKhuyenMai : (decimal)checkProduct.GiaTien
                };
                item.TongTien = item.SoLuong * item.GiaTien;
                cart.AddToCart(item, quantity);
                Session["Cart"] = cart;
                code = new { Success = true, msg = "Thêm vào giỏ hàng thành công!", code = 1, Count = cart.Items.Count };
            }
            return Json(code);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            var code = new { Success = false, msg = "", code = -1, Count = 0 };
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                var checkItem = cart.Items.FirstOrDefault(x => x.MaSP == id);
                if (checkItem != null)
                {
                    cart.Delete(id);
                    code = new { Success = true ,msg = "Xóa sản phẩm thành công!", code = 1, Count = cart.Items.Count };
                }
            }
            return Json(code);
        }

        [HttpPost]
        public ActionResult Update(int id, int quantity)
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                cart.UpdateQuantity(id, quantity);
                return Json(new { Success = true });
            }
            return Json(new {Success = false});
        }

        public ActionResult Payment()
        {
            return View();
        }
    }
}