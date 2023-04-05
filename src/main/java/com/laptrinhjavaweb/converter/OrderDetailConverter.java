package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.OrderDetailDto;
import com.laptrinhjavaweb.entity.OrderDetail;

public class OrderDetailConverter {
	
	public static OrderDetailDto toDto(OrderDetail entity) {
		OrderDetailDto dto = new OrderDetailDto();
		dto.setId(entity.getId());
		dto.setCommune(entity.getCommune());
		dto.setConscious(entity.getConscious());
		dto.setDistrict(entity.getDistrict());
		dto.setEmailBuyer(entity.getEmailBuyer());
		dto.setMethodPayment(entity.getMethodPayment());
		dto.setNameBuyer(entity.getNameBuyer());
		dto.setNameReceiver(entity.getNameReceiver());
		dto.setPhoneBuyer(entity.getPhoneBuyer());
		dto.setPhoneReceiver(entity.getPhoneReceiver());
		dto.setVillage(entity.getVillage());
		dto.setTotal(entity.getTotal());
		return dto;
	}
	
	public static OrderDetail toEntity(OrderDetailDto dto) {
		OrderDetail entity = new OrderDetail();
		entity.setCommune(dto.getCommune());
		entity.setConscious(dto.getConscious());
		entity.setDistrict(dto.getDistrict());
		entity.setEmailBuyer(dto.getEmailBuyer());
		entity.setMethodPayment(dto.getMethodPayment());
		entity.setNameBuyer(dto.getNameBuyer());
		entity.setNameReceiver(dto.getNameReceiver());
		entity.setPhoneBuyer(dto.getPhoneBuyer());
		entity.setPhoneReceiver(dto.getPhoneReceiver());
		entity.setVillage(dto.getVillage());
		entity.setTotal(dto.getTotal());
		return entity;
	}
}
