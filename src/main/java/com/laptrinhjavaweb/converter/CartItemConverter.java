package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.CartItemDto;
import com.laptrinhjavaweb.dto.ProductDto;
import com.laptrinhjavaweb.entity.CartItem;

public class CartItemConverter {
	
	public static CartItemDto toDto(CartItem entity) {
		
		CartItemDto dto = new CartItemDto();
		dto.setId(entity.getId());
		dto.setQuantity(entity.getQuantity());
		dto.setTotal(entity.getTotal());
//		dto.setImg(entity.getProduct().getType().getImg());
		dto.setProduct(toProductDto(entity));
		return dto;
	}
	
	private static ProductDto toProductDto(CartItem entity) {
		return ProductConverter.toDTO(entity.getProduct());
	}
}
