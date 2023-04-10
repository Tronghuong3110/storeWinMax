<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<c:url var="urlAddProduct" value="/api/cart" />
<c:url var = "apiProduct" value = "/api/cart" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<style>
	.btn-delete:hover {
		background-color: #000;
		color: #fff;
		cursor: pointer;
		/* border: 2px #000 inherit; */
	}

	._8BP9GU{
		width: 50px;
		height: 32px;
		border-left: 0;
		border-right: 0;
		font-size: 16px;
		font-weight: 400;
		box-sizing: border-box;
		text-align: center;
		cursor: text;
		border-radius: 0;
		-webkit-appearance: none;
	}

	.mJX7hG{
		outline: none;
		cursor: pointer;
		border: 0;
		font-size: .875rem;
		font-weight: 300;
		line-height: 1;
		letter-spacing: 0;
		display: flex;
		align-items: center;
		justify-content: center;
		transition: background-color .1s cubic-bezier(.4,0,.6,1);
		border: 1px solid rgba(0,0,0,.09);
		border-radius: 2px;
		background: transparent;
		color: rgba(0,0,0,.8);
		width: 32px;
		height: 32px;
	}

	.cart-quantity{
		display: flex;
		width: 11%;
		align-items: center;
	}
	.input-cart-quantity{
		display: flex;
	}
