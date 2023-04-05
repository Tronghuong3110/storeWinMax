package com.laptrinhjavaweb.api.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CartItemDto;
import com.laptrinhjavaweb.dto.ResponseDto;
import com.laptrinhjavaweb.entity.OrderEntity;
import com.laptrinhjavaweb.service.ICartSrvice;

@RestController(value = "ApiOfCartOfWeb")
public class CartApi {	
	
	@Autowired
	private ICartSrvice cartService;

	// them san pham vao gio hang
	@PostMapping("/api/cart")
	public CartItemDto addProductToCart(@RequestParam Long productId, @RequestParam Long quantity,@RequestParam Long userId) {
		CartItemDto cartItem = cartService.addProduct(productId, quantity);
		return cartItem;
	}
	
	// xoa san pham trong gio hang
	@DeleteMapping("/api/cart")
	public String deleteProduct(@RequestParam Long cartItemId) {
		cartService.deleteProductFromCart(cartItemId);
		return "sucess";
	}
	
	// get danh sach cartItem
	@GetMapping("/api/cart")
	public List<ResponseDto<String, CartItemDto> > getListProductOfCartOfUser(@RequestParam Integer status) {
		List<ResponseDto<String, CartItemDto> > result = cartService.getListCartItemOfUser(status);
		return result;
	}
	
	@GetMapping("/test")
	public OrderEntity test(@RequestParam Long id) {
		OrderEntity res = cartService.findOne(id);
		return res;
	}
	
	@GetMapping("/test/code")
	public String getCode(@RequestParam Long id) {
		String res = cartService.getCode(id);
		return res;
	}
}
