package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class Contorller {

    @Autowired
    PostService postService;

    @Autowired
    PostRepository postRepository;

    // 메인화면 & 게시글 리스트 화면
    @GetMapping("/")
    public String home(Model model){
        List<Post> posts = postService.findAll();
        model.addAttribute("posts",posts);
        return "postList";
    }

    // 게시글 작성화면
    @GetMapping("/postForm")
    public String postList(){
        return "postForm";
    }

    //게시글 하나 보기 화면
    @GetMapping("/post/view/{id}")
    public String postView(@PathVariable int id,Model model){
        Post post = postService.findById(id);
        model.addAttribute("posts",post);
        return "postView";
    }

    //게시글 수정 화면
    @GetMapping("/post/update/{id}")
    public String postUpdate(@PathVariable int id,Model model){
        Post post = postService.findById(id);
        System.out.println("controller단 post"+post);
        model.addAttribute("posts",post);
        return "postUpdate";
    }


    //form 태그에서의 게시글 작성 api
    @PostMapping("/postForm")
    public String post(Post post,Model model){
        postService.post(post);
        List<Post> posts = postService.findAll();
        model.addAttribute("posts",posts);
        return "postList";
    }

    //게시글 페이징 처리
    @GetMapping("/postpage")
    public String postpaging(Model model,
                           @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC)
                           Pageable pageable,
                           @RequestParam(required = false, defaultValue = "") String field,
                           @RequestParam(required = false, defaultValue = "") String word) {

        Page<Post> plist = postRepository.findAll(pageable);

        if(field.equals("title")) {
            plist = postRepository.findByTitleContaining(field, pageable);
        }else if(field.equals("contents")){
            plist = postRepository.findByContentsContaining(word, pageable);
        }



        int pageNumber=plist.getPageable().getPageNumber(); //현재페이지
        int totalPages=plist.getTotalPages(); //총 페이지 수. 검색에따라 10개면 10개..
        int pageBlock = 5; //블럭의 수 1, 2, 3, 4, 5
        int startBlockPage = ((pageNumber)/pageBlock)*pageBlock+1; //현재 페이지가 7이라면 1*5+1=6
        int endBlockPage = startBlockPage+pageBlock-1; //6+5-1=10. 6,7,8,9,10해서 10.
        endBlockPage= totalPages<endBlockPage? totalPages:endBlockPage;

        model.addAttribute("startBlockPage", startBlockPage);
        model.addAttribute("endBlockPage", endBlockPage);
        model.addAttribute("plist", plist);

        return "/postListPage";
    }
}
