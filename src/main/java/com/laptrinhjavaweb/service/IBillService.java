package com.laptrinhjavaweb.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.laptrinhjavaweb.entity.OrderEntity;

public interface IBillService {

	OrderEntity saveToMap(HashMap<Long, OrderEntity> bill, HttpSession session, Long cartId);
}
