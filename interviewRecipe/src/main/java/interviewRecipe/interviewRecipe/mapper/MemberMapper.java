package interviewRecipe.interviewRecipe.mapper;

import interviewRecipe.interviewRecipe.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface MemberMapper {

    //로그인 조회
    MemberDto findOne(String userNm);
//    Optional<MemberDto> findOne(String userNm);
}
