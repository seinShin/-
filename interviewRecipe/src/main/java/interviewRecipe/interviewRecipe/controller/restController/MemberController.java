package interviewRecipe.interviewRecipe.controller.restController;

import interviewRecipe.interviewRecipe.dto.MemberDto;
import interviewRecipe.interviewRecipe.service.MemberService;
import lombok.AllArgsConstructor;
import org.apache.coyote.Response;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;
    
    // 회원가입
    @PostMapping("/join")
    public ResponseEntity<Integer> join(@RequestBody MemberDto memberDto){
        int rst = memberService.joinUser(memberDto);
        if(rst == 1){
                // 회원가입에 성공하면 자동 로그인
                // 새로운 회원의 정보로 Authentication 객체 생성
                Authentication authentication = new UsernamePasswordAuthenticationToken(
                        memberDto.getUserNick(), // 사용자 이름
                        memberDto.getUserPw()  // 비밀번호
                );

                // 현재 SecurityContext에 인증 객체 설정
                SecurityContextHolder.getContext().setAuthentication(authentication);
        }
        return ResponseEntity.ok(rst);
    }

    // 아이디 중복 검사
    @GetMapping("/idChk")
    public ResponseEntity<Boolean> idChk(@RequestParam String userNick){
        return memberService.idChk(userNick);
    }
}
