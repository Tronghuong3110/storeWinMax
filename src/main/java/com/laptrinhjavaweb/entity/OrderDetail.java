package com.laptrinhjavaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "bill_detail")
public class OrderDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "name_receiver", columnDefinition = "nvarchar(150)")
	private String nameReceiver;
	
	@Column(name = "phone_receiver", length = 12)
	private String phoneReceiver;
	
	@Column(name = "name_buyer", columnDefinition = "nvarchar(150)")
	private String nameBuyer;
	
	@Column(name = "phone_buyer", length = 12)
	private String phoneBuyer;
	
	@Column(name = "email_buyer", columnDefinition = "varchar(150)")
	private String emailBuyer;
	
	@Column(name = "village", columnDefinition = "nvarchar(150)")
	private String village; // thôn
	
	@Column(name = "conscious", columnDefinition = "nvarchar(150)")
	private String conscious; // tỉnh
	
	@Column(name = "district", columnDefinition = "nvarchar(150)")
	private String district; // huyện
	
	@Column(name = "commune", columnDefinition = "nvarchar(150)")
	private String commune; // xã
	
	@Column(name = "total")
	private Double total; // tong tien can thanh toan
	
	@Column(name = "method_payment", columnDefinition = "nvarchar(150)")
	private String methodPayment;
	
	@OneToOne
	@JoinColumn(name = "bill_id")
	private OrderEntity order;

	public String getNameReceiver() {
		return nameReceiver;
	}

	public void setNameReceiver(String nameReceiver) {
		this.nameReceiver = nameReceiver;
	}

	public String getPhoneReceiver() {
		return phoneReceiver;
	}

	public void setPhoneReceiver(String phoneReceiver) {
		this.phoneReceiver = phoneReceiver;
	}

	public String getNameBuyer() {
		return nameBuyer;
	}

	public void setNameBuyer(String nameBuyer) {
		this.nameBuyer = nameBuyer;
	}

	public String getPhoneBuyer() {
		return phoneBuyer;
	}

	public void setPhoneBuyer(String phoneBuyer) {
		this.phoneBuyer = phoneBuyer;
	}

	public String getEmailBuyer() {
		return emailBuyer;
	}

	public void setEmailBuyer(String emailBuyer) {
		this.emailBuyer = emailBuyer;
	}

	public String getVillage() {
		return village;
	}

	public void setVillage(String village) {
		this.village = village;
	}

	public String getConscious() {
		return conscious;
	}

	public void setConscious(String conscious) {
		this.conscious = conscious;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getCommune() {
		return commune;
	}

	public void setCommune(String commune) {
		this.commune = commune;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Long getId() {
		return id;
	}

	public String getMethodPayment() {
		return methodPayment;
	}

	public void setMethodPayment(String methodPayment) {
		this.methodPayment = methodPayment;
	}

	public OrderEntity getOrder() {
		return order;
	}

	public void setOrder(OrderEntity order) {
		this.order = order;
	}
	
}
