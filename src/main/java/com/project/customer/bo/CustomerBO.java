package com.project.customer.bo;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.customer.entity.CustomerPost;
import com.project.customer.repository.CustomerRepository;

@Service
public class CustomerBO {

    @Autowired
    private CustomerRepository customerRepository;

    // 게시글 목록 가져오기
    public List<CustomerPost> getAllPosts() {
        return customerRepository.findAll();
    }

    // 특정 게시글 조회
    public CustomerPost getPostById(Long id) {
        return customerRepository.findById(id).orElse(null);
    }

    // 게시글 생성 및 수정
    public CustomerPost createOrUpdatePost(CustomerPost post) {
        post.setCreatedAt(LocalDateTime.now());
        return customerRepository.save(post);
    }

    // 게시글 삭제
    public void deletePost(Long id) {
        customerRepository.deleteById(id);
    }
}