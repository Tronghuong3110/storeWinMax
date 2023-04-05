package com.laptrinhjavaweb.dto;

import java.sql.Date;

public class OrderDto implements Comparable<OrderDto>{
	private Long id;
	private String code;
	private Double total_payment;
	private Double unpaid_amount;
	private String mess;
	private Date date;
	private CartItemDto cartItem; // danh sach san pham
	private OrderDetailDto orderDetail; // thong tin nguoi mua, nhan
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public OrderDetailDto getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(OrderDetailDto orderDetail) {
		this.orderDetail = orderDetail;
	}
	public CartItemDto getCartItem() {
		return cartItem;
	}
	public void setCartItem(CartItemDto cartItem) {
		this.cartItem = cartItem;
	}
	public Double getTotal_payment() {
		return total_payment;
	}
	public void setTotal_payment(Double total_payment) {
		this.total_payment = total_payment;
	}
	public Double getUnpaid_amount() {
		return unpaid_amount;
	}
	public void setUnpaid_amount(Double unpaid_amount) {
		this.unpaid_amount = unpaid_amount;
	}
	public String getMess() {
		return mess;
	}
	public void setMess(String mess) {
		this.mess = mess;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public int compareTo(OrderDto o) {
		return o.date.compareTo(this.date);
	}
	
}
