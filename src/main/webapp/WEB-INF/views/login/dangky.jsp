<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/common/taglib.jsp" %>
<c:url var = "apiSignUp" value = "/api/user" />

<div class="row" style="margin-top: 16px;">
	<div class="panel panel-primary">
		<div class="panel-body">
			<div class="form-group test">
			</div>
			<div class="form-group">
				<h2>Đăng ký</h2>
			</div>
			<div class="form-group">
				<!--UserName-->
				<label class="control-label" for="userName">Tên đăng nhập</label> <input
					id="userName" type="text" class="form-control">
			</div>
			<div class="form-group">
				<!--Full name-->
				<label class="control-label" for="fullname">Họ và tên</label> <input
					id="fullname" type="text" maxlength="50" class="form-control">
			</div>
			<div class="form-group">
				<!--Email-->
				<label class="control-label" for="email">Email
					</label> <input id="email" type="email" maxlength="50"
					class="form-control">
			</div>
			<div class="form-group">
				<!--Password-->
				<label class="control-label" for="password">Mật khẩu</label>
				<input id="password" type="password" maxlength="25"
					class="form-control" placeholder="at least 6 characters"
					length="40">
			</div>
			<div class="form-group">
				<label class="control-label" for="confirm-password">Nhập lại mật khẩu
					</label> <input id="confirm-password" type="password"
					maxlength="25" class="form-control">
			</div>
			<div class="form-group">
				<button id="signupSubmit" type="submit"
					class="btn btn-info btn-block " onclick="solve()">Đăng ký</button>
			</div>
			<hr>
			<p>
				Bạn đã có tài khoản? <a href = "<c:url value = '/dang-nhap'/>">Đăng nhập</a>
			</p>
		</div>
	</div>
</div>

<script>

	$(function() {
		//get parameter tu url
		const urlParams = new URLSearchParams(window.location.search);
		const param = urlParams.get('message');
		var text = '';
		if(param == "xacnhanmatkhaukhondung") {
			text = '<div class="alert alert-danger" style = "width: 100%"> Xác nhận mật khẩu không đúng </div>';
		}
		if(param == "dangkikhongthanhcong") {
			text = '<div class="alert alert-danger" style = "width: 100%"> Đăng ký không thành công </div>';
		}
		$('.test').html(text);
	})

	function solve() {
		var fullName = $('#fullname').val();
		var userName = $('#userName').val();
		var email = $('#email').val();
		var password = $('#password').val();
		var confirmPassword = $('#confirm-password').val();
		if(password === confirmPassword) {
			var data = {
				"fullName": fullName,
				"userName": userName,
				"email": email,
				"passWord": password
			};
			signUp(data);
		}
		else {
			// <div class="alert alert-danger" style = "width: 100%">Tài khoản hoặc mật khẩu không đúng</div>
			window.location.href = "/dang-ky?message=xacnhanmatkhaukhondung";
		}
		// alert(test)
	}

	function signUp(data) {
		$.ajax({
			type: "POST",
			url: "${apiSignUp}",
			data: JSON.stringify(data),
			dataType: "JSON",
			contentType: "application/json; charset=utf-8",
			success: function(data, status) {
				window.location.href = "/dang-nhap?message=dangkythanhcong"
			},
			error: function(data, status, error) {
				window.location.href = "/dang-ky?message=dangkikhongthanhcong";
			}
		})
	}

</script>