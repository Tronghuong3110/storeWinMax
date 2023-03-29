<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm loại mặt hàng</title>
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
		<legend style="text-align: center; font-size: 50px;">Thêm loại mặt hàng</legend>
	
		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label text" for="product_name">Lỗ Ren: </label>
			<div class="col-md-4">
				<input id="loRen" name="loRen" placeholder="Lỗ Ren" class="form-control input-md inp" required="" type="text" maxlength="150"/>
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label text" for="product_name_fr">Hình dạng: </label>
			<div class="col-md-4">
				<input id="shape" name="shape" placeholder="Hình dạng(Bằng, nhọn,...)" class="form-control input-md inp" required="" type="text" maxlength="150"/>
			</div>
		</div>

        <div class="form-group">
			<label class="col-md-4 control-label text" for="product_name_fr">Mã Hình dạng: </label>
			<div class="col-md-4">
				<input id="code" name="code" placeholder="Mã hình dạng(bang, nhon, bang-nhon,...)" class="form-control input-md inp" required="" type="text" maxlength="150"/>
			</div>
		</div>

        <div class="form-group">
            <label class="col-md-4 control-label text" for="filebutton">Hình ảnh: </label>
            <div class="col-md-4">
              <input id="img" name="img" class="input-file" type="file">
            </div>
        </div>

		<div class="form-group">
			<div class="col-md-4" style="display: flex; width: 94%; justify-content: center;">
				<button id="btn" name="singlebutton" class="btn btn-primary" style=" margin-right: 12%; width: 100px;" onclick="addType()">Lưu</button>
				<button id="btn" name="singlebutton" class="btn btn-primary" style=" width: 100px;" onclick="cancel()">Hủy</button>
			</div>
		</div>

	</fieldset>
</div>

<script>
	function addType() {
		var name = $("#loRen").val();
		var shape = $('#shape').val();
		var code = $('#code').val();
		var img = $('#img').val();
		// img = img.substr(img.lastIndexOf("\\")+1, img.length);
		var type = {
			"loRen": name,
			"shape": shape,
			"code": code,
			"img": img
		}
		console.log(type)
		// alert("xin chào")
		add(type);
	}

	function add(data) {
		$.ajax({
			url: "/api/admin/type",
			type: "POST",
			data: JSON.stringify(data),
			dataType: "JSON",
			contentType: "application/json",
			success: function(data) {
				alert("Thêm thành công")
				window.location.href = "/admin/type";
			},
			error: function(data, message, status) {
				alert("Thêm type lỗi rồi !!")
			}
		})
	}

	function cancel() {
		window.location.href = "/admin/type";
	}
</script>
</body>
</html>