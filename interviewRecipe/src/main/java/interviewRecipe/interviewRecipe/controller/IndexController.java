package interviewRecipe.interviewRecipe.controller;

import interviewRecipe.interviewRecipe.dto.MemberDto;
import interviewRecipe.interviewRecipe.mapper.MemberMapper;
import interviewRecipe.interviewRecipe.security.UserDetails;
import interviewRecipe.interviewRecipe.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.lang.reflect.Member;

@Controller
@RequestMapping("/")
@AllArgsConstructor
public class IndexController {

    private final MemberMapper memberMapper;
    /* 메인 페이지
     * 로그인 성공시 -> 메인 페이지
     * */
    @GetMapping("main")
    public String loginToMain(){
        return "main";
    }
//
//
//    /* 기본 로그인 페이지
//     *
//     * */
//    @GetMapping
//    public String login( ){
//
//        return "index";
//    }
//

    /* 회원가입 페이지
     *
     * */
//    @GetMapping("/member/join")
//    public String joinPage(){
//
//        return "member/join";
//    }

//    @GetMapping("interview")
//    public String interviewTest(){
//        System.out.println("123123");
//        return "/interview/interview";
//    }


    // 모든 메뉴 페이지
    @GetMapping("{menu}/{page}")
    public String interviewTest(@PathVariable String menu, @PathVariable String page, Model model){

        // 사용자 정보 세팅
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        MemberDto memberDto = memberMapper.findOne(authentication.getName());
        if(memberDto != null){
            model.addAttribute("userInfo" , memberDto);
        }
        
        // 공통 url 세팅
        String url;
        if(page == null){
            url= menu;
        }else{
            url= menu+"/"+page;
        }
        return url;
    }
}
