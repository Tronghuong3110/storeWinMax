<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<head>
<title>Chi tiết sản phẩm</title>
<link rel="stylesheet"
	href="<c:url value = '/template/web/css/test.css' />">
    
</head>

<div class="super_container">
	<div class="single_product" style="padding-bottom: 20px;">
		<div class="container-fluid"
			style="background-color: #fff; padding: 11px;">
			<div class="row">
				<div class="col-lg-2 order-lg-1 order-2">
					<ul class="image_list">
						<li data-image="https://i.imgur.com/21EYMGD.jpg"><img
							src="https://i.imgur.com/21EYMGD.jpg" alt=""></li>
						<li data-image="https://i.imgur.com/DPWSNWd.jpg"><img
							src="https://i.imgur.com/DPWSNWd.jpg" alt=""></li>
						<li data-image="https://i.imgur.com/HkEiXfn.jpg"><img
							src="https://i.imgur.com/HkEiXfn.jpg" alt=""></li>
					</ul>
				</div>
				<div class="col-lg-4 order-lg-2 order-1">
					<div class="image_selected">
						<img src="https://i.imgur.com/qEwct2O.jpg" alt="">
					</div>
				</div>
				<div class="col-lg-6 order-3">
					<div class="product_description">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
								<li class="breadcrumb-item"><a href="#">Danh sách sản phẩm</a></li>
								<li class="breadcrumb-item active">Tên sản phẩm</li>
							</ol>
						</nav>
						<div class="product_name">Name Product</div>
						<div class="product-rating">
							<span class="badge badge-success"><i class="fa fa-star"></i>
								4.5 Star</span> <span class="rating-review">Ranking trên thị
								trường</span>
						</div>
						<div>
							<span class="product_price">200</span> <strike
								class="product_discount"> <span style='color: black'>250<span></strike>
						</div>
						<div>
							<span class="product_saved">Đã mua:</span> <span
								style='color: black'><span>
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
                                            <div class="col-md-3 col-xs-3"> <img src="https://img.icons8.com/color/48/000000/price-tag.png"> </div>
                                            <div class="col-md-9 col-xs-9">
                                                <div class="pr-info"> <span class="break-all">Miễn phí vận chuyển toàn miền bắc</span> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-7"> </div>
                            </div>
							<div class="row" style="margin-top: 15px;">
								<div class="col-xs-6" style="margin-left: 15px;">
									<span class="product_options">Lỗ Ren</span><br>
									<button class="btn btn-primary btn-sm">M3x0,6</button>
									<button class="btn btn-primary btn-sm">M3x0,5</button>
								</div>
								<div class="col-xs-6" style="margin-left: 55px;">
									<span class="product_options">Hình dạng</span><br>
									<button class="btn btn-primary btn-sm">Bằng</button>
									<button class="btn btn-primary btn-sm">Nhọn</button>
								</div>
							</div>
						</div>
						<hr class="singleline">
						<div class="order_info d-flex flex-row">
							<form action="#">
						</div>
						<div class="row">
							<div class="col-xs-6" style="margin-left: 13px;">
								<div class="product_quantity">
									<span>QTY: </span> <input id="quantity_input" type="number"
										value="1">
									<div class="quantity_buttons">
										<div id="quantity_inc_button"
											class="quantity_inc quantity_control">
											<i class="fas fa-chevron-up"></i>
										</div>
										<div id="quantity_dec_button"
											class="quantity_dec quantity_control">
											<i class="fas fa-chevron-down"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-6">
								<button type="button" class="btn btn-primary shop-button">Thêm
									vào giỏ hàng</button>
								<button type="button" class="btn btn-success shop-button">Đặt
									ngay</button>
								<div class="product_fav">
									<i class="fas fa-heart"></i>
								</div>
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
			

			<!-- Thông tin sản phẩm -->
			<div class="row row-underline">
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
								<td class="col-md-4"><span class="p_specification">Tên sản phẩm:</span></td>
								<td class="col-md-8">
									<ul>
										<li>Cọc....</li>
									</ul>
								</td>
							</tr>
							<tr class="row mt-10">
								<td class="col-md-4"><span class="p_specification">Kích thước:</span></td>
								<td class="col-md-8">
									<ul>
										<li>56x85</li>
									</ul>
								</td>
							</tr>
							<tr class="row mt-10">
								<td class="col-md-4"><span class="p_specification">Lỗ Ren:</span></td>
								<td class="col-md-8">
									<ul>
										<li>M3x0,5</li>
									</ul>
								</td>
							</tr>
							<tr class="row mt-10">
								<td class="col-md-4"><span class="p_specification">Hình dạng:</span></td>
								<td class="col-md-8">
									<ul>
										<li>Bằng</li>
									</ul>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>