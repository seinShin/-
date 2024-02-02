package interviewRecipe.interviewRecipe.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class InterviewDto {

    private Long titleId;
    private Long userId;
    private String title;
    private LocalDateTime regDt;
    private LocalDateTime updDt;
    private Boolean delYn;

}
