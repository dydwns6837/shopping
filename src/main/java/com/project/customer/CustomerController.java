package com.project.customer;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.customer.bo.CustomerBO;
import com.project.customer.entity.CustomerPost;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerBO customerBO;

    // 게시글 목록 보기 (JSP 뷰)
    @GetMapping("/customerBoard")
    public String showCustomerBoard(Model model) {
        List<CustomerPost> posts = customerBO.getAllPosts();
        model.addAttribute("posts", posts);
        return "customer/customerBoard"; // JSP 파일 경로
    }

    // 게시글 작성 폼
    @GetMapping("/create")
    public String createPostForm(Model model) {
        model.addAttribute("post", new CustomerPost());
        return "customer/createPost"; // JSP 파일 경로
    }

    // 게시글 작성 처리
    @PostMapping("/create")
    public String createPost(@ModelAttribute CustomerPost post) {
        post.setCreatedAt(LocalDateTime.now());
        customerBO.createOrUpdatePost(post);
        return "redirect:/customer/board";
    }

    // 게시글 상세 보기 (JSP 뷰)
    @GetMapping("/post/{id}")
    public String showPostDetails(@PathVariable Long id, Model model) {
        CustomerPost post = customerBO.getPostById(id);
        model.addAttribute("post", post);
        return "customer/postDetail"; // JSP 파일 경로
    }

    // 게시글 수정 폼
    @GetMapping("/edit/{id}")
    public String editPostForm(@PathVariable Long id, Model model) {
        CustomerPost post = customerBO.getPostById(id);
        model.addAttribute("post", post);
        return "customer/editPost"; // JSP 파일 경로
    }

    // 게시글 수정 처리
    @PostMapping("/edit/{id}")
    public String updatePost(@PathVariable Long id, @ModelAttribute CustomerPost post) {
        post.setId(id);
        post.setCreatedAt(LocalDateTime.now());
        customerBO.createOrUpdatePost(post);
        return "redirect:/customer/board";
    }

    // 게시글 삭제 처리
    @PostMapping("/delete/{id}")
    public String deletePost(@PathVariable Long id) {
        customerBO.deletePost(id);
        return "redirect:/customer/board";
    }
}