package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.OrderEntity;

@Repository
public interface BillRepository extends JpaRepository<OrderEntity, Long>{
	OrderEntity findOneByCart_Id(Long cartId);
	
	@Query(value = "select code from bill where id = ?1", nativeQuery = true)
	String getCode(Long id);
	
	@Query(value = "select status from bill where id = ?1", nativeQuery = true)
	Integer getStatus(Long id);
}
