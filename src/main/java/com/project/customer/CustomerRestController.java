package com.project.customer;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.customer.bo.CustomerBO;
import com.project.customer.entity.CustomerPost;

@RestController
@RequestMapping("/api/customer")
public class CustomerRestController {

    @Autowired
    private CustomerBO customerBO;

    // 모든 게시글 조회 (JSON 반환)
    @GetMapping("/posts")
    public List<CustomerPost> getAllPosts() {
        return customerBO.getAllPosts();
    }

    // 특정 게시글 조회 (JSON 반환)
    @GetMapping("/post/{id}")
    public CustomerPost getPostById(@PathVariable Long id) {
        return customerBO.getPostById(id);
    }

    // 게시글 작성 (JSON 처리)
    @PostMapping("/post")
    public CustomerPost createPost(@RequestBody CustomerPost post) {
        post.setCreatedAt(LocalDateTime.now());
        return customerBO.createOrUpdatePost(post);
    }

    // 게시글 수정 (JSON 처리)
    @PutMapping("/post/{id}")
    public CustomerPost updatePost(@PathVariable Long id, @RequestBody CustomerPost post) {
        post.setId(id);
        post.setCreatedAt(LocalDateTime.now());
        return customerBO.createOrUpdatePost(post);
    }

    // 게시글 삭제
    @DeleteMapping("/post/{id}")
    public void deletePost(@PathVariable Long id) {
        customerBO.deletePost(id);
    }
}