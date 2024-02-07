package interviewRecipe.interviewRecipe.service;

import interviewRecipe.interviewRecipe.dto.InterviewQueDto;
import interviewRecipe.interviewRecipe.mapper.InterviewQueMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@AllArgsConstructor
public class InterviewQueService {
    private final InterviewQueMapper interviewQueMapper;
    
    //질문 등록
    public int save(InterviewQueDto interviewQueDto){
        return interviewQueMapper.save(interviewQueDto);
    }
    //질문 전체 조회
    public List<InterviewQueDto> findAll(Long titleId){
        return interviewQueMapper.findAll(titleId);
    }
    //질문 상세 조회
    public InterviewQueDto finById(Long queId){
        return interviewQueMapper.finById(queId);
    }
    //질문 수정
    public int update(InterviewQueDto interviewQueDto){
        InterviewQueDto interviewQue = finById(interviewQueDto.getQueId());
        interviewQue = interviewQue.builder()
                .queId(interviewQueDto.getQueId())
                .titleId(interviewQueDto.getTitleId())
                .question(interviewQueDto.getQuestion())
                .updDt(LocalDateTime.now())
                .build();
        return interviewQueMapper.update(interviewQue);
    }
    //질문 삭제
    public int delete(Long queId){
        return interviewQueMapper.delete(queId);
    }
    //질문 순서 업데이트
}
