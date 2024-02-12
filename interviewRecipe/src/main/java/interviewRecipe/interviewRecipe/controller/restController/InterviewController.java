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
        int rst = interviewService.save(interviewDto);
        return ResponseEntity.ok(rst);
    }

    //주제 전체 조회
    @GetMapping("/all/{userId}")
    public ResponseEntity<List<InterviewDto>> interviewList(@PathVariable("userId") Long userId){
        return ResponseEntity.ok(interviewService.interviewDtoList(userId));

    }

    //주제 상세 조회 + 해당 질문 조회
    @GetMapping("/{titleId}")
    public ResponseEntity<InterviewDto> interviewById(@PathVariable Long titleId){
        return ResponseEntity.ok(interviewService.getInterview(titleId));
    }

    //주제 수정
    @PatchMapping("")
    public ResponseEntity<Integer> interviewUpdate(@RequestBody InterviewDto interviewDto){
        return ResponseEntity.ok(interviewService.update(interviewDto));
    }

    //주제 삭제
    @PatchMapping("/{titleId}")
    public ResponseEntity<Integer> interviewDelete(@PathVariable Long titleId){
        return ResponseEntity.ok(interviewService.delete(titleId));
    }

    
}
