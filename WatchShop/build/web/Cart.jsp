<%-- 
    Document   : Cart
    Created on : May 19, 2024, 8:20:22 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Shop</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/home.css">        
        <link rel="stylesheet" href="css/nav.css">
        <script type="text/javascript" src="js/main.js"></script>
        <link rel="stylesheet" type="text/css" href="slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
        
        <script type="text/javascript" src="slick/slick.min.js"></script>      

    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        <c:if test="${size==0||sessionScope.cart==null}">

            <section class="content my-3">
                <div class="container">
                    <div class="cart-page bg-white">
                        <div class="row">
                            <!-- giao diện giỏ hàng khi không có item  -->
                            <div class="py-3 pl-3" style="height: 500px;">
                                <h6 class="header-gio-hang">GIỎ HÀNG CỦA BẠN <span>(0 sản phẩm)</span></h6>
                                <div class="cart-empty-content w-100 text-center justify-content-center" style="margin-left: 250px;margin-top: 150px">
                                    <a href="search" style="color: black"> <img src="img/shopping-cart-not-product.png" alt="shopping-cart-not-product">
                                        <p>Chưa có sản phẩm nào trong giỏ hàng của bạn</p></a>
                                    <a href="search" class="btn btn-primary nutmuathem mb-3">Mua thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>
            </section>
        </c:if>

        <c:if test="${size!=0 && sessionScope.cart!=null}">
            <!-- giao diện giỏ hàng  -->
            <section class="content my-3">
                <div class="container">
                    <div class="cart-page bg-white">
                        <div class="row">
                            <div class="col-md-12 cart">
                                <div class="cart-content py-3 pl-3">
                                    <h3 class="header-gio-hang text-center">GIỎ HÀNG CỦA BẠN</h3><br>
                                    <div class="cart-list-items">
                                        <div class="cart-item d-flex align-items-center mb-3">
                                            <h5 class="col-4 text-center">Sản phẩm</h5>
                                            <h5 class="col-2 text-center">Số lượng</h5>
                                            <h5 class="col-3 text-center">Đơn giá</h5>
                                            <h5 class="col-3 text-center">Thành tiền</h5>
                                        </div>
                                        <c:forEach items="${sessionScope.cart.items}" var="i">
                                            <div class="cart-item d-flex align-items-center">
                                                <a href="detail?pid=${i.product.id}" class="img col-2">
                                                    <img src="${i.product.pimage.img1}" class="img-fluid" style="height: auto; width: 150px;">
                                                    <a href="detail?pid=${i.product.id}" class="ten">${i.product.name}</a>
                                                </a>
                                                <div class="col-2 ml-3">
                                                    <div class="input-number input-group">
                                                        <a href="process?type=sub&pid=${i.product.id}" class="input-group-text">-</a>
                                                        <input type="number" name="num" max="${i.product.quantity}" value="${i.quantity}" class="text-center" style="width: 60px;">
                                                        <a href="process?type=add&pid=${i.product.id}" class="input-group-text">+</a>
                                                    </div>
                                                </div>
                                                <div class="col-3 text-center " style="font-size: 18px; font-weight: bold;">
                                                    <fmt:formatNumber value="${i.price}"/>
                                                </div>
                                                <div class="col-3 text-center" style="font-size: 18px; font-weight: bold;">
                                                    <fmt:formatNumber value="${i.quantity * i.price}"/>
                                                    <a href="process?type=remove&pid=${i.product.id}"><i class="fa fa-times text-danger" style="margin-left: 30px;"></i></a>
                                                </div>

                                            </div>



                                        </c:forEach>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <a href="search" class="btn btn-primary mt-3 ml-4">Mua thêm</a>
                                        </div>
                                        <div class="col-md-5 offset-md-4 mt-3 ">
                                            <div class="tonggiatien d-flex  align-items-center">
                                                <strong class="text-uppercase">Tổng cộng:</strong>
                                                <div style="font-size: 18px; font-weight: bold; margin-left: 10px">  
                                                    <fmt:formatNumber value="${totalMoney}"/> vnđ
                                                </div>
                                                <small class="note d-flex justify-content-end text-muted">
                                                    (Giá đã bao gồm VAT)
                                                </small>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${error==1}">
                                        <div style="margin-left: 250px;color: red;font-size: 20px;font-weight: bold">Tài khoản của bạn không đủ</div>
                                    </c:if>
                                    <c:if test="${error==2}">
                                        <div style="margin-left: 250px;color: red;font-size: 20px;font-weight: bold">Sản của bạn muốn mua đã hết</div>
                                    </c:if>
                                </div>
                                <c:if test="${sessionScope.account==null}">
                                    <a href="checkout?pttt=ttweb"><button class="btn btn-lg btn-block btn-checkout text-uppercase text-white" id="btnCheckout2"
                                                                          style="background: #F5A623; width: 30%; display: block; margin: 0 auto;" onclick="checkout()">Đặt mua</button>
                                    </a> 
                                </c:if>
                                <c:if test="${sessionScope.account!=null}">
                                    <button class="btn btn-lg btn-block btn-checkout text-uppercase text-white" id="btnCheckout2"
                                            style="background: #F5A623; width: 30%; display: block; margin: 0 auto;" onclick="checkout()">Đặt mua</button>
                                </c:if>

                                <!-- giao diện phần thanh toán nằm bên phải  -->
                                <div class=" cart-steps pl-0" id="khoimua">
                                    <div id="cart-steps-accordion" role="tablist" aria-multiselectable="true">
                                        <form action="checkout">                                        
                                            <div class="card">
                                                <div class="card-header" role="tab" id="step1header">
                                                    <h5 class="mb-0">
                                                        <a data-toggle="collapse" data-parent="#cart-steps-accordion"
                                                           href="#step2contentid" aria-expanded="true" aria-controls="step2contentid"
                                                           class="text-uppercase header"><span class="steps">1</span>
                                                            <span class="label">Địa chỉ nhận hàng</span>
                                                            <i class="fa fa-chevron-right float-right"></i>
                                                        </a>
                                                    </h5>
                                                </div>
                                                <div id="step1contentid" class="collapse in" role="tabpanel"
                                                     aria-labelledby="step1header" class="stepscontent">
                                                    <div class="card-body">
                                                        <div class="form-label-group"><div id="fullnameMessage" style="width: 200%"></div>
                                                            <input type="text" id="fullname" class="form-control" value="${sessionScope.name!=null?sessionScope.name:sessionScope.account.user}"
                                                                   placeholder="Nhập họ và tên" name="name" required autofocus oninput="validateFullName()">
                                                        </div>

                                                        <div class="form-label-group"><div id="phoneMessage" style="width: 200%"></div>
                                                            <input type="text" id="phoneNumber" class="form-control" value="${sessionScope.phone!=null?sessionScope.phone:sessionScope.account.phone}" 
                                                                   placeholder="Nhập số điện thoại" name="phone" required oninput="validatePhoneNumber()">
                                                        </div>

                                                        <div class="form-label-group"><div id="emailMessage" style="width: 200%"></div>
                                                            <input type="email" id="email" class="form-control" value="${sessionScope.email!=null?sessionScope.email:sessionScope.account.email}" 
                                                                   placeholder="Nhập địa chỉ email" name="email" required oninput="validateEmail()">
                                                        </div>

                                                        <div class="form-label-group"><div id="addressMessage" style="width: 200%"></div>
                                                            <input type="text" id="address" class="form-control" value="${sessionScope.address!=null?sessionScope.address:sessionScope.account.address}" 
                                                                   placeholder="Nhập Địa chỉ giao hàng" name="address" required oninput="validateAddress()">
                                                        </div>   

                                                        <div class="form-label-group"><label>Chọn ngày muốn nhận hàng</label>
                                                            <input type="date" id="dateShip" id="address" class="form-control" value="${sessionScope.dateShip!=null?sessionScope.dateShip:''}" name="dateShip">
                                                        </div>

                                                        <div class="form-label-group"><label>Chọn khung giờ nhận hàng</label>
                                                            <input type="time" class="form-control" value="${sessionScope.timeShip!=null?sessionScope.timeShip:''}" name="timeShip">
                                                        </div>  

                                                        <div class="form-label-group">
                                                            <textarea type="text" id="inputNote" class="form-control"
                                                                      placeholder="Nhập ghi chú (Nếu có)" name="note">${sessionScope.note!=null?sessionScope.note:''}</textarea>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- bước 3: thanh toán đặt mua  -->
                                                <div class="card">
                                                    <div class="card-header" role="tab" id="step2header">
                                                        <h5 class="mb-0">
                                                            <a data-toggle="collapse" data-parent="#cart-steps-accordion"
                                                               href="#step3contentid" aria-expanded="true"
                                                               aria-controls="step3contentid" class="text-uppercase header"><span
                                                                    class="steps">2</span>
                                                                <span class="label">Thanh toán đặt mua</span>
                                                                <i class="fa fa-chevron-right float-right"></i>
                                                            </a>
                                                        </h5>
                                                    </div>
                                                    <div id="step3contentid" class="collapse in" role="tabpanel"
                                                         aria-labelledby="step3header" class="stepscontent">
                                                        <div class="card-body" style="padding: 15px;">                                                 
                                                            <div class="pttt">
                                                                <h6 class="header text-uppercase">Chọn phương thức thanh toán</h6>
                                                                <div class="option option1">
                                                                    <input type="radio" name="pttt" value="ttcod" checked>
                                                                    <label>Thanh toán khi nhận hàng</label>
                                                                </div>
                                                                <div class="option option2">
                                                                    <input type="radio" name="pttt" value="ttweb">
                                                                    <label>Thanh toán bằng tiền tài khoản shop</label>
                                                                </div>
                                                                <div class="option option3">
                                                                    <input type="radio" name="pttt" value="ttpay" id="atm">
                                                                    <label style="margin-top: -25px;margin-left: 16px;" for="atm" class="chuyenkhoan">Thanh toán chuyển khoản qua Thẻ ATM/Internet Banking</label>
                                                                    <p>- Thời gian chuyển khoản là trong tối đa 1 ngày từ khi có xác
                                                                        nhận đặt mua.</p>
                                                                    <p>- Nội dung chuyển khoản cần ghi: <a href="#">[Mã đơn hàng]</a> ;
                                                                        hoặc <a href="#">[số điện thoại dùng đặt hàng]</a> </p>
                                                                    <p>- Xem thông tin chuyển khoản của VNPay <a
                                                                            href="https://vnpay.vn/chuyen-tien-nhanh-chong-tien-loi-tren-vi-dien-tu-VNPAY-05f976gm2g7i">tại đây</a> </p>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <button type="submit" class="btn btn-lg btn-block btn-checkout text-uppercase text-white"
                                                                    style="background: #F5A623">Đặt mua</button>
                                                            <p class="text-center note-before-checkout">(Vui lòng kiểm tra lại đơn hàng
                                                                trước khi Đặt Mua)</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- het div cart-steps  -->
                            </div>
                            <!-- het row  -->
                        </div>
                        <!-- het cart-page  -->
                    </div>
                    <!-- het container  -->
                                        </div>

            </section>


        </c:if>
        <!-- het khoi content  -->
        <jsp:include page="nav2.jsp"/>
        <script src="js/cart.js"></script>
        <script>
                                                function checkout() {
                                                    var x = document.getElementById("btnCheckout2");
                                                    var y = document.getElementById("khoimua");
                                                    x.style.display = "none";
                                                    y.style.display = "";
                                                }
        </script>
        <%
            session.setAttribute("error", "error");
        %>
        <script type="text/javascript">
            setTimeout(function () {
            <% session.removeAttribute("error"); %>
            }, 1000);
        </script>
    </body>
</html>