
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="urlApiDetail" value="/api/product/detail" />
<c:url var="urlApiListProduct" value="/api/product/category/list" />
<c:url var="urlAddProduct" value="/api/cart" />

<head>
<title>Chi tiết sản phẩm</title>
<link rel="stylesheet"
	href="<c:url value = '/template/web/css/detail.css' />">
<style>
.image_list>li {
	padding: 0;
}

.js-img {
	height: 100%;
}
</style>
</head>
<body>
	<div class="super_container">
		<div class="single_product" style="padding-bottom: 20px;">
			<div class="container-fluid"
				style="background-color: #fff; padding: 11px;">
				<div class="row">
					<div class="col-lg-2 order-lg-1 order-2">
						<ul class="image_list">
							<li data-image="https://i.imgur.com/21EYMGD.jpg"><img src=""
								alt="" class="js-img"></li>
							<li data-image="https://i.imgur.com/21EYMGD.jpg"><img src=""
								alt="" class="js-img"></li>
							<li data-image="https://i.imgur.com/21EYMGD.jpg"><img src=""
								alt="" class="js-img"></li>
						</ul>
					</div>
					<div class="col-lg-4 order-lg-2 order-1">
						<div class="image_selected">
							<img class="js-img" src="" alt="">
						</div>
					</div>
					<div class="col-lg-6 order-3">
						<div class="product_description">
							<nav>
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="<c:url value = '/trang-chu'/>">Trang chủ</a></li>
									<li class="breadcrumb-item"><a href="/danh-sach-san-pham">Danh sách sản
											phẩm</a></li>
									<li class="breadcrumb-item active js-name">Tên sản phẩm</li>
								</ol>
							</nav>
							<div class="product_name">
								<h1 class="js-name"></h1>
								<p class="js-size"></p>
							</div>
							<div class="product-rating">
								<span class="badge badge-success"><i class="fa fa-star"></i>
									4.5 Star</span> <span class="rating-review">Ranking trên thị
									trường</span>
							</div>
							<div>
								<span class="product_price js-price">200</span> <strike
									class="product_discount"> <span style='color: black'>250<span></strike>
							</div>
							<hr class="singleline">

							<!-- sẽ thêm vào sau -->
							<!-- <div> <span class="product_info">EMI starts at ₹ 2,000. No Cost EMI Available<span><br> 
                        		<span class="product_info">Warranty: 6 months warranty<span><br> 
                        		<span class="product_info">7 Days easy return policy<span><br> 
                        		<span class="product_info">7 Days easy return policy<span><br> 
                        		<span class="product_info">In Stock: 25 units sold this week<span> 
                        </div> -->

							<div>
								<div class="row">
									<div class="col-md-5">
										<div class="br-dashed">
											<div class="row">
												<div class="col-md-3 col-xs-3">
													<i class="fas fa-shipping-fast"></i>
												</div>
												<div class="col-md-9 col-xs-9">
													<div class="pr-info">
														<span class="break-all">Miễn phí vận chuyển toàn
															miền bắc</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-7"></div>
								</div>
							</div>
							<hr class="singleline">
							<div class="order_info d-flex flex-row">
								<form action="#">
							</div>
							<div class="row">
								<div class="col-xs-6" style="margin-left: 13px;">
									<input class="form-control text-center me-3" id="inputQuantity"
										type="num" value="1"
										style="max-width: 6rem; margin-right: 8px; transform: translateY(15%);" />
								</div>
								<div class="col-xs-6">
									<button type="button"
										class="btn btn-primary shop-button js-btn-add">Thêm
										vào giỏ hàng</button>
									<button type="button"
										class="btn btn-success shop-button js-btn-buy">Đặt
										ngay</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Sản Phẩm liên quan -->
				<div class="row row-underline">
					<div class="col-md-6">
						<span class=" deal-text">Sản Phẩm Liên quan</span>
					</div>
					<div class="col-md-6">
						<a href="#" data-abc="true"> <span class="ml-auto view-all"></span>
						</a>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-12" style="margin-bottom: -24px;">
							<div id="myCarousel" class="carousel slide" data-ride="carousel"
								data-interval="0" style="transform: translateX(1%);">
								<!-- Carousel indicators -->
								<ol class="carousel-indicators" style="margin-bottom: 24px;">
									<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
									<li data-target="#myCarousel" data-slide-to="1"></li>
									<li data-target="#myCarousel" data-slide-to="2"></li>
								</ol>

								<!-- Wrapper for carousel items -->
								<div class="carousel-inner">
									<!-- render -->
								</div>

								<!-- Carousel controls -->
								<a class="carousel-control-prev" href="#myCarousel"
									data-slide="prev" style="transform: translateX(-62%);"> <i
									class="fa fa-angle-left" style="font-size: 35px; color: #000;"></i>
								</a> <a class="carousel-control-next" href="#myCarousel"
									data-slide="next" style="transform: translateX(48%);"> <i
									class="fa fa-angle-right" style="font-size: 35px; color: #000;"></i>
								</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Thông tin sản phẩm -->
				<div class="row row-underline" style="padding-top: 15px;">
					<div class="col-md-6">
						<span class=" deal-text">Thông tin chi tiết</span>
					</div>
					<div class="col-md-6">
						<a href="#" data-abc="true"> <span class="ml-auto view-all"></span>
						</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<table class="col-md-12">
							<tbody>
								<tr class="row mt-10">
									<td class="col-md-4"><span class="p_specification">Tên
											sản phẩm:</span></td>
									<td class="col-md-8">
										<ul>
											<li class="js-name"></li>
										</ul>
									</td>
								</tr>
								<tr class="row mt-10">
									<td class="col-md-4"><span class="p_specification">Kích
											thước:</span></td>
									<td class="col-md-8">
										<ul>
											<li class="js-size"></li>
										</ul>
									</td>
								</tr>
								<tr class="row mt-10">
									<td class="col-md-4"><span class="p_specification">Lỗ
											ren</span></td>
									<td class="col-md-8">
										<ul>
											<li class="js-loren"></li>
										</ul>
									</td>
								</tr>
								<tr class="row mt-10">
									<td class="col-md-4"><span class="p_specification">Hình
											dạng</span></td>
									<td class="col-md-8">
										<ul>
											<li class="js-shape"></li>
										</ul>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<h1 class="text-relationship"></h1>
	</div>

	<script type="text/javascript">
		// get parameter tu url
		$.urlParam = function(name) {
			var results = new RegExp('[\?&]' + name + '=([^&#]*)')
					.exec(window.location.href);
			if (results == null) {
				return null;
			}
			return decodeURI(results[1]) || 0;
		}

		var id = $.urlParam('id'); // id product
		var categoryId = $.urlParam('catrgoryid'); // id category of product

		// call Api get list product by category
		$.ajax({
			type : "GET",
			url : "${urlApiListProduct}?categoryId=" + categoryId,
			dataType : "Json",
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				// danh sách sản phẩm liên quan của sản phẩm này
				html = '<div class="carousel-item active">';
					html += 	'<div class="row">';
				$.each($(data), function(i, item) {
					html += '<div class="col-sm-3">';
					html += 	'<div class="thumb-wrapper">';
					html += 		'<div class="img-box">';
					html += 			'<img style="object-fit: cover; width: 208px;" src="' + "<c:url value = '/template/web/images/products/" + item.img + "' />" + '" class="img-fluid" alt="" />'
					html += 		'</div>';
					html += 		'<div class="thumb-content">';
					html += 			'<h4>' + item.name_product + " " + item.size + '</br>' + 
												item.lo_ren + " " + item.shape + '</h4>';
					html += 			'<p class="item-price">';
					html += 				'<strike>$25.00</strike>' +  ' <span>' + item.price + '</span>';
					html += 			'</p>';
					html += 			'<div class="star-rating">';
					html += 				'<ul class="list-inline">';
					html += 					'<li class="list-inline-item"><i class="fa fa-star"></i></li>';
					html += 					'<li class="list-inline-item"><i class="fa fa-star"></i></li>';
					html += 					'<li class="list-inline-item"><i class="fa fa-star"></i></li>';
					html += 					'<li class="list-inline-item"><i class="fa fa-star"></i></li>';
					html += 					'<li class="list-inline-item"><i class="fa fa-star-o"></i></li>';
					html += 				'</ul>';
					html += 			'</div>';
					html += 			'<button class="btn btn-primary js-btn-add">Thêm vào giỏ hàng</button>';
					html += 		'</div>';
					html += 	'</div>';
					html += '</div>';
					if((i + 1) % 4 == 0 || i + 1 == data.length) {
						console.log(i);
						html += 	'</div>';
						html += '</div>';
						if(i + 1 < data.length) {
							html += '<div class="carousel-item">';
							html += 	'<div class="row">';
						}
					}
				})
				$('.carousel-inner').html(html);
				// console.log(data.length)
			},
			error: function() {
				alert("Lỗi rồi !!")
			}
		})

		// call API render detail product
		$.ajax({
			type : "GET",
			url : "${urlApiDetail}?id=" + id,
			dataType : "Json",
			success : function(data) {
				// render ảnh
				var img = "<c:url value = '/template/web/images/products/" + data.img + "'/>";
				$('.js-img').attr('src', img);
				// render name san pham
				$('.js-name').html(data.name_product);
				$('.js-size').html(data.size);
				$('.js-loren').html(data.lo_ren);
				$('.js-shape').html(data.shape);
				// render price product
				$('.js-price').html(data.price)
			}
		});

		// thêm sản phẩm vào giỏ hàng
		$(".js-btn-add").click(function() {
			var quantity = $("#inputQuantity").val();
			var productId = id;
			var userId = $('.js-infor').data('user_id');
			if(userId == undefined) {
				 window.location.href = "/dang-nhap?message";
			}
			else {
				addProduct(productId, quantity, userId)
			}
		})

		// call api add product to cart
		function addProduct(productId, quantity, userId) {
			$.ajax({
				type : 'POST',
				url : "${urlAddProduct}?productId=" + productId + "&quantity=" + quantity + "&userId=" + userId,
				contentType : 'application/json',
				dataType : 'json',
				success : function(data) {
					alert("Thêm sản phẩm thành công")
				},
				error: function () {
					alert("Thêm sản phẩm thất bại")
				}
			})
		}
	</script>
</body>