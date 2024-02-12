package interviewRecipe.interviewRecipe.mapper;

import interviewRecipe.interviewRecipe.dto.InterviewDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InterviewMapper {

    // 주제 등록
    int save(InterviewDto interviewDto);

    // 주제 전체 조회
    List<InterviewDto> findAll(Long userId);

    // 주제 조회
    InterviewDto findOne(Long titleId);

    // 주제 수정
    int update(InterviewDto interviewDto);

    // 주제 삭제
    int delete(Long titleId);
}

