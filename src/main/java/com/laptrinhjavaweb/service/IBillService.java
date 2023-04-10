package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CartItemDto;
import com.laptrinhjavaweb.dto.OrderDetailDto;
import com.laptrinhjavaweb.dto.OrderDto;
import com.laptrinhjavaweb.dto.ResponseDto;

public interface IBillService {
	String generatePaymentCode();
	OrderDetailDto addBill(OrderDetailDto order, String code);
	List<OrderDto> getListBill();
	void update(Long id, Double payments);
	ResponseDto<OrderDetailDto, CartItemDto> findOne(Long id);
}
