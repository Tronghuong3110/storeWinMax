<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><dec:title default="trang chủ"/></title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css' />" />
	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="<c:url value='/template/web/css/shop-homepage.css'/>" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	
	<dec:head/>
</head>

<body>

	<!-- begin header web -->
	<%@ include file="/common/web/header.jsp"%>
	<!-- End header web -->

	<!-- begin container -->
	<div class="container">
		<dec:body/>
	</div>
	<!-- end container -->

	<!-- Begin footer -->
	<%@ include file="/common/web/footer.jsp"%>
	<!-- end footer -->


	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>
	<script type="text/javascript"
		src="<c:url value = '/template/web/vendor/jquery/jquery.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

</body>
</html>