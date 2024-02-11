package interviewRecipe.interviewRecipe.controller.restController;

import interviewRecipe.interviewRecipe.dto.MemberDto;
import interviewRecipe.interviewRecipe.service.MemberService;
import lombok.AllArgsConstructor;
import org.apache.coyote.Response;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;
    
    // 회원가입
    @PostMapping("/join")
    public ResponseEntity<Integer> join(@RequestBody MemberDto memberDto){
        return ResponseEntity.ok(memberService.joinUser(memberDto));
    }


}
