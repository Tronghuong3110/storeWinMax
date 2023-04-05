package com.laptrinhjavaweb.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.OrderDto;
import com.laptrinhjavaweb.service.IBillService;

@RestController(value = "ApiOfAdminOfPayment")
public class PaymentApi {

	@Autowired
	private IBillService billService;
	
	@GetMapping("/api/admin/listPayment")
	public List<OrderDto> getListBill() {
		List<OrderDto> list = billService.getListBill();
		return list;
	}
}
