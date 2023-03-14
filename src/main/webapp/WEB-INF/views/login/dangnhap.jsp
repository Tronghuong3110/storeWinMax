<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
	<div class="card card0 border-0">
		<div class="row d-flex">
			<div class="col-lg-6">
				<div class="card1 pb-5">
					<div class="row">
						<img src="https://i.imgur.com/CXQmsmF.png" class="logo">
					</div>
					<div class="row px-3 justify-content-center mt-4 mb-5 border-line">
						<img src="https://i.imgur.com/uNGdWHi.png" class="image">
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card2 card border-0 px-4 py-5">
					<!-- <div class="row mb-4 px-3">
                        <h6 class="mb-0 mr-4 mt-2">Đăng nhập với</h6>
                        <div class="facebook text-center mr-3"><div class="fa fa-facebook"></div></div>
                        <div class="twitter text-center mr-3"><div class="fa fa-twitter"></div></div>
                        <div class="linkedin text-center mr-3"><div class="fa fa-linkedin"></div></div>
                    </div>
                    <div class="row px-3 mb-4">
                        <div class="line"></div>
                        <small class="or text-center">Hoặc</small>
                        <div class="line"></div>
                    </div> -->

					<div class="row px-3 mb-4">
						<c:if test="${param.incorrectAccount != null}">
							<div class="alert alert-danger" style = "width: 100%">Tài khoản hoặc mật khẩu không đúng</div>
						</c:if>
						<c:if test="${param.accessDenied != null}">
							<div class="alert alert-danger" style = "width: 100%">Bạn không được truy cập vào đường link này</div>
						</c:if>
						<c:if test="${param.message != null}">
							<div class="alert alert-danger" style = "width: 100%">Bạn phải đăng nhập</div>
						</c:if>
					</div>

					<form action="j_spring_security_check" id="formLogin" method="post">
						<div class="row px-3">
							<label class="mb-1"><h6 class="mb-0 text-sm">Tên
									đăng nhập</h6></label> <input class="mb-4" type="text" name="j_username"
								placeholder="Tên đăng nhập">
						</div>
						<div class="row px-3">
							<label class="mb-1"><h6 class="mb-0 text-sm">Mật
									khẩu</h6></label> <input type="password" name="j_password"
								placeholder="Mật khẩu">
						</div>
						
						<div class="row px-3 mb-4">
						<div class="custom-control custom-checkbox custom-control-inline">
							<input id="chk1" type="checkbox" name="chk"
								class="custom-control-input"> <label for="chk1"
								class="custom-control-label text-sm">Nhớ mật khẩu</label>
						</div>
						<a href="#" class="ml-auto mb-0 text-sm">Quên mật khẩu?</a>
					</div>

						<div class="row mb-3 px-3">
							<a href = "<c:url value = '/trang-chu'/>" class = "btn-blue text-center btn">Trở về</a>
							<button type="submit" class="btn btn-blue text-center"  style="position: absolute; right: 26px;">Đăng
								nhập</button>
						</div>
						<div class="row mb-4 px-3">
						<small class="font-weight-bold">Bạn chưa có tài khoản? <a href = "<c:url value = '/dang-ky'/>"
							class="text-danger ">Đăng ký ngay</a></small>
					</div>
					</form>


					<!-- <div class="row mb-3 px-3">
						<button type="submit" class="btn btn-blue text-center">Đăng
							nhập</button>
					</div> -->

				</div>
			</div>
		</div>
	</div>
</div>