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
<script src="<c:url value = '/template/data/data.json' />"></script>
<!-- <link rel="stylesheet" href="<c:url value = '/template/data/data.json' />"> -->
</head>
<body>
	<div class="row" style = "margin-top: 14px; justify-content: center;">
		<h1>Thanh Toán</h1>
		<hr class="soften"/>
	</div>
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
							<input type="text" name="nameBuyer" placeholder="Họ và tên"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='Họ và tên'" required class="input">
								
							<input type="text" name="emailBuyer" placeholder="Email"
								onfocus="this.placeholder=''" onblur="this.placeholder='Email'"
								required class="input"> 

							<input type="text"
								name="phoneBuyer" placeholder="Số điện thoại"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='Số điện thoại'" required class="input">
						</form>
					</div>
					<div class="col-lg-6 ">
						<h3>Người nhận hàng</h3>
						<hr>
						<form class="infor-customer-receive">
							<input type="text" name="nameReceiver" placeholder="Họ và tên"
								onfocus="this.placeholder=''" id="nameBuyer"
								onblur="this.placeholder='Họ và tên'" required class="input">

							<input type="text" name="phoneReceiver" placeholder="Số điện thoại"
								onfocus="this.placeholder=''" id="phoneBuyer"
								onblur="this.placeholder='Số điện thoại'" required class="input">

							<a href="#" class="copy-infor"><i class="fa-solid fa-copy"></i>
								Sử dụng thông tin người mua</a>
						</form>
					</div>
				</div>
				<div class="row infor-address">
					<div class="col-lg-6">
						<input type="text" name="village" placeholder="Số nhà/thôn"
							onfocus="this.placeholder = ''" id="village"
							onblur="this.placeholder='Số nhà / Thôn'" required class="input">
						<div class="address">
						
							<!-- Danh sách tỉnh thành -->
							<select name="conscious" id="conscious" class="select-address">
								<option value="null">--- Chọn tỉnh/Thành ---</option>
							</select>
						</div>
						<div class="address">
						
						<!-- Danh sách quận, huyện -->
							<select name="district" id="district" class="select-address">
								<option value="null">--- Chọn quận/huyện ---</option>
							</select>
						</div>
						<div class="address">
						
						<!-- Danh sách xã, phường -->
							<select name="commune" id="commune" class="select-address">
								<option value="null">--- Chọn xã/phường ---</option>
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
						style="width: 21px;" value="1"> 
						<label
							style="display: flex; margin-left: 8px;">
							<div class="payment-img">
								<img
									src="	https://laptrinhjavawebshop.com/assets/images/payment/2022/thanh-toan-chuyen-kh.png"
									alt="ảnh minh họa thanh toán" class="img-exam">
							</div> <span style="font-size: 1.5rem; font-weight: 500;" class="payment-1">Thanh toán chuyển khoản</span>
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
					<small class="id_payment text-weight-700" style="padding: 0 15px; font-size: 24px;" ></small>
				</div>
				<div class="clear"></div>

				<div class="title-payment">
					<input type="radio" name="method-payment" id="2"
						style="width: 21px;" value="2"> <label
						style="display: flex; margin-left: 8px;">
						<div class="payment-img">
							<img
								src="http://f.imgs.vietnamnet.vn/2017/10/30/18/20171030181243-menh-gia-tien-viet-nam.jpg"
								alt="ảnh minh họa thanh toán" class="img-exam">
						</div> <span style="font-size: 1.5rem; font-weight: 500;" class="payment-2">Thanh toán khi nhận hàng</span>
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
				<a href="<c:url value = '/gio-hang/danh-sach' />"><button type="button" class="btn btn-light">Sửa</button></a>
			</div>

			<!-- Danh sach san pham trong gio hang + total + button -->
			<div class="list-item box-shadow">
				
			</div>
		</div>
	</div>
	
	<script>
		var object = {};
        function handlerChange(event) {
			var method = ".payment-" + event.target.id; 
            if(event.target.id == 1) {
				$.ajax({
					url: "/api/payment/code",
					type: "POST",
					contentType: "application/json",
					dataType: "TEXT",
					success: function(data) {
						var paymentCode = "Mã đơn hàng của bạn: " + data;
						$('.id_payment').text(paymentCode);
						$('.id_payment').data('code', data);
					},
					error: function() {
						alert("Tao ma loi roi")
					}
				})
                $('.js-remove:first').removeClass('remove');
                $('.js-remove:last').addClass('remove');
            }
            else {  
                $('.js-remove:first').addClass('remove');
                $('.js-remove:last').removeClass('remove');
            }
			object["methodPayment"] = $(method).text();
        }

        document.querySelectorAll("input[type='radio']").forEach((input) => {
            input.addEventListener('change', handlerChange);
        });


		$(function() {
			var listProduct = JSON.parse(localStorage.getItem("listProductOfCart"));
			var html = '';
			var total = 0;
			$.each($(listProduct[0].values), function(i, item) {
				html += '<div class="item">';
				html += 	'<div class="item-infor-img">';
				html += 		'<img src="' + "<c:url value = '/template/web/images/products/" + item.product.type.img + "' />" + '" alt = "ảnh sản phẩm" class="item-img" >';
				html += 	'</div>';
				html += 	'<div class="item-infor-name">';
				html += 		'<p>' + item.product.name + '</p>';
				html += 		'<p>' + item.product.size + '</p>';
				html += 		'<p>' + item.product.type.loRen + '</p>';
				html += 		'<p>' + item.product.type.shape + '</p>';
				html += 	'</div>';
				html += 	'<div class="item-infor-quantity">';
				html += 		'<p class="font-weight-500 text">' + item.quantity + 'x</p>';
				html += 	'</div>';
				html += 	'<div class="item-infor-price">';
				html +=			'<p class="font-weight-500 text">' + item.product.price + 'đ</p>';
				html += 	'</div>';
				html += '</div>';
				html += '<hr>';
				total += item.product.price * item.quantity;
			})
			
			html += '<div class="total-price">';
			html += 	'<span class="title font-weight-500" style="font-size: 28px;">Thành' + 
						'tiền</span> <span class="font-weight-500 text total" data-total="' + total + '">' + total +
						'đ</span>';
			html += '</div>';
			html += '<textarea class="form-control" rows="3" name="note_customer"' +
					'placeholder="Ghi chú" style="margin-top: 16px; border: 1px solid;"></textarea>';
			html += '<div class="btn-payment">';
			html += 	'<button type="submit" class="btn btn-success payment-submit" onclick = "payment()">Thanh toán</button>';
			html += '</div>';
			if(total === 0) {
				var href = '<a href = "' + "<c:url value = '/danh-sach-san-pham'/>" + '" style = "color: red;" >Tại Đây' + '</a>';
				var html = "<h1> Bạn chưa có sản phẩm để thanh toán, vui lòng chọn sản phẩm " + href + "</h1>";
				$(':input').prop("disabled", true)
			}
			$('.list-item').html(html);
			
		})

		// liet ke danh sach tỉnh, huyện, xã
		$(function () {
			apiProvince=(prodvince)=>{
				let district;
				var htmlConscious = '<option value="null">--- Chọn tỉnh/Thành ---</option>';
				var htmlDistricts = '<option value="null">--- Chọn quận/huyện ---</option>';
				var commune = '<option value="null">--- Chọn xã/phường ---</option>';

				// danh sach tỉnh
				prodvince.forEach(element => { 
					htmlConscious += '<option value="' + element.name + '">' + element.name + '</option>';
				});
				$('#conscious').html(htmlConscious);

				// danh sách quận, huyện
				$('#conscious').change(function () {
					let value = $(this).val();
					$.each(prodvince,function(index,element){
						if (element.name == value) {
							district = element.districts;
							$.each(element.districts,function(index,element1){
								htmlDistricts += '<option value="' + element1.name + '">' + element1.name + '</option>';
							})
						}
					})
					$('#district').html(htmlDistricts);         
				}); 
				
				// danh sách xã, phường
				$('#district').change(function () {
					let value = $(this).val();
					$.each(district,function(index,element){
						if (element.name == value) {
							element.wards.forEach(element1 => {
								commune += '<option value="' + element1.name + '">' + element1.name + '</option>';
							});
						}
					})  
					$('#commune').html(commune);     
				});
			}
			prodvince = JSON.parse(data);
			apiProvince(prodvince);
		})

		// infor-customer-buy
		function getInforCustomBuy() {
			var inforCustomBuy = [];
			$(".infor-customer-buy input").each(function() {
				object[$(this).attr("name")] = $(this).val();
			})
		}

		// infor-customer-receive
		function getInForCustomReceive() {
			var inforCustomReceive = [];
			$('.infor-customer-receive input').each(function() {
				object[$(this).attr("name")] = $(this).val();
			})
		}

		// copy infor from buyer to receive
		$('.copy-infor').click(function() {
			getInforCustomBuy();
			$('.infor-customer-receive input').each(function() {
				$(this).val(object[$(this).attr("id")]);
			})
		})

		// get infor address infor-address
		function getAddress() {
			$('.infor-address select').each(function() {
				object[$(this).attr("name")] = $(this).val();
			})
		}

		// payment
		function payment() {
			getAddress();
			getInforCustomBuy();
			getInForCustomReceive();
			object[$("#village").attr("name")] = $("#village").val();
			object["total"] = $(".total").data("total");
			$.ajax({
				url: "/api/payment?code=" + $('.id_payment').data('code'),
				type: "POST",
				contentType: "application/json",
				data: JSON.stringify(object),
				dataType: "JSON",
				success: function(data) {
					alert("Đạt hàng thành công")
					window.location.href = "/don-hang"
				},
				error: function() {
					alert("Thanh toán lỗi rồi")
				}
			})
			// console.log(object)
		}
		
    </script>
</body>
</html>