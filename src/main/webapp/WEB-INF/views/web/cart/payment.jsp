<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán</title>
<link rel="stylesheet" href="<c:url value = '/template/web/css/payment.css' />">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
</head>
<body>
	<div class="row" style = "margin-top: 14px; justify-content: center;">
		<h1>Thanh Toán</h1>
		<hr class="soften"/>
	</div>
	<h2 class="id-order" data-id="">ID: 123654</h2>
	<div class="row content-payment">
		<div class="col-lg-8 content-left" style = "margin-bottom: 10px;">
			<div class="payment-title">
				<h2 style = "font-size: 25px;">
					<i class="fa-solid fa-square-info"></i> Thông tin khách hàng
				</h2>
			</div>
			
			<!-- thông tin khách hàng -->
			<div class="box-shadow">
				<div class="row infor-customer">
					<div class="col-lg-6">
						<h3>Người mua hàng</h3>
						<hr>
						<form class="infor-customer-buy">
							<input type="text" name="fullname" placeholder="Họ và tên"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='Họ và tên'" required class="input">
							<input type="text" name="email" placeholder="Email"
								onfocus="this.placeholder=''" onblur="this.placeholder='Email'"
								required class="input"> 
							<input type="text"
								name="phoneNumber" placeholder="Số điện thoại"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='Số điện thoại'" required class="input">
						</form>
					</div>
					<div class="col-lg-6 ">
						<h3>Người nhận hàng</h3>
						<hr>
						<form class="infor-customer-receive">
							<input type="text" name="fullname" placeholder="Họ và tên"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='Họ và tên'" required class="input">
							<input type="text" name="phoneNumber" placeholder="Số điện thoại"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='Số điện thoại'" required class="input">
							<a href="#" class="copy-infor"><i class="fa-solid fa-copy"></i>
								Sử dụng thông tin người mua</a>
						</form>
					</div>
				</div>
				<div class="row infor-address">
					<div class="col-lg-6">
						<input type="text" name="address" placeholder="Số nhà/thôn"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder='Số nhà / Thôn'" required class="input">
						<div class="address">
							<select name="conscious" id="conscious" class="select-address">
								<option value="null">--- Chọn Tỉnh/Thành ---</option>
								<option value="1">Hà Nội</option>
								<option value="2">Bắc Ninh</option>
								<option value="3">Thái Bình</option>
								<option value="4">Hà Nam</option>
							</select>
						</div>
						<div class="address">
							<select name="district" id="district" class="select-address">
								<option value="null">--- Chọn quận/huyện ---</option>
								<option value="1">Hà Nội</option>
								<option value="2">Bắc Ninh</option>
								<option value="3">Thái Bình</option>
								<option value="4">Hà Nam</option>
							</select>
						</div>
						<div class="address">
							<select name="commune" id="commune" class="select-address">
								<option value="null">--- Chọn phường/xã ---</option>
								<option value="1">Hà Nội</option>
								<option value="2">Bắc Ninh</option>
								<option value="3">Thái Bình</option>
								<option value="4">Hà Nam</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="select-payment"></div>
					</div>
				</div>
			</div>

			<!-- Phương thức thanh toán -->
			<div class="box-shadow" style="padding: 12px 16px; margin-top: 16px;">
				<div class="title-payment">
					<input type="radio" name="method-payment" id="1"
						style="width: 21px;" value="1"> <label for="payment-1"
						style="display: flex; margin-left: 8px;">
						<div class="payment-img">
							<img
								src="	https://laptrinhjavawebshop.com/assets/images/payment/2022/thanh-toan-chuyen-kh.png"
								alt="ảnh minh họa thanh toán" class="img-exam">
						</div> <span style="font-size: 1.5rem; font-weight: 500;">Thanh
							toán chuyển khoản</span>
					</label>
				</div>
				<div class="row remove js-remove">
					<div class="col-lg-6 select1-payment">
						<h2>Tài khoản Agribank</h2>
						<p>- Số tài khoản: 12345678910111</p>
						<p>- Chủ tài khoản: NGUYỄN TRỌNG GIAO</p>
						<p>- Chi nhánh: Lương Tài Bắc Ninh</p>
					</div>

					<div class="col-lg-6 select1-payment">
						<h2>Tài khoản BIDV</h2>
						<p>- Số tài khoản: 12345678910111</p>
						<p>- Chủ tài khoản: NGUYỄN TRỌNG GIAO</p>
						<p>- Chi nhánh: Gia Bình Bắc Ninh</p>
					</div>

					<small class="text" style = "padding: 0 15px;"> Chú ý: khi thanh toán, quý khách vui
						long ghi nội dung giao dịch là <small class="text text-weight-700">[mã
							đơn hàng]</small> của quý vị và bộ phân chăm sóc khách hàng sẽ liên hệ
						xác nhận đơn gian với quý khách trong vòng 24h kể từ lúc quý khách
						xác nhận thanh toán.
					</small>
				</div>
				<div class="clear"></div>

				<div class="title-payment">
					<input type="radio" name="method-payment" id="2"
						style="width: 21px;" value="2"> <label for="payment-1"
						style="display: flex; margin-left: 8px;">
						<div class="payment-img">
							<img
								src="http://f.imgs.vietnamnet.vn/2017/10/30/18/20171030181243-menh-gia-tien-viet-nam.jpg"
								alt="ảnh minh họa thanh toán" class="img-exam">
						</div> <span style="font-size: 1.5rem; font-weight: 500;">Thanh
							toán khi nhận hàng</span>
					</label>
				</div>
				<div class="row remove js-remove" style = "padding: 0 15px;">
					<div class="content-payment-cod">
						<small class="text"> Quý khách vui lòng đặt cọc <a
							href="#">Tại Đây</a> và bộ phận chăm sóc khách hàng sẽ liên hệ
							xác đơn hàng của bạn trong vòng 24h kể từ thời điểm bạn đặt cọc.
						</small>
					</div>
				</div>
			</div>
		</div>
		<!-- Danh sách sản phẩm -->
		<div class="col-lg-4 content-right" style = " margin-bottom: 180px;">
			<div class="block-product-title">
				<h2 style = "font-size: 25px;">
					<i class="fa-solid fa-cart-shopping"></i> Thông tin đơn hàng
				</h2>
				<button type="button" class="btn btn-light">Sửa</button>
			</div>
			<div class="list-item box-shadow">
				<div class="item">
					<div class="item-infor-img">
						<img
							src="https://www.sieuthithietbi.com/products/phich-cam-chan-tron.jpg"
							alt="ảnh sản phẩm" class="item-img">
					</div>
					<div class="item-infor-name">
						<!-- <p>Chân phich-45x70x40-M3x0,5-bằng</p> -->
						<p>Chân phích</p>
						<p>45x70x40</p>
						<p>M3x0,5</p>
						<p>Bằng</p>
					</div>
					<div class="item-infor-quantity">
						<p class="font-weight-500 text">125.000 x</p>
					</div>
					<div class="item-infor-price">
						<p class="font-weight-500 text">12.500.000 đ</p>
					</div>
				</div>
				<hr>
				<div class="item">
					<div class="item-infor-img">
						<img
							src="https://www.sieuthithietbi.com/products/phich-cam-chan-tron.jpg"
							alt="ảnh sản phẩm" class="item-img">
					</div>
					<div class="item-infor-name">
						<!-- <p>Chân phich-45x70x40-M3x0,5-bằng</p> -->
						<p>Chân phích</p>
						<p>45x70x40</p>
						<p>M3x0,5</p>
						<p>Bằng</p>
					</div>
					<div class="item-infor-quantity">
						<p class="font-weight-500 text">125.000 x</p>
					</div>
					<div class="item-infor-price">
						<p class="font-weight-500 text">12.500.000 đ</p>
					</div>
				</div>
				<hr>

				<div class="total-price">
					<span class="title font-weight-500" style="font-size: 28px;">Thành
						tiền</span> <span class="font-weight-500 text total" data-total="">125.125.111.000
						đ</span>
				</div>
				<textarea class="form-control" rows="3" name="note_customer"
					placeholder="Ghi chú" style="margin-top: 16px; border: 1px solid;"></textarea>
				<div class="btn-payment">
					<button type="submit" class="btn btn-success payment-submit">Thanh
						toán</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
        function handlerChange(event) {
            if(event.target.id == 1) {
                $('.js-remove:first').removeClass('remove');
                    // .siblings().addClass('remove');
                $('.js-remove:last').addClass('remove');
            }
            else {  
                $('.js-remove:first').addClass('remove');
                    // .siblings().addClass('remove');
                $('.js-remove:last').removeClass('remove');
            }
        }

        document.querySelectorAll("input[type='radio']").forEach((input) => {
            input.addEventListener('change', handlerChange);
        });
    </script>
</body>
</html>