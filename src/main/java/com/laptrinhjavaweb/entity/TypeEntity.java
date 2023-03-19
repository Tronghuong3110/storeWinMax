package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "type")
public class TypeEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "shape", columnDefinition = "nvarchar(150)", nullable = false)
	private String shape;
	
	@Column(name = "lo_ren", length = 20)
	private String loRen;
	
	@Column(name = "img")
	private String img;
	
	@Column(name = "code")
	private String code;
	
	// ket noi 1 - n voi productEntity
	@OneToMany(mappedBy = "type", cascade = CascadeType.ALL)
	private List<ProductEntity> products = new ArrayList<>();

	public String getShape() {
		return shape;
	}

	public void setShape(String shape) {
		this.shape = shape;
	}

	public String getLoRen() {
		return loRen;
	}

	public void setLoRen(String loRen) {
		this.loRen = loRen;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Long getId() {
		return id;
	}

	public List<ProductEntity> getProducts() {
		return products;
	}

	public void setProducts(List<ProductEntity> products) {
		this.products = products;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
