package com.laptrinhjavaweb.dto;

public class ProductDto{
	
	private Long id;
	private String name;
	private Float price;
	private String size;
	private CategoryDto category;
	private TypeDto type;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public CategoryDto getCategory() {
		return category;
	}
	public void setCategory(CategoryDto category) {
		this.category = category;
	}
	public TypeDto getType() {
		return type;
	}
	public void setType(TypeDto type) {
		this.type = type;
	}
	
}
