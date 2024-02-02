package interviewRecipe.interviewRecipe.controller;

import interviewRecipe.interviewRecipe.dto.InterviewDto;
import interviewRecipe.interviewRecipe.service.InterviewService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/api/interview")
@AllArgsConstructor
public class InterviewController {

    private final InterviewService interviewService;

    //주제 등록
    @PostMapping("/create")
    public String createInterview(InterviewDto interviewDto){
        interviewService.save(interviewDto);
        return "/";
    }

    //주제 전체 조회
    @GetMapping("/listAll")
    public String interviewList(Model model){
        List<InterviewDto> interviewList = interviewService.interviewDtoList();
        model.addAttribute("interviews", interviewList);
        return "/main";

    }

    //주제 상세 조회
    @GetMapping("/{titleId}")
    public String interviewById(@PathVariable int titleId, Model model){
        InterviewDto interviewDto = interviewService.getInterview((long) titleId);
        model.addAttribute("detail", interviewDto);
        return "/interview/detail";
    }

    //주제 수정


    
    //주제 삭제
//    @GetMapping("/delete/{titleId}")
//    public String interviewDelete(@PathVariable int titleId){
//        interviewService.
//    }

    
}
