<section class="w30s-container ">
	<div class="w30s__payment w30s__form"
		style="background: #fff; border-radius: 10px; padding: 15px;">
		<h3 class="w30s-title">Thanh Toán</h3>
		<div class="payment-content">
			<form name="TheFormX"
				action="https://laptrinhjavawebshop.com/checkout" method="post">
				<div>
					<input type="hidden" name="_token"
						value="c20a5d99439aa26bea5c4878eb81ada58fcc19b3">
				</div>
				<div class="payment-content-left">
					<h3 class="payment-title w30s-icon-payment-local">Thông tin
						khách hàng</h3>
					<div class="payment-block payment-customer-info">
						<div class="row">
							<div class="col-sm-6 payment-register-info">
								<h3 class="payment-customer-title">Người mua hàng</h3>
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group required">
											<input name="fullname" placeholder="Họ và tên"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='Họ và tên'" value=""
												class="form-control">
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group ">
											<input name="email" placeholder="Email"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='Email'" value=""
												class="form-control">
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group required">
											<input name="phone" placeholder="Điện thoại"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='Điện thoại'" value=""
												class="form-control">
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6 payment-receive-info">
								<h3 class="payment-customer-title">Người nhận hàng</h3>
								<div class="form-group required">
									<input name="receive_fullname" placeholder="Họ và tên"
										onfocus="this.placeholder=''"
										onblur="this.placeholder='Họ và tên'" value=""
										class="form-control">
								</div>
								<div class="form-group required">
									<input name="receive_phone" placeholder="Điện thoại"
										onfocus="this.placeholder=''"
										onblur="this.placeholder='Điện thoại'" value=""
										class="form-control w30s-verify-phone-value">
								</div>
								<div class="form-group">
									<a href="#" class="w30s-copy-receive"><i class="fa fa-copy"></i>
										Sử dụng thông tin người mua hàng </a>
								</div>
							</div>
						</div>
						<div class="payment-tab w30s-box-transport-method">
							<div class="clear"></div>
							<div class="row w30s-box-transport">
								<div class="col-sm-6">
									<h3 class="payment-customer-title">Địa chỉ nhận hàng</h3>
									<div class="form-group required">
										<input name="receive_address" placeholder="Địa chỉ"
											onfocus="this.placeholder=''"
											onblur="this.placeholder='Địa chỉ'" value=""
											class="form-control w30s-transport-address">
									</div>
									<div class="form-group required">
										<select name="to_province"
											data-placeholder="--- Chọn tỉnh/thành ---"
											class="form-control select2 w30s-transport-province select2-hidden-accessible"
											style="width: 100%" tabindex="-1" aria-hidden="true"><option
												value="">--- Chọn tỉnh/thành ---</option>
											<option value="1">Hồ Chí Minh</option>
											<option value="2">Hà Nội</option>
											<option value="3">Bình Dương</option>
											<option value="4">Đà Nẵng</option>
											<option value="5">Hải Phòng</option>
											<option value="6">Long An</option>
											<option value="7">Bà Rịa - Vũng Tàu</option>
											<option value="8">An Giang</option>
											<option value="9">Bắc Giang</option>
											<option value="10">Bắc Kạn</option>
											<option value="11">Bạc Liêu</option>
											<option value="12">Bắc Ninh</option>
											<option value="13">Bến Tre</option>
											<option value="14">Bình Định</option>
											<option value="15">Bình Phước</option>
											<option value="16">Bình Thuận</option>
											<option value="17">Cà Mau</option>
											<option value="18">Cần Thơ</option>
											<option value="19">Cao Bằng</option>
											<option value="20">Đắk Lắk</option>
											<option value="21">Đắk Nông</option>
											<option value="22">Điện Biên</option>
											<option value="23">Đồng Nai</option>
											<option value="24">Đồng Tháp</option>
											<option value="25">Gia Lai</option>
											<option value="26">Hà Giang</option>
											<option value="27">Hà Nam</option>
											<option value="28">Hà Tĩnh</option>
											<option value="29">Hải Dương</option>
											<option value="30">Hậu Giang</option>
											<option value="31">Hòa Bình</option>
											<option value="32">Hưng Yên</option>
											<option value="33">Khánh Hòa</option>
											<option value="34">Kiên Giang</option>
											<option value="35">Kon Tum</option>
											<option value="36">Lai Châu</option>
											<option value="37">Lâm Đồng</option>
											<option value="38">Lạng Sơn</option>
											<option value="39">Lào Cai</option>
											<option value="40">Nam Định</option>
											<option value="41">Nghệ An</option>
											<option value="42">Ninh Bình</option>
											<option value="43">Ninh Thuận</option>
											<option value="44">Phú Thọ</option>
											<option value="45">Phú Yên</option>
											<option value="46">Quảng Bình</option>
											<option value="47">Quảng Nam</option>
											<option value="48">Quảng Ngãi</option>
											<option value="49">Quảng Ninh</option>
											<option value="50">Quảng Trị</option>
											<option value="51">Sóc Trăng</option>
											<option value="52">Sơn La</option>
											<option value="53">Tây Ninh</option>
											<option value="54">Thái Bình</option>
											<option value="55">Thái Nguyên</option>
											<option value="56">Thanh Hóa</option>
											<option value="57">Thừa Thiên – Huế</option>
											<option value="58">Tiền Giang</option>
											<option value="59">Trà Vinh</option>
											<option value="60">Tuyên Quang</option>
											<option value="61">Vĩnh Long</option>
											<option value="62">Vĩnh Phúc</option>
											<option value="63">Yên Bái</option></select><span
											class="select2 select2-container select2-container--default"
											dir="ltr" style="width: 100%;"><span class="selection"><span
												class="select2-selection select2-selection--single"
												role="combobox" aria-haspopup="true" aria-expanded="false"
												tabindex="0"
												aria-labelledby="select2-to_province-zg-container"><span
													class="select2-selection__rendered"
													id="select2-to_province-zg-container"><span
														class="select2-selection__placeholder">--- Chọn
															tỉnh/thành ---</span></span><span class="select2-selection__arrow"
													role="presentation"><b role="presentation"></b></span></span></span><span
											class="dropdown-wrapper" aria-hidden="true"></span></span>
									</div>
									<div class="form-group required">
										<select name="to_district"
											class="form-control select2 w30s-transport-district select2-hidden-accessible"
											style="width: 100%" data-province_id="" data-district_id=""
											data-method_shipping="" tabindex="-1" aria-hidden="true"></select><span
											class="select2 select2-container select2-container--default"
											dir="ltr" style="width: 100%;"><span class="selection"><span
												class="select2-selection select2-selection--single"
												role="combobox" aria-haspopup="true" aria-expanded="false"
												tabindex="0"
												aria-labelledby="select2-to_district-ga-container"><span
													class="select2-selection__rendered"
													id="select2-to_district-ga-container"><span
														class="select2-selection__placeholder">--- Chọn
															quận/huyện ---</span></span><span class="select2-selection__arrow"
													role="presentation"><b role="presentation"></b></span></span></span><span
											class="dropdown-wrapper" aria-hidden="true"></span></span>
									</div>
									<div class="form-group required">
										<select name="to_ward"
											class="form-control select2 w30s-transport-ward select2-hidden-accessible"
											style="width: 100%" data-province_id="" data-district_id=""
											data-ward_id="" data-method_shipping="" tabindex="-1"
											aria-hidden="true"><option value="">---
												Chọn phường/xã ---</option></select><span
											class="select2 select2-container select2-container--default"
											dir="ltr" style="width: 100%;"><span class="selection"><span
												class="select2-selection select2-selection--single"
												role="combobox" aria-haspopup="true" aria-expanded="false"
												tabindex="0" aria-labelledby="select2-to_ward-ff-container"><span
													class="select2-selection__rendered"
													id="select2-to_ward-ff-container"><span
														class="select2-selection__placeholder">--- Chọn
															phường/xã ---</span></span><span class="select2-selection__arrow"
													role="presentation"><b role="presentation"></b></span></span></span><span
											class="dropdown-wrapper" aria-hidden="true"></span></span>
									</div>
								</div>
								<div class="col-sm-6">
									<h3 class="payment-customer-title">Hình thức giao hàng</h3>
									<div class="box type-shipping">
										<div class="type-shipping-item w30s-check-inline">
											<div
												class="w30s-alert w30s-alert-warning w30s-alert-warning-enter-address">
												Vui lòng chọn địa chỉ giao hàng</div>
											<div class="w30s-list-type-shipping"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<h3 class="payment-title w30s-icon-payment-money">Hình thức
						thanh toán</h3>
					<div class="payment-block w30s-box-payment-method">
						<div class="row">
							<div class="col-sm-6" style="width: 100%">
								<div class="w30s-payment-item">
									<h4 class="w30s-payment-method payment-method-online">
										Thanh Toán trực tuyến</h4>
								</div>
								<div class="w30s-list-payment-online" tabindex="1"
									style="overflow: hidden; outline: none;">
									<div class="w30s-payment-online">
										<div class="w30s-radio w30s-check-blue">
											<input id="payment-8245" name="payment_method" value="11"
												type="radio" checked="checked" class="w30s-select-payment"><label
												for="payment-8245"><div class="images-payment">
													<img
														src="https://laptrinhjavawebshop.com/assets/images/payment/2022/thanh-toan-chuyen-kh.png">
												</div> <span>Thanh toán chuyển khoản</span></label>
											<div
												class="w30s-payment-online-options w30s-js-show-more-content-payment"
												data-height="3624">
												<h2>
													<span style="font-size: 11px;"><span
														style="color: #000000;">TÀI KHOẢN VIETCOMBANK</span></span>
												</h2>
												<p>
													<span style="font-size: 11px;"><span
														style="color: #000000;">- Số tài khoản:
															0381000498447</span></span>
												</p>
												<p dir="ltr">
													<span style="font-size: 11px;"><span
														style="color: #000000;">- Chủ tài khoản: TRUONG
															TUNG LAM</span></span>
												</p>
												<p dir="ltr">- Chi nhánh: VIETCOMBANK Thủ Đức</p>
												<p dir="ltr">
													<span style="color: #e74c3c;"><strong><span
															style="font-size: 11px;">Chú ý: khi
																chuyển&nbsp;khoản, quý khách ghi nội dung là: [MÃ ĐƠN
																HÀNG]</span></strong></span>
												</p>
												<p>&nbsp;</p>
												<p>
													<strong><span style="font-size: 11px;"><span
															style="color: #000000;">1. NẾU QUÝ KHÁCH MUA HÀNG
																TẠI "LAPTRINHJAVAWEB SHOP"</span></span></strong>
												</p>
												<p>
													<span style="font-size: 11px;"><span
														style="color: #000000;">Sau khi chuyển khoản xong,
															quý khách gửi xác nhận qua zalo or facebook nhé để
															laptrinhjavaweb xác nhận và chuyển hàng cho quý khách</span></span>
												</p>
												<p>&nbsp;</p>
												<p>
													<span style="font-size: 11px;"><span
														style="color: #000000;">- Zalo:&nbsp;<a
															href="https://zalo.me/4588194011921423842"
															target="_blank">zalo.me/4588194011921423842</a></span></span>
												</p>
												<p>
													<span style="font-size: 11px;"><span
														style="color: #000000;">- Facebook:&nbsp;<a
															href="https://www.facebook.com/laptrinhjavaweb"
															target="_blank">facebook.com/laptrinhjavaweb</a></span></span>
												</p>
												<p>&nbsp;</p>
												<p>
													<strong><span style="font-size: 11px;"><span
															style="color: #000000;">2.&nbsp;NẾU QUÝ KHÁCH MUA
																HÀNG TẠI "LAPTRINHJAVAWEB SOFTWARE"</span></span></strong>
												</p>
												<p>
													<span style="font-size: 11px;"><span
														style="color: #000000;">Quý khách làm theo các bước
															bên dưới để xác nhận chuyển khoản và kích hoạt dịch vụ</span></span>
												</p>
												<p>
													<span style="font-size: 11px;"><span
														style="color: #000000;">Quý khách chụp phần giao
															dịch chuyển khoản thành công sau đó làm theo các bước</span></span>
												</p>
												<p>
													<span style="font-size: 11px;"><span
														style="color: #000000;">B1: truy cập&nbsp;</span><u><a
															href="https://support.laptrinhjavaweb.com/forms/ticket"
															target="_blank"><span style="color: #3498db;">https://support.laptrinhjavaweb.com/forms/ticket</span></a></u></span>
												</p>
												<p>
													<span style="font-size: 11px;"><span
														style="color: #000000;">B2: Nhập các thông tin</span></span>
												</p>
												<p>
													<span style="font-size: 11px;"><span
														style="color: #000000;">- Tiêu đề: Xác nhận thanh
															toán dịch vụ<br>- Tên của bạn: họ tên
															của&nbsp;quý&nbsp;khách<br>- Địa chỉ email: email
															quý&nbsp;khách&nbsp;sẽ sử dụng để đăng ký dịch vụ tại
															Laptrinhjavaweb<br>- Phòng ban:
															quý&nbsp;khách&nbsp;chọn phòng chăm sóc khách hàng<br>-
															Mức độ ưu tiên và dịch vụ quý&nbsp;khách&nbsp;giữ nguyên<br>-
															Nội dung: "Mã đơn hàng"<br>- Đính kèm:
															quý&nbsp;khách&nbsp;đính kèm hình chụp giao dịch thành
															công<br>B3: xong B2 thì quý&nbsp;khách&nbsp;bấm
															"Gửi"<br>Sau đó quý khách chờ phản hồi từ
															Laptrinhjavaweb qua email (email mà quý khách nhập ở phần
															"Địa chỉ email") nhé<br>Cảm ơn quý khách đã tin
															tưởng sử dụng dịch vụ
													</span></span>
												</p>
											</div>
											<p class="w30s-show-more-payment">
												<a class="w30s-js-show-more-payment" href="#"
													title="Xem thêm" style="display: block;">Xem thêm</a>
											</p>
										</div>
									</div>
									<div class="w30s-payment-online">
										<div class="w30s-radio w30s-check-blue">
											<input id="payment-8246" name="payment_method" value="3"
												type="radio" class="w30s-select-payment"><label
												for="payment-8246"><div class="images-payment">
													<img
														src="https://laptrinhjavawebshop.com/assets/images/payment/2022/ngan-luong-p.png">
												</div> <span>Thanh toán qua thẻ quốc tế (visa, master,
													JCB), Thẻ ATM nội địa/Internet Banking (Hỗ trợ Internet
													Banking)</span></label>
										</div>
									</div>
								</div>
								<div class="w30s-warning-payment-online error"
									style="display: none;">Không có phương thức thanh toán
									trực tuyến phù hợp với đơn hàng hiện tại</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="payment-content-right">
					<h3 class="payment-title w30s-icon-payment-cart">Thông tin đơn
						hàng</h3>
					<a href="https://laptrinhjavawebshop.com/cart"
						class="btn btn-outline-dark btn-sm float-right w30s-button-return-cart">Sửa</a>
					<div class="clear"></div>
					<div class="payment-block">
						<div class="payment-list-product">
							<div class="list-items">
								<div class="list-items-image">
									<a
										href="https://laptrinhjavawebshop.com/kep-dien-thoai-xe-may-4-canh-yd-380"
										target="_blank"><img
										src="https://laptrinhjavawebshop.com/datafiles/36358/upload/thumb_images/K%E1%BA%B8P%20%C4%90I%E1%BB%86N%20THO%E1%BA%A0I%20XE%20M%C3%81Y%204%20C%E1%BA%A0NH%20YD-380/0928e80f-61ba-4208-9b88-e3fb23dfd996.jpg"
										alt="KẸP ĐIỆN THOẠI XE MÁY 4 CẠNH YD-380"></a>
								</div>
								<div class="list-item-info">
									<div class="item-info-name">
										<a
											href="https://laptrinhjavawebshop.com/kep-dien-thoai-xe-may-4-canh-yd-380"
											class="w30s-limit-2-lines" target="_blank">KẸP ĐIỆN THOẠI
											XE MÁY 4 CẠNH YD-380</a>
									</div>
									<div class="item-info-quantity px-1">
										<span>1</span>x
									</div>
									<div class="item-info-price">69.000 đ</div>
								</div>
								<div class="clear"></div>
							</div>
							<div class="list-items">
								<div class="list-items-image">
									<a
										href="https://laptrinhjavawebshop.com/o-cam-6-lo-dai-chiu-nhiet-eco"
										target="_blank"><img
										src="https://laptrinhjavawebshop.com/datafiles/36358/upload/thumb_images/%E1%BB%94%20C%E1%BA%AEM%206%20L%E1%BB%96%20D%C3%80I%202M%20CH%E1%BB%8AU%20NHI%E1%BB%86T%20ECO/046248ea-394b-4788-9fa5-4c0a3b2349d9.jpg"
										alt="Ổ CẮM 6 LỖ DÀI CHỊU NHIỆT ECO"></a>
								</div>
								<div class="list-item-info">
									<div class="item-info-name">
										<a
											href="https://laptrinhjavawebshop.com/o-cam-6-lo-dai-chiu-nhiet-eco"
											class="w30s-limit-2-lines" target="_blank">Ổ CẮM 6 LỖ DÀI
											CHỊU NHIỆT ECO</a>
										<div class="product-variant">5 m</div>
									</div>
									<div class="item-info-quantity px-1">
										<span>1</span>x
									</div>
									<div class="item-info-price">195.000 đ</div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
						<div class="w30s-box-coupon">
							<div class="box-coupon-item w30s-box-coupon-item">
								<div class="coupon-check">
									<input type="checkbox" name="use_coupon" id="use_coupon"
										value="1"><label for="use_coupon"
										data-show=".w30s-price-coupon" class="w30s-coupon-check-input">Sử
										dụng Coupon</label>
								</div>
								<div class="coupon-code w30s-coupon-code">
									<input type="text" name="coupon_code" data-type="1" value=""
										placeholder="Nhập mã Coupon">
									<button type="button"
										class="coupon-button w30s-button-check-coupon">Áp
										dụng</button>
								</div>
							</div>
						</div>
						<input type="hidden" name="is_created"
							class="w30s-transport-my-company" value="">
						<div class="box-price">
							<div
								class="box-price-item box-coupon-label w30s-box-price-product">
								<span>Tạm tính</span><span class="w30s-price"><span
									class="w30s-price-product" data-price="264000">264.000 đ</span></span>
							</div>
							<div
								class="box-price-item box-coupon-label w30s-box-price-coupon">
								<span>Giảm giá Coupon</span><span class="w30s-price"><span
									class="w30s-price-coupon" data-price=""> - 0 đ </span></span>
							</div>
							<div
								class="box-price-item box-voucher-label w30s-box-price-voucher">
								<span>Giảm giá Voucher</span><span class="w30s-price"><span
									class="w30s-price-voucher" data-price=""> - 0 đ</span></span>
							</div>
							<div class="box-price-item box-transport-fee">
								<span>Phí vận chuyển</span><span class="w30s-price"><span
									class="w30s-price-ship" data-price="">----</span></span>
							</div>
							<div class="box-price-item">
								<span class="bold">Thành tiền</span><span class="w30s-price"><span
									class="w30s-price-total bold" data-total="264000">264.000đ</span></span>
							</div>
						</div>
						<div class="form-group">
							<textarea class="form-control" rows="3" name="note_customer"
								placeholder="Ghi chú"></textarea>
						</div>
						<button
							class="btn btn-danger w30s-btn-red btn-lg btn-block w30s-btn-save-payment">Thanh
							Toán</button>
					</div>
				</div>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('.w30s__payment .w30s-btn-save-payment').click(function(event) {
				event.preventDefault();
				loader.showLoader();
				$(this).closest('form').submit();
			});
		})
	</script>
</section>