</style>
</head>
<body>
	<!-- Body Section -->
	<div class="row" style="margin-left: 10%; min-height: 500px;">
		<div class="span12">
			<ul class="breadcrumb" style="margin-top: 24px;">
				<li><a href="<c:url value = '/trang-chu'/>">Trang chủ</a> <span class="divider">/</span></li>
				<li class="active">Giỏ hàng</li>
			</ul>
			<div class="well well-small" style="margin-bottom: 32px;">
				<h1>
					Giỏ hàng <small class="pull-right js-quantity"></small>
				</h1>
				<hr class="soften"/>

				<table class="table table-bordered table-condensed " style="margin-left: auto; margin-right: auto;">
					<thead>
						<tr>
							<th>Hình ảnh</th>
							<th>Tên Sản Phẩm</th>
							<th>Kích Thước</th>
							<th>Lỗ Ren</th>
							<th>Hình Dạng</th>
							<th>Đơn Giá</th>
							<th>Số Lượng</th>
							<th>Thành Tiền</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody class="js-render">
						
					</tbody>
				</table>

				<div class="row" style="display: flex; justify-content: end; padding: 0 15px;">
					<button class="btn btn-primary" style="margin-right: 6px;"><a href="<c:url value = '/danh-sach-san-pham'/>" style="color: #fff;"><span
						class="icon-arrow-left"></span> Xem thêm sản phẩm</a> 
					</button>
					<button class="btn btn-primary btn-payment"><a href="<c:url value = '/thanh-toan'/>" class="pull-right" style="color: #fff;">Thanh toán <span
							class="icon-arrow-right"></span></a>
					</button>
				</div>
			</div>
		</div>
		<input type="hidden" value="" class="cartId">
	</div>

	<script>
		var userId = $('.js-infor').data('user_id');
		// lấy danh sách sản phẩm trong giỏ hàng
		var totalItem = 0;
		var TotalPrice = 0;
		$.ajax({
			type: "GET",
			url: "${apiProduct}?status=0",
			dataType: "Json",
			contentType: "application/json; charset=utf-8",
			success: function(data) {
				localStorage.setItem("listProductOfCart", JSON.stringify(data))
				// console.log(data)
				var html = '';
				$.each($(data[0].values), function(i, item) {
					html += '<tr>';
						html += '<td><img width="100px" src="' + "<c:url value = '/template/web/images/products/" + item.product.type.img + "' />" + ' " alt = "ảnh sản phẩm" > </td>'  // ảnh
						html += '<td>' + item.product.name + '</td>' // ten
						html += '<td>'+ item.product.size + '</td>' // kich thước
						html += '<td>' + item.product.type.loRen + '</td>' // lỗ ren
						html += '<td>' + item.product.type.shape + '</td>'
						html += '<td> ₫' + item.product.price + '</td>'; // giá 1 sản phẩm
						html += '<td>';
						// html +=    '<input type="number" class="span1" min = 0 style="max-width: 64px;padding-left: 7px;border-left-width: 86.6; border-left: 1px solid;" value = ' + item.quantity + '>';
						html += 	'<div class="cart-quantity">'
						html += 		'<div class="input-cart-quantity">'
						html += 			'<button class="mJX7hG btn-minus">'
						html += 				'<i class="fa-solid fa-minus"></i>'
						html += 			'</button>'	
						html += 			'<input class="mJX7hG _8BP9GU quantity" data-id =' + item.id + ' type="text" role="spinbutton" aria-valuenow="9" value="' + item.quantity +'">'
						html += 			'<button class="mJX7hG btn-plus">'
						html += 				'<i class="fa-solid fa-plus"></i>'
						html += 			'</button>'
						html += 		'</div>'
						html += 	'</div>'
						html += '</td>'
						html += '<td>' + item.total + '</td>' // thành tiền
						html += '<td data-productid =' + item.id + ' class = "productId"> <button class = "btn btn-delete" onclick = "deleteProduct(' + item.id + ')">Xóa</button></td>'
					html += '</tr>';
					totalItem += item.quantity;
					TotalPrice += item.total;
				})
				if(html == '') {
					html += 'Không có thông tin dữ liệu sản phẩm nào'
				}
				else {
					html += '<tr>';
					html += 	'<td colspan="7" class="alignR">Tổng Sản Phẩm:</td>'
					html += 	'<td>' + totalItem + '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="7" class="alignR">Tổng Tiền:</td>';
					html += '<td>' + TotalPrice + '</td>';
					html += '</tr>';
					$('.cartId').val(data[0].cart_id);
				}
				$('.js-render').html(html);
				$('.js-quantity').html(data[0].values.length + ' Sản phẩm')
			},
			error: function () {
				alert("Lỗi rồi !!")
			}
		})
				
		// xóa sản phẩm ra khỏi giỏ hàng
		function deleteProduct (productId) {
			var check = confirm("Bạn có chắc muốn xóa sản phẩm không ?");
			if(check == true) {
				$.ajax({
					type: "DELETE",
					url: "${apiProduct}?cartItemId=" + productId,
					success: function(){
						alert("Cập nhật giò hàng thành công")
						window.location.href = "/gio-hang/danh-sach";
					},
					error: function() {
						alert("Render hàng lỗi rồi !!")
					}
				})
			}
		}

	</script> 

	<script>
		// btn tăng giảm số lượng
		window.addEventListener("load", test)
		function test() {
			$('.input-cart-quantity').each(function() {
				var input_quantity = $(this).find('input');
				var btn_minus = $(this).find('.btn-minus');
				var btn_plus = $(this).find('.btn-plus');
				var quantity = input_quantity.val();

				btn_minus.click(function() {
					if(quantity > 0) {
						quantity--;
					}
					input_quantity.val(quantity);
					changeQuantity(input_quantity.data("id"), quantity)
				})

				btn_plus.click(function() {
					quantity++;
					input_quantity.val(quantity);
					changeQuantity(input_quantity.data("id"), quantity)
				}) 
				input_quantity.change(function() {
					changeQuantity(input_quantity.data("id"), input_quantity.val())
				})
			})
			
		}

		function changeQuantity(id, quantity) {
			$.ajax({
				type : 'PUT',
				url : "${urlAddProduct}?id=" + id + "&quantity=" + quantity,
				success : function() {
					alert("Cập nhật giỏ hàng thành công")
					window.location.href = '/gio-hang/danh-sach';
				},
				error: function () {
					alert("Cập nhật giỏ hàng thất bại")
				}
			})
			console.log(id, quantity)
		}

	</script>
</body>