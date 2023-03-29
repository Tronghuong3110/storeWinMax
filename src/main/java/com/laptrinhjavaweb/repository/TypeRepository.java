package com.laptrinhjavaweb.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.TypeEntity;

@Repository
public interface TypeRepository extends JpaRepository<TypeEntity, Long>{

	TypeEntity findOneByLoRenAndCode(String loRen, String code);
	
}
