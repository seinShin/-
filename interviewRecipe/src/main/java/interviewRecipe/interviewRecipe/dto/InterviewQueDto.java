package interviewRecipe.interviewRecipe.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class InterviewQueDto {
    private Long queId;
    private Long titleId;
    private String question;
    private Long order;
    private LocalDateTime regDt;
    private LocalDateTime updDt;
    private Boolean delYn;


}
