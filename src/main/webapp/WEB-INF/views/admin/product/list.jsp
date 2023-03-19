<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
	<div class="main-content">
		<form action="<c:url value='/admin/product/list'/>" id="formSubmit" method="get">

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
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
											<a flag="info"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Thêm bài viết' href='#'> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
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
													<th>ID</th>
													<th>Tên sản phẩm</th>
													<th>Kích thước</th>
													<th>Lỗ ren</th>
													<th>Hình dạng</th>
													<th>Ảnh</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${Products}">
													<tr>
														<td class="tdItem">${item.id }</td>
														<td class="tdItem">${item.name }</td>
														<td class="tdItem">${item.size }</td>
														<td class="tdItem">${item.type.loRen }</td>
														<td class="tdItem">${item.type.shape }</td>
														<td style="width: 374px;"><img
															style="object-fit: cover; width: 100%;"
															src="<c:url value = '/template/web/images/products/${item.type.img}' />"
															alt="Ảnh sản phầm ${item.name}"></td>
														<td style=" display: grid;
																	justify-content: space-around;
																	border: none;
																	transform: translateY(55%);">
															<a class="btn btn-sm btn-primary btn-edit"
																data-toggle="tooltip" title="Chỉnh sửa sản phẩm" href="<c:url value = '/admin/product/edit?productid=${item.id}'/> " style="margin-bottom: 5px;">
																<i class="fa fa-pencil-square-o" aria-hidden="true"></i> 
															</a>

															<button id="btnDelete" type="button"
																	data-productId = ${item.id}
																	class="btn btn-sm btn-primary btn-edit"
																	data-toggle="tooltip" title='Xóa sản phẩm'
																	onclick="deleteProduct(${item.id})">
																	<i class="fa fa-trash-o bigger-110 pink"  style="color: #fff !important;"></i>
															</button>
														</td>
													</tr>
												
												</c:forEach>
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
		</form>
	</div>
	<!-- /.main-content -->
	<script type="text/javascript">
    $(function () {
    	var totalPage = ${page.totalPage};
    	var currentPage = ${page.currentPage};
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if(page != currentPage) {
                	$('#limit').val(3);
					$('#page').val(page); 
                	$('#formSubmit').submit();
                }
            }
        }).on('page', function (event, page) {
            console.info(page + ' (from event listening)');
        });
    });

	// get danh sach category va them vao localStorage
	getData("/api/category", "categories")
	getData("/api/type", "types")

	function getData(url, name) {
		$.ajax({
			type: "GET",
			url: url,
			contentType: "application/json",
			dataType: "json",
			success: function(data) {
				localStorage.setItem(name, JSON.stringify(data));
			},
			error: function() {
				alert("Lỗi set value vào local Strorage roi !!")
			}
		})
	}

	function deleteProduct(productId) {
		$.ajax({
			type: "DELETE",
			url: "/api/admin/product/detail?productId=" + productId,
			success: function() {
				alert("Xóa sản phẩm thành công")
				window.location.href = "/admin/product/list?page=1&limit=3";
			},
			error: function() {
				alert("Xóa sản phẩm không thành công");
				window.location.href = "/admin/product/list?page=1&limit=3";
			}
		})
		// alert(productId)
	}
</script>
</body>
</html>