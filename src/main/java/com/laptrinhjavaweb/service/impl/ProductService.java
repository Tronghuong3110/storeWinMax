package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.ProductConverter;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.dto.ProductDto;
import com.laptrinhjavaweb.entity.CartItem;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.entity.TypeEntity;
import com.laptrinhjavaweb.exception.APIException;
import com.laptrinhjavaweb.exception.ResourceNotFoundException;
import com.laptrinhjavaweb.repository.CartItemRepository;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.repository.TypeRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IProductService;

@Service
public class ProductService implements IProductService{

	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private TypeRepository typeRepository;
	
	@Autowired
	private CategoryRepository categoryReposirory;
	
	@Autowired
	private CartItemRepository cartItemRepository;
	
	@Override
	public List<ProductDto> getData() {
		List<ProductEntity> list = productRepository.getData();
		List<ProductDto> res = new ArrayList<>();
		for(ProductEntity product : list) {
			res.add(ProductConverter.toDTO(product));
		}
		return res;
	} 

	@Override
	public List<ProductDto> findByCategoryCode(String code) {
		List<ProductEntity> list = productRepository.findAllByCategoryCode(code);
		List<ProductDto> res = new ArrayList<>();
		for(ProductEntity product : list) {
			res.add(ProductConverter.toDTO(product));
		}
		return res;
	}

	@Override
	public List<ProductDto> findAllPageable(Pageable pageable) {
		List<ProductEntity> list = productRepository.findAll(pageable).getContent();
		List<ProductDto> products = new ArrayList<>();
		for(ProductEntity product : list) {
			products.add(ProductConverter.toDTO(product));
		}
		return products;
	}

	@Override
	public Integer count() {
		return (int) productRepository.count();
	}

	@Override
	public ProductDto findOne(long id) {
		ProductEntity entity = productRepository.findOne(id);
		return  ProductConverter.toDTO(entity);
	}

	@Override
	public List<ProductDto> findByCategoryId(Long id) {
		List<ProductEntity> list = productRepository.findAllByCategoryId(id);
		List<ProductDto> res = new ArrayList<>();
		for(ProductEntity product : list) {
			res.add(ProductConverter.toDTO(product));
		}
		return res;
	}

	@Override
	public List<ProductDto> findAll() {
		List<ProductEntity> list = productRepository.findAll();
		List<ProductDto> res = new ArrayList<>();
		for(ProductEntity product : list) {
			res.add(ProductConverter.toDTO(product));
		}
		return res;
	}

	@Override
	public ProductDto updateOrCreateProduct(ProductDto product, Long categoryId, Long typeId){
		try {
			Float price = product.getPrice();
			if(price < 0) {
				throw new APIException(HttpStatus.BAD_REQUEST, "Price is INVALID");
			}
			
			ProductEntity entity =  new ProductEntity();
			if(checkUpdateOrCreate(product)) {
				entity =  updateProduct(product, categoryId, typeId);
			}
			
			else {
				entity = createProduct(product);
			}
			
			entity = productRepository.save(entity);
			return ProductConverter.toDTO(entity);
		} catch(Exception e) {
			e.printStackTrace();
			throw new APIException(HttpStatus.BAD_REQUEST, "loi");
		}
	}

	private boolean checkUpdateOrCreate(ProductDto product) {
		if(product.getId() == null) {
			return false;
		}
		return true;
	}
	
	// update product
	private ProductEntity updateProduct(ProductDto product, Long categoryId, Long typeId) {
		// tim product old
		ProductEntity oldProductEntity = productRepository.findOne(product.getId());
		TypeEntity type = checkType(oldProductEntity, typeId); // ktra type cua san pham cu va moi co trung nhau khong
		CategoryEntity category = checkCategory(oldProductEntity, categoryId); // ktra category cua san pham cu va moi co trung nhau khong
		ProductEntity newProduct = ProductConverter.updateEntity(oldProductEntity, product);
		newProduct.setType(type);
		newProduct.setCategoryEntity(category);
		return newProduct;
	}
	
	// create product
	private ProductEntity createProduct(ProductDto product) {
		ProductEntity entity = null;
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MyUser myUser = (MyUser) auth.getPrincipal();
		
		CategoryEntity category = categoryReposirory.findOne(product.getCategory().getId());
		if(category == null) {
			new ResourceNotFoundException("category", "id", product.getCategory().getId());
		}
		
		TypeEntity type = typeRepository.findOne(product.getType().getId());
		if(type == null) {
			throw new ResourceNotFoundException("type", "id", product.getType().getId());
		}
		String size = product.getSize();
		entity = productRepository.findOneBySizeAndTypeAndCategoryEntity(size, type, category);
		if(entity != null) {
			throw new APIException(HttpStatus.BAD_REQUEST, "could not add product exist");
		}
		
		entity = ProductConverter.toEntity(product);
		entity.setCategoryEntity(category);
		entity.setType(type);
		entity.setCreate_By(myUser.getUsername());
		return entity;
	}
	
	private TypeEntity checkType(ProductEntity product, Long typeId) {
		if(product.getType().getId().equals(typeId)) {
			return product.getType();
		}
		return typeRepository.findOne(typeId);
	}
	
	private CategoryEntity checkCategory(ProductEntity product, Long categoryId) {
		if(product.getType().getId().equals(categoryId)) {
			return product.getCategoryEntity();
		}
		return categoryReposirory.findOne(categoryId);
	}

	@Override
	public void deleteProduct(Long productId) {
		List<CartItem> cartItems = cartItemRepository.findByProductId(productId);
		for(CartItem cartItem : cartItems) {
			cartItemRepository.delete(cartItem.getId());
		}
		
		productRepository.delete(productId);
	}
}
