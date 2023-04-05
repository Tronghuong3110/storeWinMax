package com.laptrinhjavaweb.dto;

import java.sql.Date;
import java.util.List;

public class ResponseDto<T, S> implements Comparable<ResponseDto<T, S>>{
	
	private T name;
	private String mess;
	private Date date;
	private Double unpaid_amount;
	private List<S> values;
	
	
	public ResponseDto(T name, List<S> values) {
		super();
		this.name = name;
		this.values = values;
	}
	
	
	public ResponseDto(T name, String mess, List<S> values) {
		super();
		this.name = name;
		this.mess = mess;
		this.values = values;
	}
	

	public ResponseDto(T name, String mess, Double unpaid_amount, List<S> values) {
		super();
		this.name = name;
		this.mess = mess;
		this.unpaid_amount = unpaid_amount;
		this.values = values;
	}


	public T getName() {
		return name;
	}
	public void setName(T name) {
		this.name = name;
	}
	public List<S> getValues() {
		return values;
	}
	public void setValues(List<S> values) {
		this.values = values;
	}

	public String getStatus() {
		return mess;
	}


	public void setStatus(String mess) {
		this.mess = mess;
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


	@Override
	public int compareTo(ResponseDto<T, S> o) {
		return o.date.compareTo(this.date);
	}
}
