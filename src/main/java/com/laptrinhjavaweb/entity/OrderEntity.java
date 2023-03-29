package com.laptrinhjavaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bill")
public class OrderEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long Id;
	
	@Column(name = "status")
	private Integer status;
	
	// n - 1 voi cart
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cart_id")
	private CartEntity cart;
	
	// 1 - 1 voi order detail
	@OneToOne(mappedBy = "orderEntity")
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
		return Id;
	}

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

	public void setId(Long id) {
		Id = id;
	}
	
}
