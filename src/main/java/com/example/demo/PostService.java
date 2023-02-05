package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PostService {

    @Autowired
    PostRepository postRepository;

    @Transactional
    public void post(Post post){
        postRepository.save(post);
    }

    @Transactional(readOnly = true)
    public List<Post> findAll(){
        List<Post> posts = postRepository.findAll();
        return posts;
    }

    @Transactional(readOnly = true)
    public Post findById(int id){
        Post post = postRepository.getById(id);
        return post;
    }

    @Transactional
    public void remove(int id){
        postRepository.deleteById(id);
    }

    public Post update(int id, PostDto postDto) {

        Post findPost = postRepository.getById(id);
        findPost.setTitle(postDto.getTitle());
        findPost.setContents(postDto.getContents());
        postRepository.save(findPost);
        return findPost;
    }

}
