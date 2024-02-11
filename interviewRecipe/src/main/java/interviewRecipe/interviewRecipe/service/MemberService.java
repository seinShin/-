package interviewRecipe.interviewRecipe.service;

import interviewRecipe.interviewRecipe.dto.MemberDto;
import interviewRecipe.interviewRecipe.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class MemberService {
    private final MemberMapper memberMapper;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    // 회원가입
    public int joinUser(MemberDto memberDto){
        MemberDto member = MemberDto.builder()
                .userNm(memberDto.getUserNm())
                .userNick(memberDto.getUserNick())
                .userPw(bCryptPasswordEncoder.encode(memberDto.getUserPw()))
                .groupCd(memberDto.getGroupCd())
                .build();
        return memberMapper.join(member);
    }
}
