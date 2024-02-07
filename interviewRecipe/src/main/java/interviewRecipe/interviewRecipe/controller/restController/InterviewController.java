package interviewRecipe.interviewRecipe.controller.restController;

import interviewRecipe.interviewRecipe.dto.InterviewDto;
import interviewRecipe.interviewRecipe.service.InterviewService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/v1/interview")
@AllArgsConstructor
public class InterviewController {

    private final InterviewService interviewService;

    //주제 등록
    @PostMapping("")
    public ResponseEntity<Integer> createInterview(@RequestBody InterviewDto interviewDto){
        System.out.println(interviewDto.getUserId());
        System.out.println(interviewDto.getTitle());
        int rst = interviewService.save(interviewDto);
        return ResponseEntity.ok(rst);
    }

    //주제 전체 조회
    @GetMapping("")
    public ResponseEntity<List<InterviewDto>> interviewList(){
        return ResponseEntity.ok(interviewService.interviewDtoList());

    }

    //주제 상세 조회 + 해당 질문 조회
    @GetMapping("/{titleId}")
    public ResponseEntity<InterviewDto> interviewById(@PathVariable int titleId){
        return ResponseEntity.ok(interviewService.getInterview((long) titleId));
    }

    //주제 수정
    @PatchMapping("")
    public ResponseEntity<Integer> interviewUpdate(@RequestBody InterviewDto interviewDto){
        InterviewDto interview = interviewService.getInterview(interviewDto.getTitleId());
        interview = interview.builder()
                .titleId(interviewDto.getTitleId())
                .userId(interviewDto.getUserId())
                .title(interviewDto.getTitle())
                .updDt(LocalDateTime.now())
                .build();
        return ResponseEntity.ok(interviewService.update(interview));
    }

    //주제 삭제
    @PatchMapping("/{titleId}")
    public ResponseEntity<Integer> interviewDelete(@PathVariable int titleId){
        return ResponseEntity.ok(interviewService.delete((long) titleId));
    }

    
}
