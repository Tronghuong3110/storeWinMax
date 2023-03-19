<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:url var = "apiDetailProduct" value = "/api/admin/product/detail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa sản phẩm</title>
<style>
	input{
		font-size: 20px;
	}
</style>
</head>
<body>

	<!-- edit form column -->
	<div class="col-md-9 personal-info">
		<h3 class = "title-header">Chỉnh sửa sản phẩm</h3>
		<div class="form-horizontal">
			<div class="form-group">
				<label class="col-lg-3 control-label">Tên sản phẩm: </label>
				<div class="col-lg-8">
					<input class="form-control name-product" type="text" placeholder="Tên sản phẩm">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">Kích thước sản phẩm: </label>
				<div class="col-lg-8">
					<input class="form-control size-product" type="text" placeholder="Kích thước">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Giá: </label>
				<div class="col-md-8">
					<input class="form-control price-product" type="number" placeholder="Giá">
				</div>
			</div>
			
			<!-- Type product -->
			<div class="form-group">
				<label class="col-lg-3 control-label">Hình dạng, lỗ ren: </label>
				<div class="col-lg-8">
					<!-- class="form-control loRen-product" -->
					<select name="type" id="type" class="form-control">
					</select>
				</div>
			</div>

			<!-- Category Product -->
			<div class="form-group">
				<label class="col-lg-3 control-label">Thể loại sản phẩm: </label>
				<div class="col-lg-8">
					<!-- class="form-control shape-product" -->
					<select name="category" id="category" class="form-control">
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-md-3 control-label"></label>
				<div class="col-md-8">
					<!-- <input type="button" class="btn btn-primary" value="Save Changes"> -->
					<button class="btn btn-primary btn-save"> Lưu thay đổi </button>
					<span></span> 
					<!-- <input type="reset" class="btn btn-default" value="Cancel"> -->
					<button type="button" class="btn btn-default btn-cancel">Hủy bỏ</button>
				</div>
			</div>
		</div>
	</div>
	<hr>

	<script>
		var categories = JSON.parse(localStorage.getItem("categories"));
		var types = JSON.parse(localStorage.getItem("types"));

		const urlParams = new URLSearchParams(window.location.search);
		const productId = urlParams.get('productid');
		$.ajax({
			type: "GET",
			url: "${apiDetailProduct}?productId=" + productId,
			contentType: "application/json; charset=UTF-8",
			dataType: "json",
			success: function(data) {
				$(".name-product").val(data.name);
				$(".size-product").val(data.size);
				$(".price-product").val(data.price);
				optionCategory(data.category);
				optionType(data.type);
				// console.log(data.type.id)
			},
			error: function() {
				alert("Loi set value roi");
			}
		})

		// render option category 
		function optionCategory(category) {
			var html = '<option value="' + category.id + '">' + category.name + '</' + 'option>';
			$.each($(categories), function(i, item) {
				if(item.id != category.id) {
					html += '<option value="' + item.id + '">' + item.name + '</' + 'option>';
				}
			})
			$("#category").html(html);
		}

		// render option type
		function optionType(type) {
			var html = '<option value="' + type.id + '">' + type.loRen + ", " + type.shape + '</' + 'option>';
			$.each($(types), function(i, item) {
				if(item.id != type.id) {
					html += '<option value="' + item.id + '">' + item.loRen + ", " + item.shape + '</' + 'option>';
				}
			})
			$("#type").html(html);
		}

		// update product
		function updateProduct(data, categoryId, typeId) {
			$.ajax({
				type: 'PUT',
				url: "${apiDetailProduct}?categoryId=" + categoryId + "&typeId=" + typeId,
				contentType: "application/json",
				data: JSON.stringify(data),
				success: function(result, status) {
					alert("Cập nhật sản phẩm thành công");
					window.location.href = "/admin/product/list?page=1&limit=3";
				},
				error: function() {
					alert("Cập nhật giỏ hàng không thành công");
					window.location.href = "/admin/product/edit?productid=" + productId;
				}
			})
		}

		$('.btn-save').click(function() {
			data = {
				"id": productId,
				"name": $(".name-product").val(),
				"price": $(".price-product").val(),
				"size": $(".size-product").val()
			}
			var check = confirm("Bạn có muốn thay đổi thông tin sản phẩm này ?");
			var categoryId = $("#category").children("option:selected").val();
			var typeId = $("#type").children("option:selected").val();
			if(check) {
				updateProduct(data, categoryId, typeId);
			}
			// test();
		})

		$('.btn-cancel').click(function() {
			window.location.href = "/admin/product/list?page=1&limit=3";
		})

		// function test() {
		// 	var selectedCountry = $("#type").children("option:selected").val();
		// 	console.log(selectedCountry);
		// }
	</script>
</body>
</html>