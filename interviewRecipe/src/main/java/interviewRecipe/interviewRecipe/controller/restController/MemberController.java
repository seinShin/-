package interviewRecipe.interviewRecipe.controller.restController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/member")
public class MemberController {


    @GetMapping("join")
    public String joinPage(){
        System.out.println("023123");
        return "/member/join";
    }
}
