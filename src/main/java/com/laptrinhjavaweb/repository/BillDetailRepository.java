package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.OrderDetail;

@Repository
public interface BillDetailRepository extends JpaRepository<OrderDetail, Long>{

}
