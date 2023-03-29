package com.laptrinhjavaweb.api.web;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.entity.OrderEntity;
import com.laptrinhjavaweb.service.IBillService;

@RestController(value = "ApiOfPaymentOfWeb")
public class PaymentApi {
	
	@Autowired
	private IBillService billService;
	
	@PostMapping("/api/payment")
	public OrderEntity addBillToTmp(HttpSession session, @RequestParam Long cartId) {
		if(session.getAttribute("bill") == null) {
			session.setAttribute("bill", new HashMap<Long, OrderEntity>());
		}
		HashMap<Long, OrderEntity> bill = (HashMap<Long, OrderEntity>) session.getAttribute("bill");
		
		OrderEntity entity = billService.saveToMap(bill, session, cartId);
		return entity;
	}
}
