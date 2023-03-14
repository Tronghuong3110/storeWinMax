package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.CartItemConverter;
import com.laptrinhjavaweb.dto.CartItemDto;
import com.laptrinhjavaweb.entity.CartEntity;
import com.laptrinhjavaweb.entity.CartItem;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.CartItemRepository;
import com.laptrinhjavaweb.repository.CartRepository;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.ICartSrvice;

@Service
public class CartService implements ICartSrvice{
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CartItemRepository cartItemRepository;
	
	@Autowired
	private CartRepository cartRepository;

	@Override
	public CartItemDto addProduct(Long productId, Long quantity, Long userId) {
		// lay thong tin san pham muon them
		ProductEntity product = productRepository.findById(productId);
		// lay ra user 
		UserEntity user = getUserByUserId(userId);
		
		// lay ra gio hang cua user 
		CartEntity cart = user.getCart();
		
		// TH user chua co gio hang
		if(cart == null) {
			cart = new CartEntity();
			user.setCart(cart);
			cart.setUser(user);
			cart = cartRepository.save(cart);
		}
		// kiem tra xem cart item co chua product can them da co trong gio hang cua user chua
		CartItem cartItem = cartItemRepository.findByCart_IdAndProduct_Id(cart.getId(), product.getId());
		
		// truong hop chua co
		if(cartItem == null) {
			cartItem = new CartItem();
			cartItem.setProduct(product);
			cartItem.setCart(cart);
			cartItem.setQuantity(quantity);
			cartItem.setTotal((double)(product.getPrice() * quantity));
		}
		
		// TH cart item chua product da co trong gio hang cua user
		else {
			cartItem.setQuantity(quantity + cartItem.getQuantity());
			cartItem.setTotal(cartItem.getTotal() + quantity * product.getPrice());
		}
		
		cartItemRepository.save(cartItem);
		
		return CartItemConverter.toDto(cartItem);
	}

	@Override
	public List<CartItemDto> getListCartItemOfUser(Long userId) {
		UserEntity user = getUserByUserId(userId);
		
		// lay cart cua user
		CartEntity cart = user.getCart();
		if(cart == null) {
			return null;
		}
		// lay ra danh sach cartItem co cartId = cart.getId();
		List<CartItem> cartItems = cartItemRepository.findAllByCart_Id(cart.getId());
		List<CartItemDto> resultList = new ArrayList<>();
		for(CartItem entity : cartItems) {
			resultList.add(CartItemConverter.toDto(entity));
		}
		return resultList;
	}
	
	private UserEntity getUserByUserId(Long userId) {
		return userRepository.findOneByIdAndStatus(userId, SystemConstant.ACTIVE_STATUS);
	}

	@Override
	public void deleteProductFromCart(Long id) {
		cartItemRepository.delete(id);
	}
}
