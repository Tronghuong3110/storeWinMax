<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Danh sách hóa đơn</title>
    <style>
        .item{
            text-align: center;
            font-size: 24px;
        }
    </style>
</head>
<body>
	<div class="main-content">
		<!-- <form action="<c:url value='/admin/product/list'/>" id="formSubmit" method="get"> -->

			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="/admin-home">Trang
								chủ</a></li>
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

											<!-- search -->
											<div class="input-group"  style="
														transform: translateX(-348%);
														display: flex;
														margin-top: 5px; ">
												<div class="form-outline">
												  <input type="search" id="form1" class="form-control" placeholder="search..." style="width: 255px;"/>
												</div>
												<button type="button" class="btn btn-primary">
												  <i class="fas fa-search"></i>
												</button>
											</div>

										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th class = "item">ID</th>
													<th class = "item">Mã đơn hàng</th>
													<th class = "item">Trạng thái</th>
                                                    <th class = "item">Tổng tiền</th>
                                                    <th class = "item">Ngày đặt</th>
													<th class = "item">Số tiền còn lại</th>
													<th class = "item">Thao tác</th>
												</tr>
											</thead>
											<tbody id="js-tbody">
                                                
											</tbody>
										</table>
										<ul class="pagination" id="pagination" style="display: flex; justify-content: center;"></ul>
										<input type="hidden" value="" id="page" name="page"/>
										<input type="hidden" value="" id="limit" name="limit"/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- </form> -->
	</div>
	<!-- /.main-content -->
<script type="text/javascript">
    $(function () {
    	var totalPage = 10;
    	var currentPage = 1;
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if(page != currentPage) {
                	
                }
            }
        }).on('page', function (event, page) {
            console.info(page + ' (from event listening)');
        });
    });

	$.ajax({
        url: "/api/admin/listPayment",
        type: "GET",
        contentType: "application/json; charset=utf-8",
        success: function(data) {
            html = '';
            $.each(data, function(index, value) {
				var status = '';
                html += '<tr>';
                html +=     '<td class = "item">' + value.id + '</td>';
                html +=     '<td class = "item">' + value.code + '</td>';
                html +=     '<td class = "item">' + value.mess + '</td>';
				html +=     '<td class = "item">' + value.total_payment + '</td>';
				html +=     '<td class = "item">' + parseDMY(value.date) + '</td>';
				html +=     '<td class = "item">' + value.unpaid_amount + '</td>';
				html += 	'<td data-bill =' + value.id + ' class = "item" style = "display: flex; justify-content: space-evenly;"> ' + 
								'<button class = "btn btn-primary">Xem chi tiết</button>' +
								'<button class = "btn btn-primary">Xác nhận thanh toán</button>' +
							'</td>'
                html += '</tr>';
            }) 
            $('#js-tbody').html(html);
        },
        error: function() {
            alert("Lỗi get danh sách bill rồi")
        }
    })

	const parseDMY = s => {
            let [y, m, d] = s.split('-');
           return d + '-' + m + '-' + y;
        };
</script>
</body>
</html>