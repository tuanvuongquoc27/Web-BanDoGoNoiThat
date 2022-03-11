<%-- 
    Document   : myCart
    Created on : Mar 11, 2022, 11:46:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">        
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/mystore.css">
        <link rel="stylesheet" href="fonts/fontawesome-free-6.0.0-web/css/all.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="main">
            <div class="row header">
                <div class="col-sm-1"></div>
                <div class="col-sm-10 header__cart">
                    <a class="" href="Home.html"><i class="fa-solid fa-house"></i>Trang chủ</a>
                    <span class="cart-name">Giỏ hàng</span>
                </div>
                <div class="col-sm-1"></div>
            </div>
            <div class="container product__information">
                <div class="row product__thead">
                    <div class="col-sm-6"><h2>Sản phẩm </h2></div>
                    <div class="col-sm-2"><h2>Đơn giá</h2></div>
                    <div class="col-sm-2"><h2>Số lượng</h2></div>
                    <div class="col-sm-2"><h2>Thành tiền</h2></div>
                </div>
                <div class="row product__row">
                    <div class="col-sm-6 product__cart">
                        <img src="./image/login-img.jpg" alt="" class="header__cart-img img-fluid">
                        <h5 class="home-product-item__name">Set dung trang Whoo dodng y hoang cung Gong Jinh Jnag Set dung trang Whoo dodng y hoang cung Gong Jinh Jnag</h5>

                    </div>
                    <div class="col-sm-2 product__price">2.000đ</div>
                    <div class="col-sm-2 product__quantity">12</div>
                    <div class="col-sm-2 product__total">24.000đ</div>
                </div>
                <div class="row product__row">
                    <div class="col-sm-6 product__cart">
                        <img src="./image/login-img.jpg" alt="" class="header__cart-img img-fluid">
                        <h5 class="home-product-item__name">Set dung trang Whoo dodng y hoang cung Gong Jinh Jnag</h5>

                    </div>
                    <div class="col-sm-2 product__price">2.000đ</div>
                    <div class="col-sm-2 product__quantity">12</div>
                    <div class="col-sm-2 product__total">24.000đ</div>
                </div>
                <div class="row product__row">
                    <div class="col-sm-6 product__cart">
                        <img src="./image/login-img.jpg" alt="" class="header__cart-img img-fluid">
                        <h5 class="home-product-item__name">Set dung trang Whoo dodng y hoang cung Gong Jinh Jnag</h5>

                    </div>
                    <div class="col-sm-2 product__price">2.000đ</div>
                    <div class="col-sm-2 product__quantity">12</div>
                    <div class="col-sm-2 product__total">24.000đ</div>
                </div>
                <div class="row">
                    <div class="col-sm-9"></div>
                    <div class="col-sm-3 total-pay">
                        <h3>Tống tiền hàng: 100.000đ</h3>
                        <h3>Phí vận chuyển: 20.000đ</h3>
                        <h3>Tổng thanh toán: 120.000đ</h3>
                    </div>
                </div>  

                <div class="product__pay">
                    <form action="#">
                        <h2>Phương thức thanh toán</h2>
                        <select name="" id="" class="pay-option">
                            <option value="">Thanh toán ví điện tử</option>
                            <option value="">Thanh toán khi nhận hàng</option>
                        </select>
                        <input type="submit" class="sub-btn" value="Thanh toán">
                    </form>


                </div>

            </div>

            <!-- footer -->
            <div class="footer">

                <div class=" footer__header">
                    <div class="message message-section row">
                        <div class="message__icon col-sm-2">
                            <img src="/web/image/footer3.png" alt="">
                        </div>
                        <div class="message__infor col-sm-10">
                            <h3 class="message__header">Giao hàng tận nơi</h3>
                            <p class="message__description">Giao hàng nhanh chóng, đảm bảo chất lượng trên toàn quốc</p>
                        </div>
                    </div>
                    <div class="message-section row">
                        <div class="message__icon col-sm-2">
                            <img class="message__icon-img" src="/web/image/footter1.png" alt="">
                        </div>
                        <div class="message__infor col-sm-10">
                            <h3 class="message__header">Thanh toán khi nhận hàng </h3>
                            <p class="message__description">Thanh toán khi nhận được hàng đảm bảo chất lượng.</p>
                        </div>
                    </div>
                    <div class="message-section row">
                        <div class="message__icon col-sm-2">
                            <img class="message__icon-img" src="/web/image/footer2.png" alt="">
                        </div>
                        <div class="message__infor col-sm-10">
                            <h3 class="message__header">Cam kết chất lượng</h3>
                            <p class="message__description">Chúng tôi cam kết chất lượng các mặt hàng bán ra</p>
                        </div>
                    </div>
                </div>
                <div class="row footer-main">
                    <div class="col-sm-3 first-footer footer-section">
                        <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Trung tâm trợ giúp</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Mall</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Hướng dẫn mua hàng</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-2 footer-section">
                        <h3 class="footer__heading">Giới Thiệu</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Giới thiệu</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Tuyển dụng</a>
                            </li>

                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Điều khoản</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-2 footer-section">
                        <h3 class="footer__heading">Liên hệ</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Địa chỉ:Số XX, đường Nguyễn A, Hà nội</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Liên hệ : 098XXXXXXX</a>
                            </li>

                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link">Điều khoản</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-2 footer-section">
                        <h3 class="footer__heading">Theo dõi</h3>
                        <ul class="footer__list">
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link"><i class="footer__list-item--icon fa-brands fa-facebook"></i>Facebook</a>
                            </li>
                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link"><i class="footer__list-item--icon fa-brands fa-instagram-square"></i>Instagram</a>
                            </li>

                            <li class="footer__list-item">
                                <a href="#" class="footer__list-item--link nav-link"><i class="footer__list-item--icon fa-brands fa-linkedin"></i>Linkedin</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-3 last-footer footer-section">
                        <h3 class="footer__heading">Chăm sóc khách hàng</h3>

                    </div>
                </div>

            </div>



        </div>
    </body>
</html>
