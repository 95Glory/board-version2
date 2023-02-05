package com.example.demo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepository extends JpaRepository<Post,Integer> {

    Page<Post> findAll(Pageable pageable);
    Page<Post> findByTitleContaining(String username, Pageable pageable);
    Page<Post> findByContentsContaining(String email, Pageable pageable);
}
