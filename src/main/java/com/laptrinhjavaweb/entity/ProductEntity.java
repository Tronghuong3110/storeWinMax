package com.laptrinhjavaweb.entity;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
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
@Table(name = "product")
public class ProductEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "name_product", nullable = false, columnDefinition = "nvarchar(150)")
	private String name_product;
	
	@Column(name = "size", nullable = false)
	private String size;
	
	@Column(name = "price", nullable = false)
	private Float price;
	
	@Column(name = "short_decription")
	private String shortdecription;
	
	@Column(name = "create_date")
	private Timestamp create_Date;
	
	@Column(name = "create_by", length = 150)
	private String create_By;
	
	@Column(name = "thumbnail", nullable = false)
	private String thumbnail;
	
	// kết nối với n - 1 voi category
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_Id")
	private CategoryEntity categoryEntity;
	
	//ket noi n - 1 voi typeEntity
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "type_id")
	private TypeEntity type;
	
	// 1 - 1 voi cart item - cart item dai dien cho 1 san pham trong gio hang
	@OneToOne(mappedBy = "product", fetch = FetchType.LAZY)
	private CartItem cartItem;
	
	public String getName_product() {
		return name_product;
	}

	public void setName_product(String name_product) {
		this.name_product = name_product;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getShortdecription() {
		return shortdecription;
	}

	public void setShortdecription(String shortdecription) {
		this.shortdecription = shortdecription;
	}

	public Timestamp getCreate_Date() {
		return create_Date;
	}

	public void setCreate_Date(Timestamp create_Date) {
		this.create_Date = create_Date;
	}

	public String getCreate_By() {
		return create_By;
	}

	public void setCreate_By(String create_By) {
		this.create_By = create_By;
	}

	public Long getId() {
		return id;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public CategoryEntity getCategoryEntity() {
		return categoryEntity;
	}

	public void setCategoryEntity(CategoryEntity categoryEntity) {
		this.categoryEntity = categoryEntity;
	}

	public TypeEntity getType() {
		return type;
	}

	public void setType(TypeEntity type) {
		this.type = type;
	}

	
	public CartItem getCartItem() {
		return cartItem;
	}

	public void setCartItem(CartItem cartItem) {
		this.cartItem = cartItem;
	}

}
