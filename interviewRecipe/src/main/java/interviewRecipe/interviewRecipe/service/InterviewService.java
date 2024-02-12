package interviewRecipe.interviewRecipe.service;

import interviewRecipe.interviewRecipe.dto.InterviewDto;
import interviewRecipe.interviewRecipe.mapper.InterviewMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@AllArgsConstructor
public class InterviewService {

    private final InterviewMapper interviewMapper;

    //주제 등록
    public int save(InterviewDto interviewDto){ return interviewMapper.save(interviewDto); }

    //주제 전체 조회
    public List<InterviewDto> interviewDtoList(Long userId){
        return interviewMapper.findAll(userId);
    }

    //주제 조회
    public InterviewDto getInterview(Long titleId){
         return interviewMapper.findOne(titleId);
    }

    //주제 수정
    public int update(InterviewDto interviewDto){
        InterviewDto interview = getInterview(interviewDto.getTitleId());
        interview = interview.builder()
                .titleId(interviewDto.getTitleId())
                .userId(interviewDto.getUserId())
                .title(interviewDto.getTitle())
                .updDt(LocalDateTime.now())
                .build();
        return interviewMapper.update(interview);
    }

    //주제 삭제
    public int delete(Long titleId){ return interviewMapper.delete(titleId);}



}
