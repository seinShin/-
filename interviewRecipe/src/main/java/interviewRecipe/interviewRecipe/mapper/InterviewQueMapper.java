package interviewRecipe.interviewRecipe.mapper;

import interviewRecipe.interviewRecipe.dto.InterviewDto;
import interviewRecipe.interviewRecipe.dto.InterviewQueDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.sql.SQLException;
import java.util.List;

@Mapper
public interface InterviewQueMapper{
    // 질문 등록
    int save(InterviewQueDto interviewQueDto);

    // 질문 전체 조회
    List<InterviewQueDto> findAll(Long titleId);

    // 질문 조회
    InterviewQueDto finById(Long titleId);

    // 질문 변경
    int update(InterviewQueDto interviewQueDto);

    //질문 삭제
    int delete(Long queId);

    //질문 순서 변경
}

