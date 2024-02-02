package interviewRecipe.interviewRecipe.mapper;

import interviewRecipe.interviewRecipe.dto.InterviewDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InterviewMapper {

    // 주제 등록
    void save(InterviewDto interviewDto);

    // 주제 전체 조회
    List<InterviewDto> findAll();

    // 주제 조회
    InterviewDto findOne(Long userId);

    // 주제 수정
    void update(InterviewDto interviewDto);
}

