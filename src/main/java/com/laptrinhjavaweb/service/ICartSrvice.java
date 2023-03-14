package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CartItemDto;

public interface ICartSrvice {
	CartItemDto addProduct(Long productId, Long quantity, Long userId);
	List<CartItemDto> getListCartItemOfUser(Long userId);
	void deleteProductFromCart(Long id);
}
