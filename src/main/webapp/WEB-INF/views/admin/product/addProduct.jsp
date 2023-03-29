<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm sản phẩm</title>
</head>
<body>
	<div class="form-horizontal">
		<fieldset>

			<!-- Form Name -->
			<h1 style="text-align: center;">Thêm sản phẩm</h1>

			<!-- Name product -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="name">Tên Sản phẩm: </label>
				<div class="col-md-4">
					<input id="name" name="name"
						placeholder="Tên Sản Phẩm" class="form-control"
						required="" type="text">
				</div>
			</div>

			<!-- price product-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="price">Giá: </label>
				<div class="col-md-4">
					<input id="price" name="price"
                        min="0"
						placeholder="Giá Sản phẩm" class="form-control"
						required="" type="number">

				</div>
			</div>

            <!-- size product -->
            <div class="form-group">
				<label class="col-md-4 control-label" for="size">Kích thước sản phẩm: </label>
				<div class="col-md-4">
					<input id="size" name="size"
						placeholder="Kích thước" class="form-control"
						required="" type="text">

				</div>
			</div>

			<!-- type product -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="type">Kiểu dáng sản phẩm: </label>
				<div class="col-md-4">
					<select id="type" name="type" class="form-control">
					</select>
				</div>
			</div>

            <!-- cattegory product -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="category">Thể loại sản phẩm: </label>
				<div class="col-md-4">
					<select id="category" name="type" class="form-control">
					</select>
				</div>
			</div>

            <!-- File Button -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="filebutton">Ảnh sản phẩm: </label>
                <div class="col-md-4" style="padding: 9px 12px;">
                    <input id="file" name="file" class="input-file" type="file">
                </div>
            </div>

            <!-- Button -->
            <div class="form-group" style=" text-align: center;">
                <div class="col-md-4" style=" width: 100%;">
                    <button id="save" name="singlebutton" class="btn btn-primary" style=" margin-right: 28px;  width: 75.21px;" onclick="addProduct()">Lưu</button>
                    <button id="cancel" name="singlebutton" class="btn btn-primary" onclick="cancel()">Hủy bỏ</button>
                </div>
            </div>
					
		</fieldset>
	</div>

    <script>
        var categories = JSON.parse(localStorage.getItem("categories"));
        var types = JSON.parse(localStorage.getItem("types"));

        $(function() {
            optionCategory();
            optionType();
        })

        // render option category 
		function optionCategory() {
			var html = '<option value="null">---Thể loại sản phẩm---</option>';
			$.each($(categories), function(i, item) {
				html += '<option value="' + item.id + '">' + item.name + '</' + 'option>';
			})
			$("#category").html(html);
		}

		// render option type
		function optionType() {
			var html = '<option value="null">---Kiểu dáng sản phẩm---</option>';
			$.each($(types), function(i, item) {
				html += '<option value="' + item.id + '">' + item.loRen + ", " + item.shape + '</' + 'option>';
			})
			$("#type").html(html);
		}

        function addProduct() {
            var name = $('#name').val();
            var size = $('#size').val();
            var price = $('#price').val();
            var type = $('#type').val();
            var category = $('#category').val();
            var img = $('#file').val();
            img = img.substr(img.lastIndexOf("\\")+1, img.length);
            var product = {
                "name": name,
                "size": size,
                "price" : price,
                "thumbnail": img,
                "type": {
                    "id": type 
                },
                "category": {
                    "id": category
                }
            }
            console.log(product);
            add(product);
        }

        function add(data) {
            $.ajax({
                url: "/api/admin/product",
                type: "POST",
                dataType: "JSON",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function(res, status) {
                    alert("Thêm sản phẩm thành công");
                    window.location.href = "/admin/product/list?page=1&limit=3";
                },
                error: function() {
                    alert("Thêm sản phẩm lỗi rồi !!");
                }
            })
        }

        function cancel() {
            window.location.href = "/admin/product/list?page=1&limit=3";
        }

    </script>
</body>
</html>