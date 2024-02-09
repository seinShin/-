package interviewRecipe.interviewRecipe.security;

import interviewRecipe.interviewRecipe.dto.MemberDto;
import interviewRecipe.interviewRecipe.mapper.MemberMapper;
import interviewRecipe.interviewRecipe.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.javassist.compiler.MemberResolver;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.lang.reflect.Member;
import java.util.Optional;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {

    private final MemberMapper memberMapper;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MemberDto memberDto = memberMapper.findOne(username);
        if(memberDto == null) throw new UsernameNotFoundException("---해당 유저를 찾을 수 없습니다.---");

        log.debug("로그인 성공 : "+ memberDto.toString());

        return new interviewRecipe.interviewRecipe.security.UserDetails(memberDto);
    }
}
