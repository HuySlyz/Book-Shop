<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watch Shop</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

        <style>
            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }
            .nav-container {
                display: flex;
                align-items: center;
                justify-content: flex-end;
                padding: 8px 16px;
                background: #ffffff;
            }

            .profile-button {
                position: relative;
                display: flex;
                align-items: center;
                gap: 8px;
                padding: 8px;
                background: none;
                border: none;
                cursor: pointer;
                border-radius: 50%;
                width: 40px;
                height: 40px;
                background: #f0f2f5;
            }

            .profile-button:hover {
                background: #e4e6e9;
            }

            .dropdown-menu {
                position: absolute;
                top: 100%;
                right: 0;
                width: 360px;
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 12px rgba(0,0,0,0.2);
                padding: 8px 0;
                display: none;
                z-index: 1000;
            }

            .dropdown-menu.show {
                display: block;
            }

            .dropdown-item {
                display: flex;
                align-items: center;
                padding: 8px 16px;
                text-decoration: none;
                color: #050505;
                gap: 12px;
            }

            .dropdown-item:hover {
                background: #f2f2f2;
            }

            .dropdown-item i {
                width: 20px;
                color: #65676b;
            }

            .cart-button {
                position: relative;
                margin-right: 16px;
            }

            .cart-amount {
                position: absolute;
                top: -5px;
                right: -5px;
                background: #e41e3f;
                color: white;
                border-radius: 50%;
                width: 18px;
                height: 18px;
                font-size: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .user-avatar {
                width: 24px;
                height: 24px;
                border-radius: 50%;
                background: #e4e6e9;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .divider {
                height: 1px;
                background: #dadde1;
                margin: 8px 0;
            }

        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md bg-white navbar-light">
            <div class="container">
                <!-- logo  -->
                <a class="navbar-brand" href="home" style="color: #FFA500;"><b>Book Shop</b></a>

                <!-- navbar-toggler  -->
                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                        data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                        aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <!-- form tìm kiếm  -->
                    <form action="search" class="form-inline ml-auto my-2 my-lg-0 mr-3">
                        <div class="input-group" style="width: 500px;">
                            <input type="text" class="form-control" style="border-bottom-color: orange"  aria-label="Small" value="${key != null ? key : ''}" name="key" placeholder="Nhập tên sản phẩm cần tìm kiếm...">

                            <div class="input-group-append">
                                <button type="submit" class="btn" style="background-color: #FFA500; color: white;">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <nav class="nav-container">
                        <!-- Cart Button -->
                        <c:set var="size" value="${sessionScope.size}"/>
                        <button class="profile-button cart-button" onclick="showCart()">
                            <i class="fas fa-shopping-cart"></i>
                            <c:if test="${size > 0}">
                                <div class="cart-amount">${size}</div>
                            </c:if>
                        </button>

                        <!-- Profile Dropdown -->
                        <div style="position: relative;">
                            <c:choose>
                                <c:when test="${sessionScope.account == null}">
                                    <a class="nav-link text-dark text-uppercase" href="login" style="display:inline-block">Tài khoản</a> </li>   

                                </c:when>
                                <c:otherwise>
                                    <button class="profile-button" onclick="toggleDropdown()">
                                        <i class="fas fa-user"></i>
                                    </button>
                                    <div class="dropdown-menu" id="dropdownMenu">
                                        <c:choose>
                                            <c:when test="${sessionScope.account.roleID == 1}">
                                                <a href="AdminManage.jsp" class="dropdown-item">
                                                    <div class="user-avatar">
                                                        <i class="fas fa-user"></i>
                                                    </div>
                                                    <span>Xin chào ${account.user}</span>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="profile" class="dropdown-item">
                                                    <div class="user-avatar">
                                                        <i class="fas fa-user"></i>
                                                    </div>
                                                    <span>Xin chào ${account.user}</span>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="divider"></div>
                                        <a href="changepass" class="dropdown-item">
                                            <i class="fas fa-key"></i>
                                            <span>Thay đổi mật khẩu</span>
                                        </a>
                                        <a href="login?type=logout" class="dropdown-item">
                                            <i class="fas fa-sign-out-alt"></i>
                                            <span>Đăng xuất</span>
                                        </a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </nav>
                    <script>
                        function toggleDropdown() {
                            document.getElementById('dropdownMenu').classList.toggle('show');
                        }

                        function showCart() {
                            // Implement cart display logic here
                            console.log('Show cart');
                        }

                        // Close dropdown when clicking outside
                        window.onclick = function (event) {
                            if (!event.target.matches('.profile-button')) {
                                var dropdowns = document.getElementsByClassName('dropdown-menu');
                                for (var i = 0; i < dropdowns.length; i++) {
                                    var openDropdown = dropdowns[i];
                                    if (openDropdown.classList.contains('show')) {
                                        openDropdown.classList.remove('show');
                                    }
                                }
                            }
                        }
                    </script>

                </div>
            </div>
        </nav>

        <div class="nav-bg">
            <nav class="container">
                <ul class="main-menu">
                    <li><a href="home">Trang chủ</a></li>
                    <li style="margin-left: 30px;"><a href="search">Sản phẩm</a></li>                   
                    <li style="margin-left: 30px;"><a style="color: white">Thương hiệu <i class="fa fa-caret-down fa-css"></i></a>
                        <ul class="sub-menu">
                            <c:forEach var="o" items="${listB}">                               
                                <li><a href="search?bid=${o.bid}">${o.bname}</a></li>
                                </c:forEach>
                        </ul>
                    </li>   
                    <li style="margin-left: 30px;"><a href="blog">Tin Tức</a></li>                   
                    <li style="margin-left: 30px;"><a href="gioithieu.jsp">Giới thiệu</a></li>                   
                </ul>
            </nav>
        </div>

        <div id="showcart" style="margin-right: 120px;margin-top: -5px;width: 325px;">
            <c:set var="o" value="${sessionScope.cart}"/>
            <c:if test="${size == 0}">
                Chưa có sản phẩm nào trong giỏ hàng!
                <br>
                <hr>
            </c:if>
            <c:if test="${size != 0}">
                <a style="margin-left: 280px;font-size: 24px;color: red" onclick="showCart()"><i class="fa fa-close"></i></a>
                <div>
                    <table style="border-collapse: collapse;width: 100%">
                        <tbody>
                            <c:forEach items="${o.items}" var="i">
                                <tr> 
                                    <td class="img-style"><a href="detail?pid=${i.product.id}"><img src="${i.product.pimage.img1}" width="80px" height="60px"></a></td>
                                    <td style="margin: 0; padding: 3px;">
                                        <a href="detail?pid=${i.product.id}"><p style="color: red; margin: 0;"><fmt:formatNumber value="${i.price}"/> vnđ X ${i.quantity} </p>
                                            <p style="font-size: 14px; margin: 0; padding-top:3px;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;overflow: hidden;" title="${i.product.name}">
                                                ${i.product.name}
                                            </p>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="process?type=remove&pid=${i.product.id}"><i class="fa fa-times text-danger"></i></a>
                                    </td>
                                </tr>  
                            </c:forEach>           
                        </tbody>
                    </table>
                </div>
                <br>
                <hr>
                <div style="padding-bottom:20px; color:red;">
                    Tổng giá: <b style="font-size: 20px;"><fmt:formatNumber value="${totalMoney}"/> vnđ</b>
                </div>
            </c:if>
            <div class="select-button">
                <a class="dropdown-item nutdangky text-center mb-2" href="Cart.jsp">View cart</a>
            </div>
        </div>

        <script type="text/javascript">
            function showCart() {
                var x = document.getElementById("showcart");
                if (x.style.display === "block") {
                    x.style.display = "none";
                } else {
                    x.style.display = "block";
                }
            }
        </script>
    </body>
</html>
