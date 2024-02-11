package interviewRecipe.interviewRecipe.controller;

import interviewRecipe.interviewRecipe.dto.MemberDto;
import interviewRecipe.interviewRecipe.security.UserDetails;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
    @GetMapping
    public String login( ){

        return "index";
    }


    /* 회원가입 페이지
     *
     * */
    @GetMapping("/member/join")
    public String joinPage(){

        return "member/join";
    }

    @GetMapping("interview")
    public String interviewTest(){
        System.out.println("123123");
        return "/interview/interview";
    }


    // 메인 페이지

}
