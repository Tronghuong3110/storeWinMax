package com.laptrinhjavaweb.service.impl;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.CartItemConverter;
import com.laptrinhjavaweb.converter.OrderConverter;
import com.laptrinhjavaweb.converter.OrderDetailConverter;
import com.laptrinhjavaweb.dto.CartItemDto;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.dto.OrderDetailDto;
import com.laptrinhjavaweb.dto.OrderDto;
import com.laptrinhjavaweb.dto.ResponseDto;
import com.laptrinhjavaweb.entity.CartEntity;
import com.laptrinhjavaweb.entity.CartItem;
import com.laptrinhjavaweb.entity.OrderDetail;
import com.laptrinhjavaweb.entity.OrderEntity;
import com.laptrinhjavaweb.exception.APIException;
import com.laptrinhjavaweb.exception.ResourceNotFoundException;
import com.laptrinhjavaweb.repository.BillDetailRepository;
import com.laptrinhjavaweb.repository.BillRepository;
import com.laptrinhjavaweb.repository.CartItemRepository;
import com.laptrinhjavaweb.repository.CartRepository;
import com.laptrinhjavaweb.service.IBillService;
import com.laptrinhjavaweb.utils.ConstantsUtil;

@Service
public class BillService implements IBillService{

	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private BillRepository billRepository;
	
	@Autowired
	private BillDetailRepository billDetailRepository;
	
	@Autowired
	private CartItemRepository cartItemRepository;
	
	// tao ma don hang cho client thuc hien chuyen khoan
	@Override
	public String generatePaymentCode() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MyUser user = (MyUser)auth.getPrincipal();
		
		String input = UUID.randomUUID().toString() + user.getId() + System.currentTimeMillis();
		String paymentCode = null;
	
		try {
			MessageDigest mess = MessageDigest.getInstance("MD5"); // su dung thuat toan MD5 de ma hoa
			byte[] md = mess.digest(input.getBytes()); // ma hoa chuoi dau vao
			BigInteger code = new BigInteger(1, md);
			paymentCode = code.toString(16);
 		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return paymentCode.substring(0, 11).toUpperCase();
	}

	// add bill
	@Override
	public OrderDetailDto addBill(OrderDetailDto order, String code) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MyUser user = (MyUser)auth.getPrincipal();
		
		// lay gio hang cua user
		CartEntity cart = cartRepository.findByUserId(user.getId());
		
		if(cart == null) {
			throw new ResourceNotFoundException("cart", "user_id", user.getId());
		}
		
		if(!ConstantsUtil.isNumber(order.getPhoneBuyer()) || order.getPhoneBuyer().length() != 10) {
			throw new APIException(HttpStatus.BAD_REQUEST, "Số điện thoại người mua không họp lệ");
		}
		
		if(!ConstantsUtil.isNumber(order.getPhoneReceiver()) || order.getPhoneReceiver().length() != 10) {
			throw new APIException(HttpStatus.BAD_REQUEST, "Số điện thoại người nhận không hợp lệ");
		}
		
		if(!ConstantsUtil.vadidate(order.getEmailBuyer())) {
			throw new APIException(HttpStatus.BAD_REQUEST, "Email người mua không hợp lệ ");
		}
		
		OrderEntity entity = new OrderEntity();
		entity.setCart(cart);
		entity.setStatus(0);
		entity.setCode(code.toUpperCase());
		entity.setTotal_payment(order.getTotal());
		entity.setUnpaid_amount(order.getTotal());
		entity.setDate(new java.sql.Date(System.currentTimeMillis()));
		entity = billRepository.save(entity);
		
		// set order to cartItem
		updateCartItemWithOrderId(cart.getId(), entity);
		
		OrderDetail orderDetail = OrderDetailConverter.toEntity(order); // convert from dto to entity
		orderDetail.setOrder(entity);
		orderDetail = billDetailRepository.save(orderDetail);
		updateCartItem(cart.getId());
		return OrderDetailConverter.toDto(orderDetail);
	}
	
	// xoa tất cả sản phẩm có trong giỏ hàng sau khi tiến hành thanh toán thành công
	private void updateCartItem(Long cartId) {
		List<CartItem> list = cartItemRepository.findAllByCart_Id(cartId);
		for(CartItem cartItem : list) {
			cartItem.setStatus(1);
			cartItemRepository.save(cartItem);
		}
	}
	
	// add bill_Id vào cartItem khi client tiến hành đặt hàng
	private void updateCartItemWithOrderId(Long cartIId, OrderEntity order) {
		// tim tat ca cartItem co trong gio hang ma chua duoc thanh toan
		List<CartItem> cartItems = cartItemRepository.findAllByCart_IdAndStatus(cartIId, 0);
		for(CartItem cartItem : cartItems) {
			cartItem.setOrder(order);
			cartItemRepository.save(cartItem);
		}
	}

	// get list bill (hash(role = admin))
	@Override
	public List<OrderDto> getListBill() {
		List<OrderEntity> listEntity = billRepository.findAll();
		List<OrderDto> results = new ArrayList<>();
		for(OrderEntity entity : listEntity) {
			OrderDto dto = OrderConverter.toDto(entity);
			dto.setMess(solve(entity));
			results.add(dto);
		}
		Collections.sort(results);
		return results;
	}
	
	private String solve(OrderEntity order) {
			
			double percent = order.getUnpaid_amount() / order.getTotal_payment();
			DecimalFormat df = new DecimalFormat("#.#");
			String mess = "";
			
			// TH thanh toan xong
			if(percent == 0) {
				mess = "Đã thanh toán";
			}
			
			// Th chua thanh toan 
			else if(percent == 1) {
				mess = "Chưa thanh toán";
			}
			
			// TH hop da dat coc
			else { 
				percent  *= 100;
				mess = "Đã thanh toán " + df.format(100 - percent) + "%";
			}
			return mess;
		}

	@Override
	public void update(Long id, Double payments) {
		// tim bill co id
		OrderEntity entity = billRepository.findOne(id);
		if(entity == null) {
			throw new ResourceNotFoundException("bill", "id", id);
		}
		Double total =  entity.getTotal_payment();
		entity.setUnpaid_amount(total - payments);
		billRepository.save(entity);
	}

	@Override
	public ResponseDto<OrderDetailDto, CartItemDto> findOne(Long id) {
		ResponseDto<OrderDetailDto, CartItemDto> response = new ResponseDto<OrderDetailDto, CartItemDto>();
		OrderEntity order = billRepository.findOne(id);
		if(order == null) {
			throw new ResourceNotFoundException("bill", "id", id);
		}
		
		// tim ra orderDetail
		OrderDetail orderDetail = billDetailRepository.findByOrder_Id(id);
		if(orderDetail == null) {
			throw new ResourceNotFoundException("billDetail", "bill_id", id);
		}
		
		// get list cartItem
		List<CartItem> listCartItem = cartItemRepository.findAllByOrder_Id(id);
		List<CartItemDto> listResult = new ArrayList<>();
		for(CartItem entity : listCartItem) {
			listResult.add(CartItemConverter.toDto(entity));
		}
		response.setName(OrderDetailConverter.toDto(orderDetail));
		response.setValues(listResult);
		response.setDate(order.getDate());
		response.setStatus(order.getCode());
		return response;
	}
	
}
