package com.laptrinhjavaweb.dto;

public class OrderDetailDto {
	
	private Long id;
	private String nameReceiver;
	private String phoneReceiver;
	private String nameBuyer;
	private String phoneBuyer;
	private String emailBuyer;
	private String village; // thôn
	private String conscious; // tỉnh
	private String district; // huyện
	private String commune; // xã
	private Double total;
	private String methodPayment;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
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
	public String getMethodPayment() {
		return methodPayment;
	}
	public void setMethodPayment(String methodPayment) {
		this.methodPayment = methodPayment;
	}
	
}
