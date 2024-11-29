using PayPal.Api;
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
                var tongTien = cart.Items.Sum(item => item.TongTien);
                Session["TongTien"] = tongTien;
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
                Session["SoLuong"] = item.SoLuong;
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

        [HttpPost]
        public ActionResult Payment(OrderViewModel req)
        {
            var code = new { Success = false, Code = -1 };
            if (ModelState.IsValid)
            {

                ShoppingCart cart = (ShoppingCart)Session["Cart"];
                if(cart != null)
                {
                    var khachHang = db.KhachHangs.FirstOrDefault(x => x.MaKH == req.MaKH);

                    DonHang dh = new DonHang();
                    dh.MAKH = req.MaKH;
                    Session["MaKH"] = req.MaKH.ToString();
                    dh.NgayDat = DateTime.Now;
                    Session["NgayDat"] = dh.NgayDat;
                    dh.TongTien = (double)cart.Items.Sum(s => s.GiaTien * s.SoLuong);
                    dh.PTThanhToan = req.PTThanhToan;
                    dh.TTDonHang = "Chưa giao hàng";
                    dh.TTThanhToan = "Chưa thanh toán";
                    Random rand = new Random();
                    string newId;
                    do
                    {
                        newId = "HD#" + rand.Next(0, 9999).ToString().PadLeft(4, '0');
                    }
                    while (db.DonHangs.Any(x => x.MaDH == newId));

                    dh.MaDH = newId;
                    cart.Items.ForEach(item => dh.ChiTietDonHangs.Add(new ChiTietDonHang
                    {
                        MaSP = item.MaSP,
                        TongTien = (double)item.TongTien,
                        SoLuong = item.SoLuong,
                    }));
                    var MaHD = dh.MaDH;
                    Session["MaDH"] = dh.MaDH;
                    Session["MaHD"] = HttpUtility.UrlEncode(MaHD);
                    Session["IdKH"] = dh.MAKH;
                    db.DonHangs.Add(dh);
                    db.SaveChanges();

                    // Send Mail
                    var strSanPham = "";
                    foreach(var sp in cart.Items)
                    {
                        strSanPham += "<tr>";
                        strSanPham += "<td>"+sp.TenSP+"</td>";
                        strSanPham += "<td>" + sp.SoLuong + "</td>";
                        strSanPham += "<td>" + sp.GiaTien + "</td>";
                        strSanPham += "</tr>";
                    }
                    string contentCustomer = System.IO.File.ReadAllText(Server.MapPath("~/Styles/template/send2.html"));
                    contentCustomer = contentCustomer.Replace("{{MaDH}}", dh.MaDH);
                    contentCustomer = contentCustomer.Replace("{{SanPham}}", strSanPham);
                    contentCustomer = contentCustomer.Replace("{{GiaTien}}", dh.TongTien.ToString("#,##0 VNĐ"));
                    contentCustomer = contentCustomer.Replace("{{TongTien}}", dh.TongTien.ToString("#,##0 VNĐ"));
                    contentCustomer = contentCustomer.Replace("{{NgayDat}}", Session["NgayDat"].ToString());
                    contentCustomer = contentCustomer.Replace("{{PTTToan}}", dh.PTThanhToan);
                    contentCustomer = contentCustomer.Replace("{{TenKH}}", khachHang.HoTen);
                    contentCustomer = contentCustomer.Replace("{{DiaChi}}", khachHang.DiaChi);
                    contentCustomer = contentCustomer.Replace("{{SDT}}", khachHang.SoDienThoai);
                    contentCustomer = contentCustomer.Replace("{{gmail}}", khachHang.Email);
                    sendMail.SendMail("TechWorld", "Đơn hàng: "+dh.MaDH, contentCustomer, req.Email);
                    Session["Cart"] = null;

                    code = new { Success = true, Code = 1 };
                    return RedirectToAction("OrderSuccess");
                }
            }
            return Json(code);
        }

        public ActionResult OrderSuccess() { return View(); }
        public ActionResult OrderFailed() { return View(); }

        // Method Paypal
        public ActionResult PaymentWithPaypal(string Cancel = null)
        {
            //lấy APIContext
            APIContext apiContext = PaypalConfiguration.GetAPIContext();
            try
            {
                //Người trả tiền cho phương thức thanh toán dưới dạng Paypal
                //ID người trả về khi hoàn thành thanh toán  
                string payerId = Request.Params["PayerID"];
                if (string.IsNullOrEmpty(payerId))
                {
                    // Nếu ID không tồn tại
                    // Tạo thanh toán
                    // baseURI là url paypal gửi lại
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/shoppingcart/PaymentWithPayPal?";
                    //here we are generating guid for storing the paymentID received in session  
                    //which will be used in the payment execution  
                    var guid = Convert.ToString((new Random()).Next(100000));
                    ///Createpayment cho url phê duyệt thanh toán
                    //chuyển hướng đến trang thanh toán tài khoản paypal
                    var createdPayment = this.CreatePayment(apiContext, baseURI + "guid=" + guid);
                    //get links returned from paypal in response to Create function call  
                    var links = createdPayment.links.GetEnumerator();
                    string paypalRedirectUrl = null;
                    while (links.MoveNext())
                    {
                        Links lnk = links.Current;
                        if (lnk.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            //saving the payapalredirect URL to which user will be redirected for payment  
                            paypalRedirectUrl = lnk.href;
                        }
                    }
                    // saving the paymentID in the key guid  
                    Session.Add(guid, createdPayment.id);
                    return Redirect(paypalRedirectUrl);
                }
                else
                {
                    // This function exectues after receving all parameters for the payment  
                    var guid = Request.Params["guid"];
                    var executedPayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                    // Nếu thanh toán được thực hiện không thành công thì chúng tôi sẽ hiển thị thông báo thanh toán không thành công cho người dùng
                    if (executedPayment.state.ToLower() != "approved")
                    {
                        return View("FailureView");
                    }
                }
            }
            catch (Exception ex)
            {
                return View("FailureView");
            }
            //on successful payment, show success page to user.  
            var code = new { Success = false, Code = -1 };
            if (ModelState.IsValid)
            {
                ShoppingCart cart = (ShoppingCart)Session["Cart"];
                if (cart != null)
                {
                    int MaKH = Convert.ToInt32(Session["MaKH"]);
                    DonHang dh = new DonHang();
                    dh.MAKH = MaKH;
                    dh.NgayDat = DateTime.Now;
                    Session["NgayDat"] = dh.NgayDat;
                    dh.TTThanhToan = "Đã thanh toán";
                    dh.TTDonHang = "Chưa giao hàng";
                    dh.PTThanhToan = "Paypal";
                    cart.Items.ForEach(x => dh.ChiTietDonHangs.Add(new ChiTietDonHang
                    {
                        MaSP = x.MaSP,
                        SoLuong = x.SoLuong,
                        TongTien = (double)x.TongTien,
                    }));
                    dh.TongTien = (double)cart.Items.Sum(s => (s.GiaTien * s.SoLuong));
                    Random rand = new Random();
                    string newId;
                    do
                    {
                        newId = "HD#" + rand.Next(0, 9999).ToString().PadLeft(4, '0');
                    }
                    while (db.DonHangs.Any(x => x.MaDH == newId));

                    dh.MaDH = newId;
                    db.DonHangs.Add(dh);
                    db.SaveChanges();

                    var khachHang = db.KhachHangs.FirstOrDefault(item => item.MaKH == MaKH);
                    Session["MaHD"] = dh.MaDH;
                    Session["IdKH"] = dh.MAKH;

                    // Send Mail
                    var strSanPham = "";
                    foreach (var sp in cart.Items)
                    {
                        strSanPham += "<tr>";
                        strSanPham += "<td>" + sp.TenSP + "</td>";
                        strSanPham += "<td>" + sp.SoLuong + "</td>";
                        strSanPham += "<td>" + sp.GiaTien + "</td>";
                        strSanPham += "</tr>";
                    }
                    string contentCustomer = System.IO.File.ReadAllText(Server.MapPath("~/Styles/template/send2.html"));
                    contentCustomer = contentCustomer.Replace("{{MaDH}}", dh.MaDH);
                    contentCustomer = contentCustomer.Replace("{{SanPham}}", strSanPham);
                    contentCustomer = contentCustomer.Replace("{{GiaTien}}", dh.TongTien.ToString("#,##0 VNĐ"));
                    contentCustomer = contentCustomer.Replace("{{TongTien}}", dh.TongTien.ToString("#,##0 VNĐ"));
                    contentCustomer = contentCustomer.Replace("{{NgayDat}}", Session["NgayDat"].ToString());
                    contentCustomer = contentCustomer.Replace("{{PTTToan}}", dh.PTThanhToan);
                    contentCustomer = contentCustomer.Replace("{{TenKH}}", khachHang.HoTen);
                    contentCustomer = contentCustomer.Replace("{{DiaChi}}", dh.KhachHang.DiaChi);
                    contentCustomer = contentCustomer.Replace("{{SDT}}", dh.KhachHang.SoDienThoai);
                    contentCustomer = contentCustomer.Replace("{{gmail}}", dh.KhachHang.Email);
                    sendMail.SendMail("TechWorld", "Đơn hàng: " + dh.MaDH, contentCustomer, dh.KhachHang.Email);
                    Session["Cart"] = null;
                    code = new { Success = true, Code = 1 };
                    return RedirectToAction("OrderSuccess");
                }
            }
            return Json(code);
        }
        private PayPal.Api.Payment payment;
        // Trừ tiền vào tài khoản paypal
        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution()
            {
                payer_id = payerId
            };
            this.payment = new Payment()
            {
                id = paymentId
            };
            return this.payment.Execute(apiContext, paymentExecution);
        }
        // Tính tổng tiền
        private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            //create itemlist and add item objects to it  
            var itemList = new ItemList()
            {
                items = new List<Item>()
            };
            //Adding Item Details like name, currency, price etc  
            foreach (var item in cart.Items)
            {
                itemList.items.Add(new Item()
                {
                    name = item.TenSP,
                    currency = "USD",
                    price = Math.Round(item.GiaTien / 25410,2).ToString(),
                    quantity = item.SoLuong.ToString(),
                    sku = item.MaSP.ToString(),
                });
            }
            var payer = new Payer()
            {
                payment_method = "paypal"
            };
            // Định cấu hình Url chuyển hướng ở đây với đối tượng RedirectUrls
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl + "&Cancel=true",
                return_url = redirectUrl
            };
            // Add tax , shipping , subtotal
            var details = new Details()
            {
                tax = "0",
                shipping = "0",
                subtotal = cart.Total().ToString(),
            };
            //Final amount with details  
            var amount = new Amount()
            {
                currency = "USD",
                total = cart.Total().ToString(), // Tổng của tax,shipping,subtotal
                details = details
            };
            var transactionList = new List<Transaction>();
            // Adding description about the transaction  
            var paypalOrderId = DateTime.Now.Ticks;
            transactionList.Add(new Transaction()
            {
                description = $"Invoice #{paypalOrderId}",
                invoice_number = paypalOrderId.ToString(), //Generate an Invoice No    
                amount = amount,
                item_list = itemList
            });
            this.payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };
            // Create a payment using a APIContext  
            return this.payment.Create(apiContext);
        }

    }
}