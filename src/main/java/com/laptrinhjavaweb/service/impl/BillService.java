package com.laptrinhjavaweb.service.impl;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.CartEntity;
import com.laptrinhjavaweb.entity.OrderEntity;
import com.laptrinhjavaweb.exception.ResourceNotFoundException;
import com.laptrinhjavaweb.repository.CartRepository;
import com.laptrinhjavaweb.service.IBillService;

@Service
public class BillService implements IBillService{

	@Autowired
	private CartRepository cartRepository;
	
	@Override
	public OrderEntity saveToMap(HashMap<Long, OrderEntity> bill, HttpSession session, Long cartId) {
		// lấy ra giỏ hàng có id là cartId
		CartEntity cartEntity = cartRepository.findOne(cartId);
		if(cartEntity == null) {
			throw new ResourceNotFoundException("cart", "id", cartId);
		}
		
		OrderEntity entity = isExist(cartEntity, bill);
		if(entity == null) { // gio hang nay chua tung duoc thanh toan hoac chua hoan thanh viec thanh toan
			Long id = (long)bill.size() + 1;
			entity.setId(id);
			entity.setCart(cartEntity);
			bill.put(id, entity);
		}
		session.setAttribute("bill", entity);
		return entity;
	}
	
	private OrderEntity isExist(CartEntity cart, HashMap<Long, OrderEntity> bill) {
		for(Long id : bill.keySet()) {
			if(cart.getId().equals(bill.get(id).getCart().getId()) && bill.get(id).getStatus() != 2) {
				return bill.get(id);
			}
		}
		return null;
	}

}
