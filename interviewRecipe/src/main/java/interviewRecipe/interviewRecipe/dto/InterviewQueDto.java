package interviewRecipe.interviewRecipe.dto;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Builder
@NoArgsConstructor
public class InterviewQueDto {
    private Long queId;
    private Long titleId;
    private String question;
    private Long order;
    private LocalDateTime regDt;
    private LocalDateTime updDt;
    private Boolean delYn;


    @Builder
    public InterviewQueDto(Long queId, Long titleId, String question, Long order, LocalDateTime regDt, LocalDateTime updDt, Boolean delYn) {
        this.queId = queId;
        this.titleId = titleId;
        this.question = question;
        this.order = order;
        this.regDt = regDt;
        this.updDt = updDt;
        this.delYn = delYn;
    }
}
