package com.laptrinhjavaweb.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CartItemDto;
import com.laptrinhjavaweb.dto.OrderDetailDto;
import com.laptrinhjavaweb.dto.OrderDto;
import com.laptrinhjavaweb.dto.ResponseDto;
import com.laptrinhjavaweb.entity.CartItem;
import com.laptrinhjavaweb.entity.OrderDetail;
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
	
	@PutMapping("/api/admin/bill/{payments}")
	public String updeta(@RequestParam Long id, @PathVariable("payments") String payments) {
		billService.update(id, Double.valueOf(payments));
		return "success";
	}
	
	@GetMapping("/api/admin/{id}")
	public ResponseDto<OrderDetailDto, CartItemDto> getBill(@PathVariable("id") String id) {
		ResponseDto<OrderDetailDto, CartItemDto> res = billService.findOne(Long.valueOf(id));
		return res;
	}
}
