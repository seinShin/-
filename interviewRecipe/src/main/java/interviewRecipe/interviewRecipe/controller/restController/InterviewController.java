package interviewRecipe.interviewRecipe.controller.restController;

import interviewRecipe.interviewRecipe.dto.InterviewDto;
import interviewRecipe.interviewRecipe.service.InterviewService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/interview")
@AllArgsConstructor
public class InterviewController {

    private final InterviewService interviewService;

    //주제 등록
    @PostMapping("/create")
    public ResponseEntity<Integer> createInterview(InterviewDto interviewDto){
        int rst = interviewService.save(interviewDto);
        return ResponseEntity.ok(rst);
    }

    //주제 전체 조회
    @GetMapping("/listAll")
    public ResponseEntity<List<InterviewDto>> interviewList(Model model){
//        List<InterviewDto> interviewList = interviewService.interviewDtoList();
//        model.addAttribute("interviews", interviewList);
        return ResponseEntity.ok(interviewService.interviewDtoList());

    }

    //주제 상세 조회
    @GetMapping("/{titleId}")
    public ResponseEntity<InterviewDto> interviewById(@PathVariable int titleId, Model model){
//        InterviewDto interviewDto = interviewService.getInterview((long) titleId);
//        model.addAttribute("detail", interviewDto);
        return ResponseEntity.ok(interviewService.getInterview((long) titleId));
    }

    //주제 수정

    @PutMapping("/{titleId}")
    public ResponseEntity<Integer> interviewUpdate(@PathVariable int titleId, Model model){
        return ResponseEntity.ok(interviewService.delete((long) titleId));
    }

    //주제 삭제
    @DeleteMapping("/delete/{titleId}")
    public ResponseEntity<Integer> interviewDelete(@PathVariable int titleId){
        return ResponseEntity.ok(interviewService.delete((long) titleId));
    }

    
}
