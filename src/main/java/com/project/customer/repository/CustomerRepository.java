package com.project.customer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.customer.entity.CustomerPost;

@Repository
public interface CustomerRepository extends JpaRepository<CustomerPost, Long> {
}