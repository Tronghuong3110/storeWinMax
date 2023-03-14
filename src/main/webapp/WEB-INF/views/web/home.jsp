<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/common/taglib.jsp" %>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Trang chủ</title>

</head>

<body>
	<div class="row">
		<div class="col-lg-3" style="margin-top: 24px;">
			<h2 class="card-header bg-primary text-white text-uppercase" style="font-size: 1.5rem !important;"><i class="fa fa-list"></i> Sản phẩm</h2>
			<div class="list-group">
			
			<!-- Danh sách category -->
				<c:forEach var = "item" items="${categorys }">
					<a href="<c:url value = '/san-pham/${item.code }'/>" class="list-group-item">${item.name}</a>
				</c:forEach>
			
			</div>
		</div>
		<!-- /.col-lg-3 -->

		<div class="col-lg-9">
			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				
				<!-- Begin slider -->
				<div class="carousel-inner" role="listbox">
					
					<c:forEach var = "item" items="${sliders}" varStatus="index">
						<c:if test="${index.first }">
							<div class="carousel-item active">
						</c:if>
						<c:if test="${not index.first }">
							<div class="carousel-item">
						</c:if>
								<img class="d-block img-fluid img" src="<c:url value = '/template/web/images/sliders/${item.img }' />"
								alt="First slide">
							</div>
					</c:forEach>
				</div>
				<!-- End Slider -->
				
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>

		<!-- danh sách sản phẩm -->
			<div class="row">
				<!-- /chi-tiet-san-pham/${item.product_id }/${item.category_id} -->
					<c:forEach var = "item" items="${Products }" varStatus="loop">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="/chi-tiet-san-pham?catrgoryid=${item.category_id}&id=${item.product_id}" title="View Product"><img class="card-img-top"
									src="<c:url value = '/template/web/images/products/${item.img }' />" alt=""></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="/chi-tiet-san-pham?catrgoryid=${item.category_id}&id=${item.product_id}" title="View Product">${item.name_product} ${item.size } ${item.lo_ren } ${item.shape }</a> 
									</h4>
									<h5>${item.price }</h5>
									<p class="card-text">Lorem ipsum dolor sit amet, consectetur
										adipisicing elit. Amet numquam aspernatur!</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
										&#9734;</small>
								</div>
							</div>
						</div>
						<c:if test="${loop.index + 1 < products.size() }">
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="card h-100">
						</c:if>
								
					</c:forEach>
				
				<%-- </c:if> --%>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.col-lg-9 -->
	</div>
	<!-- /.row -->

	<script>
		// $(function() {
		// 	$('.btn-product').click(function() {
		// 		var productId = $(this).data('product-id');
		// 		var categoryId = $(this).data('category-id')
		// 		window.location.href = '/chi-tiet-san-pham?id=' + productId + "&catrgoryid=" + categoryId;
		// 	});
		// });
	</script>
</body>
</html>