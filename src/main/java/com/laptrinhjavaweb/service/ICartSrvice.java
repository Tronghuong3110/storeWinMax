package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CartItemDto;
import com.laptrinhjavaweb.dto.ResponseDto;
import com.laptrinhjavaweb.entity.OrderEntity;

public interface ICartSrvice {
	CartItemDto addProduct(Long productId, Long quantity);
	List<ResponseDto<String, CartItemDto> > getListCartItemOfUser(Integer status);
	void deleteProductFromCart(Long id);
	OrderEntity findOne(Long id); 
	String getCode(Long id);
}
