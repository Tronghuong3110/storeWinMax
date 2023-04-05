package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.OrderDetailDto;
import com.laptrinhjavaweb.dto.OrderDto;

public interface IBillService {

	String generatePaymentCode();
	OrderDetailDto addBill(OrderDetailDto order, String code);
	List<OrderDto> getListBill();
}
