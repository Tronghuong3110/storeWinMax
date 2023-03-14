package com.laptrinhjavaweb.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration // de su dung dc cac config trong spring mvc
@EnableTransactionManagement // de giup thuc hien tu dong cac thao tac: mo connection, dong connection
// commit, rollback, close tat ca ca doi tuong dung( vd doi tuong EntityManager,...)
@EnableJpaRepositories(basePackages = {"com.laptrinhjavaweb.repository"}) // khai bao de su dung duoc cac method cua jpaRepository
public class JpaConfig {
	
	// cai dat entity manager factory
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
		em.setPersistenceUnitName("persistence-data"); // tên file chứa chất xúc tác để table trong database và các entity class có thể liên kết được với nhau(persistence.xml)
		em.setDataSource(dataSource()); // dataSource(): nơi cung cấp thông tin của database để có thể kết nối vd như url, driver,...
		JpaVendorAdapter vender = new HibernateJpaVendorAdapter(); //
		em.setJpaVendorAdapter(vender); //
		em.setJpaProperties(addtionalProperties()); // jpaProperties: nơi chưa tất cả cấu hình của jpa để bật các tính năng 
		return em;
	}
	
	// cung cap thong tin de LocalContainerEntityManagerFactoryBean(entity manager factory) ket noi database (getConnection trong jdbc)
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		dataSource.setUrl("jdbc:sqlserver://localhost;database=store_winmax");
		dataSource.setUsername("project");
		dataSource.setPassword("1234");
		return dataSource;
	}
	
	// bật tính năng tự động quản lí entity transaction của jpa(khởi tạo transaction, commit, rollback,...)
	// gồm 2 method: JpaTransactionManager và PersistenceExceptionTranslationPostProcessor
	@Bean
	protected JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
		JpaTransactionManager transaction = new JpaTransactionManager();
		transaction.setEntityManagerFactory(entityManagerFactory);
		return transaction;
	}
	
	@Bean
	protected PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}
	
	private Properties addtionalProperties() {
		Properties properties = new Properties();
//		properties.setProperty("hibernate.hbm2ddl.auto", "create");
		properties.setProperty("hibernate.hbm2ddl.auto", "none");
//		properties.setProperty("hibernate.hbm2ddl.auto", "update");
		properties.setProperty("hibernate.enable_lazy_load_no_trans", "true");
		return properties;
	}
}
