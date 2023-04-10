package com.laptrinhjavaweb.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bill")
public class OrderEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "status")
	private Integer status;
	
	@Column(name = "code")
	private String code;
	
	// tổng số tiền đơn của đơn hàng
	@Column(name = "total_payment")
	private Double total_payment;
	
	// số tiền còn lại của đơn hàng
	@Column(name = "unpaid_amount")
	private Double unpaid_amount;
	
	@Column(name = "date")
	private Date date;
	
	// n - 1 voi cart
	@ManyToOne
	@JoinColumn(name = "cart_id")
	private CartEntity cart; 
	
	// 1 order co nhieu cartItem
	@OneToMany(mappedBy = "order")
	List<CartItem> cartItems = new ArrayList<>();
	
	// 1 - 1 voi order detail
	@OneToOne(mappedBy = "order")
	private OrderDetail orderDetail;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public CartEntity getCart() {
		return cart;
	}

	public void setCart(CartEntity cart) {
		this.cart = cart;
	}

	public Long getId() {
		return id;
	}

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
}
