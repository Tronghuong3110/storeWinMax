<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm thể loại</title>
<style>
	.inp{
		width: 350px;
    	height: 52px;
		font-size: 18px;
	}

	.text{
		font-size: 25px;
	}
</style>
</head>
<body>
<div class="form-horizontal">
	<fieldset>

		<!-- Form Name -->
		<legend style="text-align: center; font-size: 50px;">Thêm thể loại</legend>
	
		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label text" for="product_name">Name: </label>
			<div class="col-md-4">
				<input id="name" name="Name" placeholder="Name" class="form-control input-md inp" required="true" type="text" maxlength="150"/>
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label text" for="product_name_fr">Code: </label>
			<div class="col-md-4">
				<input id="code" name="code" placeholder="code(coc-o....)" class="form-control input-md inp" required="true" type="text" maxlength="150"/>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-4">
				<button id="btn" name="singlebutton" class="btn btn-primary" style=" margin-left: 105%; width: 100px;" onclick="addCategory()">Lưu</button>
			</div>
			<div class="col-md-4">
				<button id="btn" name="singlebutton" class="btn btn-primary" style=" margin-left: 58%; width: 100px;" onclick="cancel()">Hủy</button>
			</div>
		</div>

	</fieldset>
</div>

<script>
	function addCategory() {
		var name = $("#name").val();
		var code = $('#code').val();

		var category = {
			"name": name,
			"code": code
		}

		$.ajax({
			url: "/api/admin/category",
			type: "POST",
			data: JSON.stringify(category),
			dataType: "JSON",
			contentType: "application/json",
			success: function(data) {
				alert("Thêm thành công")
				window.location.href = "/admin/categrory";
			},
			error: function(data, message, status) {
				// console.log(data)
				// console.log(message)
				// console.log(status)
				alert("Thêm category lỗi rồi !!")
			}
		})
	}
	function cancel() {
		window.location.href = "/admin/categrory";
	}
</script>
</body>
</html>