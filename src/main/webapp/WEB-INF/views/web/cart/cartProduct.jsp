<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<c:url var = "apiDeleteProduct" value = "/api/cart" />
<c:url var = "apiGetListProduct" value = "/api/cart" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
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
				<hr class="soften" />

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

				<a href="<c:url value = '/danh-sach-san-pham'/>" class="shopBtn btn-large"><span
					class="icon-arrow-left"></span> Tiếp tục mua </a> <a
					href="#" class="shopBtn btn-large pull-right">Thanh toán <span
					class="icon-arrow-right"></span></a>

			</div>
		</div>
	</div>

	<script>
			var userId = $('.js-infor').data('user_id');
			// lấy danh sách sản phẩm trong giỏ hàng
				$.ajax({
					type: "GET",
					url: "${apiGetListProduct}?userId=" + userId,
					dataType: "Json",
					contentType: "application/json; charset=utf-8",
					success: function(data) {
						var html = '';
						var totalItem = 0;
						var TotalPrice = 0;
						$.each($(data), function(i, item) {
							html += '<tr>';
								/* src="<c:url value = '/template/web/images/sliders/${item.img }' />" */
								html += '<td><img width="100px" src="' + "<c:url value = '/template/web/images/products/" + item.product.img + "' />" + ' " alt = "ảnh sản phẩm" > </td>'; // ảnh
								html += '<td>' + item.product.name_product + '</td>'; // ten
								html += '<td>'+ item.product.size + '</td>'; // kich thước
								html += '<td>' + item.product.lo_ren + '</td>'; // lỗ ren
								html += '<td>' + item.product.shape + '</td>';
								html += '<td>' + item.product.price + '</td>'; // giá 1 sản phẩm
								html += '<td>';
								html +=    '<input type="number" class="span1" min = 0 style="max-width: 64px;padding-left: 7px;border-left-width: 86.6; border-left: 1px solid;" value = ' + item.quantity + '>';
								html += '</td>';

								html += '<td>' + item.total + '</td>'; // thành tiền
								html += '<td data-productid =' + item.id + ' class = "productId js-delete-product"> <button id="delete-btn" onclick = "deleteProduct(' + item.id + ')">btn</button></td>'
								// <i class="fa fa-trash" aria-hidden="true" style = "padding-left: 23px; display: block;"></i>
							html += '</tr>';
							totalItem += item.quantity;
							TotalPrice += item.total;
							// console.log(html)
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
						}
						$('.js-render').html(html);
						$('.js-quantity').html(data.length + ' Sản phẩm')
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
							url: "${apiDeleteProduct}?cartItemId=" + productId,
							success: function(){
								alert("Cập nhật giò hàng thành công")
								window.location.href = "/gio-hang/danh-sach";
							},
							error: function() {
								alert("Lỗi rồi !!")
							}
						})
					}
				}
	</script>
</body>