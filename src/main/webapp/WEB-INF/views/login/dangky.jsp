<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/common/taglib.jsp" %>

<div class="row">
	<div class="panel panel-primary">
		<div class="panel-body">
			<form method="POST" action="#" role="form">
				<div class="form-group">
					<h2>Đăng ký</h2>
				</div>
				<div class="form-group">
					<label class="control-label" for="signupName">Tài Khoản</label> <input
						id="signupName" type="text" maxlength="50" class="form-control">
				</div>
				<div class="form-group">
					<label class="control-label" for="signupEmail">Họ và tên</label> <input
						id="signupEmail" type="text" maxlength="50" class="form-control">
				</div>
				<div class="form-group">
					<label class="control-label" for="signupEmailagain">Email
						</label> <input id="signupEmailagain" type="email" maxlength="50"
						class="form-control">
				</div>
				<div class="form-group">
					<label class="control-label" for="signupPassword">Mật khẩu</label>
					<input id="signupPassword" type="password" maxlength="25"
						class="form-control" placeholder="at least 6 characters"
						length="40">
				</div>
				<div class="form-group">
					<label class="control-label" for="signupPasswordagain">Nhập lại mật khẩu
						</label> <input id="signupPasswordagain" type="password"
						maxlength="25" class="form-control">
				</div>
				<div class="form-group">
					<button id="signupSubmit" type="submit"
						class="btn btn-info btn-block">Đăng ký</button>
				</div>
				<hr>
				<p>
					Bạn đã có tài khoản? <a href = "<c:url value = '/dang-nhap'/>">Đăng nhập</a>
				</p>
			</form>
		</div>
	</div>
</div>