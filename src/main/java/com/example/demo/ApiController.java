package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class ApiController {

    @Autowired
    PostService postService;

    //게시글 삭제
    @DeleteMapping("/remove/{id}")
    public void remove(@PathVariable int id){
        postService.remove(id);
    }

    //게시글 수정
    @PutMapping("/post/update/{id}")
    public Post update(@PathVariable int id,PostDto postDto){

        Post updatePost = postService.update(id,postDto);
        return updatePost;
    }


}
