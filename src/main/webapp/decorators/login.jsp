<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	
	<title><dec:title default="Đăng nhập"/></title>
	<link rel="stylesheet" href="<c:url value='/template/login/css/style.css'/>" />
	<link rel="stylesheet" href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css' />" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		a:hover {
			text-decoration: none;
			color: #fff;
		}
	</style>
</head>
<body>
	<dec:body/>
	
	<script type="text/javascript"
		src="<c:url value = '/template/web/vendor/jquery/jquery.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>