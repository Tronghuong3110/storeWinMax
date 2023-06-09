package com.laptrinhjavaweb.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.entity.TypeEntity;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, Long>{
	@Query(value = "select top 6 * from product order by NEWID()", nativeQuery = true)
	public List<ProductEntity> getData();
	
	@Query(value = "select p.* from product as p inner join category on p.category_Id = category.id where category.code = ?1", nativeQuery = true)
	public List<ProductEntity> findAllByCategoryCode(String code);
	
	@Query(value = "select p.* from product as p inner join category on p.category_Id = category.id where category.id = ?1", nativeQuery = true)
	public List<ProductEntity> findAllByCategoryId(Long id);
	
	@Query(value = "select * from product", nativeQuery = true)
	public List<ProductEntity> test();
	
	public ProductEntity findOneBySizeAndTypeAndCategoryEntity(String size, TypeEntity type, CategoryEntity category);
}
