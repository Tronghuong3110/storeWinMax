
<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Chi tiết hóa đơn</title>
<style>
.--red {
	color: red;
}

.text-center {
	text-align: center;
}

.box-shadow {
	box-shadow: 0 0 7px 0 rgba(0, 0, 0, .13);
}

.form {
	padding: 23px 14px;
	margin: 31px 0;
}

input {
	padding: 12px;
	font-size: 2rem;
}

.width {
	width: 100%;
}

.text * {
	font-size: 2.2rem;
}
.item {
	text-align: center;
    font-size: 2rem;
}
.btn-comeback {
	float: right;
    width: 154px;
    padding: 10px 0;
}
</style>
</head>
<body>
	<div class="main-content">
		<!-- <form action="<c:url value='/admin/product/list'/>" id="formSubmit" method="get"> -->

		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a
						href="/admin-home">Trang chủ</a></li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<div class="widget-box table-filter">
							<div class="table-btn-controls">
								<div class="pull-right tableTools-container" style="height: 37px;">
									<div class="dt-buttons btn-overlap btn-group">

									</div>
								</div>
							</div>
						</div>
						<h1 class="text-center --red" style="margin-top: 35px;">Thông tin chi tiết đơn hàng:
							E7EA040C0A3</h1>
						<hr>
						<h2>Thông tin người nhận hàng</h2>
						<div class="row box-shadow form text js-infor-people">
							<!-- Thông tin người -->
						</div>

						<h2 style="margin-bottom: 31px;">Danh sách sản phẩm</h2>
						<table class="table table-bordered table-condensed"
							style="margin-left: auto; margin-right: auto;">
							<thead> 
								<tr>
									<th class="item">Tên Sản Phẩm</th>
									<th class="item">Kích Thước</th>
									<th class="item">Lỗ Ren</th>
									<th class="item">Hình Dạng</th>
									<th class="item">Đơn Giá</th>
									<th class="item">Số Lượng</th>
								</tr>
							</thead>
							<tbody class="js-tbody">
								<!-- Thông tin sản phẩm -->
							</tbody> 
						</table>
					</div>

				</div>
				<a href="<c:url value = '/admin/list/bill' />" style="text-decoration: none; font-size: 1.7rem; color: #fff;"><button class="btn btn-primary btn-comeback">Trở về</button></a>
			</div>
		</div>
	</div>
	<!-- </form> -->
	<!-- /.main-content -->

	<script>
		var id = localStorage.getItem("idBill")
		$.ajax({
			url: "/api/admin/" + id,
			type: "GET",
			data: "JSON",
			contentType: "application/json; charset = UTF-8",
			success: function(data) {
				$('.js-infor-people').html(setText(data))
				$('.js-tbody').html(listProduct(data))
				console.log(listProduct(data))
			},
			error: function() {
				alert("Lỗi set tex rồi!!")
			}
		})

		function setText(data) {
			var html = '<div class="row">'
			html +=			'<div class="col-lg-3">'
			html +=				'<label for="">Tên người nhận: </label>'
			html +=				'<input type="text" name="nameReceiver" value="' + data.name.nameReceiver + '" disabled>'
			html +=				'<label for="">Số điện thoại người nhận: </label> '
			html +=				'<input type="text" name="phoneReceiver" value="' + data.name.phoneReceiver + '" disabled>'
			html +=			'</div>'

			html +=			'<div class="col-lg-3">'
			html += 			'<label for="">Tên người nhận: </label>'
			html +=				'<input type="text" name="nameReceiver" value="' + data.name.nameBuyer + '" disabled>'
			html +=				'<label for="">Số điện thoại người nhận: </label> '
			html +=				'<input type="text" name="phoneReceiver" value="' + data.name.phoneBuyer + '" disabled>'
			html +=			'</div>'

			html +=			'<div class="col-lg-3">'
			html +=				'<label for="">Ngày đặt hàng: </label> '
			html +=				'<input type="date" name="date" value="' + data.date + '" disabled>'
			html +=			'</div>'

			html +=			'<div class="col-lg-3">'
			html +=				'<label for="">Tổng tiền: </label>'
			html +=				'<input type="text" name="total" value="' + data.name.total + 'đ" disabled>'
			html +=			'</div>'
			html += 	'</div>'
			html += 	'<div class="row" style="margin-top: 26px;">'
			html +=			'<div class="col-lg-8">'
			html +=				'<label for="">Địa chỉ người nhận: </label> <br> '
			html +=				'<input type="text" name="address" value="' + data.name.village + ' - ' + data.name.commune + ' - ' + data.name.district + ' - ' + data.name.conscious + '" disabled class="width" />'
			html +=			'</div>'
			html +=		'</div>'
			return html;
		}

		function listProduct(data) {
			var html = ''
			$.each($(data.values), function(i, item) {
				html += '<tr class="item">'
				html += 	'<td>' + item.product.name + '</td>'
				html += 	'<td>' + item.product.size + '</td>'
				html += 	'<td>' + item.product.type.loRen + '</td>'
				html += 	'<td>' + item.product.type.shape + '</td>'
				html += 	'<td>' + item.product.price + '</td>'
				html += 	'<td>' + item.quantity + '</td>'
				html += '</tr>'
			})
			if(html == '') {
				html = '<h1>Không có sản phẩm nào</h1>'
			}
			return html;
		}
	</script>
</body>
</html>