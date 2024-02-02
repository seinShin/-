package interviewRecipe.interviewRecipe.service;

import interviewRecipe.interviewRecipe.dto.InterviewDto;
import interviewRecipe.interviewRecipe.mapper.InterviewMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class InterviewService {

    private final InterviewMapper interviewMapper;

    //주제 등록
    public void save(InterviewDto interviewDto){
        interviewMapper.save(interviewDto);
    }

    //주제 전체 조회
    public List<InterviewDto> interviewDtoList(){
        return interviewMapper.findAll();
    }

    //주제 조회
    public InterviewDto getInterview(Long userId){
         return interviewMapper.findOne(userId);
    }

    //주제 수정
    public void update(InterviewDto interviewDto){
        interviewMapper.update(interviewDto);
    }



}
