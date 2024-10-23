<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watch Shop</title>
        <!-- Font Awesome & Google Fonts -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/nav.css">
        <script type="text/javascript" src="js/main.js"></script>
        <!-- Slick Carousel -->
        <link rel="stylesheet" type="text/css" href="slick/slick.css" />
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
        <script type="text/javascript" src="slick/slick.min.js"></script>
        <!-- Custom Style -->
        <style>
            body {
                font-family: 'Roboto', sans-serif;
            }
            .card:hover {
                transform: scale(1.05);
                transition: all 0.3s ease;
                box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
            }
            .ribbon {
                position: absolute;
                right: 10px;
                top: 10px;
                background-color: #ff0000;
                color: #fff;
                padding: 5px;
                font-size: 0.8em;
                font-weight: bold;
                text-transform: uppercase;
                z-index: 10;
            }
            .carousel-item img {
                height: 500px; /* tăng chiều cao banner */
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        
        <!-- Banner -->
        <div class="container" style="padding-top: 10px;">
            <div id="carouselId" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators rounded-circle">
                    <li data-target="#carouselId" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselId" data-slide-to="1"></li>
                    <li data-target="#carouselId" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <a href="#"><img src="img/banner1.png" class="img-fluid" width="100%" alt="First slide"></a>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/banner2.png" class="img-fluid" width="100%" alt="Second slide"></a>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/banner3.png" class="img-fluid" width="100%" alt="Third slide"></a>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselId" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselId" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <br>

        <!-- Sản phẩm mới -->
        <section class="new-products _1khoi bg-white mt-2">
            <div class="container">
                <div class="noidung bg-white" style=" width: 100%;">
                    <div class="row">
                        <div class="col-12 ">
                            <h2 class="header text-uppercase" style="font-size: 30px;font-weight: 900;text-align: center; color: orange;">Sản phẩm mới</h2>
                        </div>
                    </div>
                    <div class="row khoisanpham">
                        <c:forEach items="${listP1}" var="o">
                            <div class="col-md-3">
                                <div class="card">
                                    <a href="detail?pid=${o.id}" class="motsanpham" style="text-decoration: none; color: black;" data-toggle="tooltip" data-placement="bottom">
                                        <img class="card-img-top anh" src="${o.pimage.img1}" style="height: 250px" loading="lazy">
                                        <div class="card-body noidungsp mt-3">
                                            <h3 class="card-title ten">${o.name}</h3>
                                            <div class="gia d-flex align-items-baseline">
                                                <div class="giamoi"><fmt:formatNumber value="${o.price}"/> vnđ</div>
                                                <div class="giacu text-muted ml-1"><del><fmt:formatNumber value="${o.price*1.1}"/> vnđ</del></div>
                                                <div class="sale">-10%</div>
                                            </div>
                                            <div class="danhgia">
                                                ${o.rate}<i class="fa fa-star" style="color: yellow"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <!-- Sản phẩm bán chạy -->
        <section class="best-seller _1khoi">
            <div class="container">
                <div class="noidung bg-white" style=" width: 100%;">
                    <div class="row">
                        <div class="col-12 ">
                            <h2 class="header text-uppercase" style="font-size: 30px;font-weight: 900;text-align: center; color: orange;">Sản phẩm bán chạy</h2>
                        </div>
                    </div>
                    <div class="row khoisanpham">
                        <c:forEach var="o" items="${listP2}">
                            <div class="col-md-3">
                                <div class="card">
                                    <a href="detail?pid=${o.id}" class="motsanpham" style="text-decoration: none; color: black;" data-toggle="tooltip" data-placement="bottom">
                                        <img class="card-img-top anh" src="${o.pimage.img1}" style="height: 250px" loading="lazy">
                                        <div class="card-body noidungsp mt-3">
                                            <h3 class="card-title ten">${o.name}</h3>
                                            <div class="gia d-flex align-items-baseline">
                                                <div class="giamoi"><fmt:formatNumber value="${o.price}"/> vnđ</div>
                                                <div class="giacu text-muted ml-1"><del><fmt:formatNumber value="${o.price*1.1}"/> vnđ</del></div>
                                                <div class="sale">-10%</div>
                                            </div>
                                            <div class="danhgia">
                                                ${o.rate}<i class="fa fa-star" style="color: yellow"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <!-- Sản phẩm giá tốt -->
        <section class="discount-products _1khoi" style="margin-top: 25px;">
            <div class="container">
                <div class="noidung bg-white" style=" width: 100%;">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="header text-uppercase" style="font-size: 30px;font-weight: 900;text-align: center; color: orange;">Sản phẩm Giá tốt</h2>
                        </div>
                    </div>
                    <div class="row khoisanpham">
                        <c:forEach var="o" items="${listP3}">
                            <div class="col-md-3">
                                <div class="card">
                                    <a href="detail?pid=${o.id}" class="motsanpham" style="text-decoration: none; color: black;" data-toggle="tooltip" data-placement="bottom">
                                        <img class="card-img-top anh" src="${o.pimage.img1}" style="height: 250px" loading="lazy">
                                        <div class="card-body noidungsp mt-3">
                                            <h3 class="card-title ten">${o.name}</h3>
                                            <div class="gia d-flex align-items-baseline">
                                                <div class="giamoi"><fmt:formatNumber value="${o.price}"/> vnđ</div>
                                                <div class="giacu text-muted ml-1"><del><fmt:formatNumber value="${o.price*1.1}"/> vnđ</del></div>
                                                <div class="sale">-10%</div>
                                            </div>
                                            <div class="danhgia">
                                                ${o.rate}<i class="fa fa-star" style="color: yellow"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

        <br>

        <!-- Thương hiệu nổi tiếng -->
   <div class="container" style="margin-bottom: 30px;">
    <div class="col-inner">
        <div id="text-3185983446" class="text">
            <h2 class="uppercase" style="font-size: 40; text-align: center; margin-bottom: 20px;">Tác Giả Nổi Tiếng</h2>

            <div class="row" style="display: flex; justify-content: center; gap: 20px;">
                <a href="search?bid=1" class="col-md-2" 
                   style="display: block; width: 150px; height: 150px; border: 3px solid black; border-radius: 50%; overflow: hidden; 
                          transition: transform 0.3s ease, box-shadow 0.3s ease;">
                    <img src="img/logorolex.jpg" alt="Rolex" 
                         style="width: 100%; height: 100%; object-fit: cover;">
                </a>
                <a href="search?bid=2" class="col-md-2" 
                   style="display: block; width: 150px; height: 150px; border: 3px solid black; border-radius: 50%; overflow: hidden; 
                          transition: transform 0.3s ease, box-shadow 0.3s ease;">
                    <img src="img/logocartier.jpg" alt="Cartier" 
                         style="width: 100%; height: 100%; object-fit: cover;">
                </a>
                <a href="search?bid=3" class="col-md-2" 
                   style="display: block; width: 150px; height: 150px; border: 3px solid black; border-radius: 50%; overflow: hidden; 
                          transition: transform 0.3s ease, box-shadow 0.3s ease;">
                    <img src="img/tac_gia_dale_carnegie_2.jpg" alt="Dale Carnegie" 
                         style="width: 100%; height: 100%; object-fit: cover;">
                </a>
                <a href="search?bid=4" class="col-md-2" 
                   style="display: block; width: 150px; height: 150px; border: 3px solid black; border-radius: 50%; overflow: hidden; 
                          transition: transform 0.3s ease, box-shadow 0.3s ease;">
                    <img src="img/kimlan.jpg" alt="Kim Lân" 
                         style="width: 100%; height: 100%; object-fit: cover;">
                </a>
            </div>
        </div>
    </div>
</div>


        <!-- Footer -->
        

        <!-- Live Chat -->
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
        <df-messenger intent="WELCOME" chat-title="BookShop" agent-id="07d6d881-7f37-481b-b15f-58830e1c2667" language-code="vi"></df-messenger>
        
        <jsp:include page="nav2.jsp" />
        <script>
    document.querySelectorAll('.row a').forEach(function(element) {
        element.addEventListener('mouseenter', function() {
            element.style.transform = 'scale(1.05)';
            element.style.boxShadow = '0 4px 8px rgba(0, 0, 0, 0.2)';
        });
        element.addEventListener('mouseleave', function() {
            element.style.transform = 'scale(1)';
            element.style.boxShadow = 'none';
        });
    });
</script>
    </body>
</html>
