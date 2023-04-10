<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<c:url var = "apiGetListProduct" value = "/api/cart" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hóa đơn</title>
</head>
<body>
    <div class="row" style="margin-left: 10%; min-height: 500px;">
		<div class="span12">
			<ul class="breadcrumb" style="margin-top: 24px;">
				<li><a href="<c:url value = '/trang-chu'/>">Trang chủ</a> <span class="divider">/</span></li>
				<li class="active">Hóa đơn</li>
			</ul>
			<div class="well well-small" style="margin-bottom: 32px;">
				<h1>
					Danh sách đơn hàng của bạn
				</h1>
				<hr class="soften"/>

				<div class="container-table">

                </div>

			</div>
		</div>
		<input type="hidden" value="" class="cartId" >
        
	</div>

    <script>
        var totalItem = 0;
		var TotalPrice = 0;
        var html = '';
        // console.log(data)
        $.ajax({
			type: "GET",
			url: "${apiGetListProduct}?status=1",
			dataType: "Json",
			contentType: "application/json; charset=utf-8",
			success: function(datas) {
                $.each($(datas), function(i, data) {
                    html += "<h2 style = 'margin-top: 15px; color: red;'>Mã đơn hàng: " + data.name + '<small class="pull-right js-quantity">Ngày đặt: <input type="date" value="' +  data.date + '" disabled></small> </h2>'
                    html += '<table class="table table-bordered table-condensed " style="margin-left: auto; margin-right: auto;">'
                    html +=     "<thead>"
                    html +=        "<tr>"
                    html +=            "<th>Hình ảnh</th>"
                    html +=            "<th>Tên Sản Phẩm</th>"
                    html +=            "<th>Kích Thước</th>"
                    html +=            "<th>Lỗ Ren</th>"
                    html +=            "<th>Hình Dạng</th>"
                    html +=            "<th>Đơn Giá</th>"
                    html +=            "<th>Số Lượng</th>"
                    html +=            "<th>Thành Tiền</th>"
                    html +=        "</tr>"
                    html +=     "</thead>"
                    html +=     "<tbody>"
					
                    $.each($(data.values), function(i, item) {
                        html += '<tr>';
                            html += '<td><img width="100px" src="' + "<c:url value = '/template/web/images/products/" + item.product.type.img + "' />" + ' " alt = "ảnh sản phẩm" > </td>'  // ảnh
                            html += '<td>' + item.product.name + '</td>' // ten
                            html += '<td>'+ item.product.size + '</td>' // kich thước
                            html += '<td>' + item.product.type.loRen + '</td>' // lỗ ren
                            html += '<td>' + item.product.type.shape + '</td>' // hình dạng
                            html += '<td> ₫' + item.product.price + '</td>'; // Đơn giá
                            html += '<td>';
                            html +=    '<input type="number" class="span1" min = 0 style="max-width: 100px; padding-left: 7px;border-left-width: 86.6; border-left: 1px solid;" value = ' + item.quantity + ' disabled >';
                            html += '</td>'
                            html += '<td>' + item.total + '</td>' // thành tiền
                        html += '</tr>';
                        totalItem += item.quantity;
                        TotalPrice += item.total;
                    })
                    html +=         '<tr>';
                    html += 	        '<td colspan="7" class="alignR">Tổng Sản Phẩm:</td>'
                    html += 	        '<td>' + totalItem + '</td>';
                    html +=         '</tr>';
                    html +=         '<tr>';
                    html +=             '<td colspan="7" class="alignR">Tổng Tiền:</td>';
                    html +=             '<td>' + TotalPrice + '</td>';
                    html +=         '</tr>';
                    html +=         '<tr>';
                    html +=             '<td colspan="7" class="alignR">Số tiền còn lại: </td>';
                    html +=             '<td>' + data.unpaid_amount + '</td>';
                    html +=         '</tr>';
                    html +=         '<tr>';
                    html +=             '<td colspan="7" class="alignR">Trạng Thái: </td>';
                    html +=             '<td>' + data.status + '</td>';
                    html +=         '</tr>';
                    html +=     "</tbody>"
                    html += "</table>"
                    html += "<hr class = 'soften'>"

                    // console.log(d)
                })

                if(html == '') {
                    html = '<h1> Bạn chưa có đơn hàng nào, bạn có thể mua sản phẩm </h1>'
                }
                $(".container-table").html(html);
            },
			error: function () {
				alert("Lỗi rồi !!")
			}
		})

        // const parseDMY = s => {
        //     let [y, m, d] = s.split('-');
        //    return d + '-' + m + '-' + y;
        // };
    </script>

</body>
</html>