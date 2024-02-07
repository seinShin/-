package interviewRecipe.interviewRecipe.controller.restController;

import interviewRecipe.interviewRecipe.dto.InterviewQueDto;
import interviewRecipe.interviewRecipe.service.InterviewQueService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/v1/question")
@AllArgsConstructor
public class InterviewQueController {
    private final InterviewQueService interviewQueService;

    // 질문 등록
    @PostMapping
    public ResponseEntity<Integer> createInterviewQue(@RequestBody InterviewQueDto interviewQueDto){
        int rst = interviewQueService.save(interviewQueDto);
        return ResponseEntity.ok(rst);
    }
    // 주제 별 질문 전체 조회
    @GetMapping("/{titleId}")
    public ResponseEntity<List<InterviewQueDto>> interviewQueList(
            @PathVariable int titleId){
        return ResponseEntity.ok(interviewQueService.findAll((long) titleId));

    }

    // 질문 상세 조회 for 수정
    @GetMapping("/detail/{queId}")
    public InterviewQueDto interviewQueDto(@PathVariable int queId, Model model){
        return interviewQueService.finById((long)queId);
    }


    // 질문 수정
    @PatchMapping
    public ResponseEntity<Integer> updateInterviewQue(@RequestBody InterviewQueDto interviewQueDto){
        return ResponseEntity.ok(interviewQueService.update(interviewQueDto));

    }

    // 질문 삭제
    @PatchMapping("/{queId}")
    public ResponseEntity<Integer> deleteInterviewQue(@PathVariable int queId){
        return ResponseEntity.ok(interviewQueService.delete((long)queId));
    }

    // 질문 순서 변경
}
