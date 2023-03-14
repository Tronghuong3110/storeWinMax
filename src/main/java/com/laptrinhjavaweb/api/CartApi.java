package com.laptrinhjavaweb.api;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CartItemDto;
import com.laptrinhjavaweb.service.ICartSrvice;

@RestController(value = "ApiOfCartOfWeb")
public class CartApi {	
	
	@Autowired
	private ICartSrvice cartService;

	// them san pham vao gio hang
	@PostMapping("/api/cart")
	public CartItemDto addProductToCart(@RequestParam Long productId, @RequestParam Long quantity,@RequestParam Long userId) {
		CartItemDto cartItem = cartService.addProduct(productId, quantity, userId);
		return cartItem;
	}
	
	// xoa san pham trong gio hang
	@DeleteMapping("/api/cart")
	public String deleteProduct(@RequestParam Long cartItemId) {
		cartService.deleteProductFromCart(cartItemId);
		return "sucess";
	}
	
	@GetMapping("/api/cart")
	public List<CartItemDto> getListProductOfCartOfUser(@RequestParam Long userId) {
		List<CartItemDto> list = cartService.getListCartItemOfUser(userId);
//		return list == null ? null : list;
		if(list == null) {
			return new ArrayList<>();
		}
		return list;
	}
}
