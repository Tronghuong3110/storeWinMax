<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<body>
  <!-- Page Heading -->
  <c:if test = "${Products.size() == 0}">
    <h1 class="my-4" style="text-align: center;">Không có sản phẩm nào thuộc thể loại này</h1>
    <div class="row" style="height: 380px;">
  </c:if>
  <c:if test = "${Products.size() > 0}">
    <h1 class="my-4">Danh sách ${Products[0].name}</h1>
    <div class="row">
  </c:if>
      	<c:forEach var = "item" items="${Products }" varStatus="loop">
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="/chi-tiet-san-pham?id=${item.id }&categoryid=${item.category.id}"><img class="card-img-top"
						src="<c:url value = '/template/web/images/products/${item.type.img }' />" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="/chi-tiet-san-pham?id=${item.id }&categoryid=${item.category.id}">${item.name } ${item.size } ${item.type.loRen } ${item.type.shape }</a> 
							
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
			<c:if test = "${loop.index + 1 % 3 == 0 || loop.index == products.size()}">
				</div>
			</c:if>
			<c:if test="${loop.index + 1 < products.size() }">
				 <div class="row">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
			</c:if>
					
		</c:forEach>
      
      </div>
      <!-- /.row -->

      <!-- Pagination -->
      <ul class="pagination justify-content-center">
        <!-- <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li> -->
      </ul>
</body>