package interviewRecipe.interviewRecipe.mapper;

import interviewRecipe.interviewRecipe.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    //로그인 조회
    MemberDto findOne(String userNm);
//  Optional<MemberDto> findOne(String userNm);

    //회원가입
    int join(MemberDto memberDto);

    //아이디 중복 체크
    int idChk(String userNick);
}
