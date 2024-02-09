package interviewRecipe.interviewRecipe.controller;

import interviewRecipe.interviewRecipe.dto.MemberDto;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {

    /* 메인 페이지
     * 로그인 성공시 -> 메인 페이지
     * */
    @GetMapping("main")
    public String loginToMain(){
        return "main";
    }


    /* 기본 로그인 페이지
     *
     * */
    @GetMapping("")
    public String login( ){

        return "index";
    }


    @GetMapping("join")
    public String joinPage(){
        System.out.println("123123");
        return "/member/join";
    }


    @GetMapping("interview")
    public String interviewTest(){
        System.out.println("123123");
        return "/interview/interview";
    }


    // 메인 페이지

}
