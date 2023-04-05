package com.laptrinhjavaweb.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.OrderDetailDto;
import com.laptrinhjavaweb.service.IBillService;

@RestController(value = "ApiOfPaymentOfWeb")
public class PaymentApi {
	
	@Autowired
	private IBillService billService;
	
	// sinh mã đơn hàng khi client chọn phương thức thanh toán
	@PostMapping("/api/payment/code")
	public String generatepaymentCode() {
		String paymentCode = billService.generatePaymentCode();
		return paymentCode;
	}
	
	// lưu đơn hàng khi client tiến hành thanh toán
	@PostMapping("/api/payment")
	public OrderDetailDto payment(@RequestBody OrderDetailDto orderDto, @RequestParam String code) {
		OrderDetailDto res = billService.addBill(orderDto, code);
		return res;
	}
}
