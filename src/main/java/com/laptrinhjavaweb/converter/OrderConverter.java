package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.OrderDto;
import com.laptrinhjavaweb.entity.OrderEntity;

public class OrderConverter {

	public static OrderDto toDto(OrderEntity entity) {
		OrderDto dto = new OrderDto();
		dto.setId(entity.getId());
		dto.setCode(entity.getCode());
		dto.setId(entity.getId());
		dto.setTotal_payment(entity.getTotal_payment());
		dto.setUnpaid_amount(entity.getUnpaid_amount());
		dto.setDate(entity.getDate());
		return dto;
	}
	
	public static OrderEntity toEntity(OrderDto dto) {
		OrderEntity entity = new OrderEntity();
		return entity;
	}
}
