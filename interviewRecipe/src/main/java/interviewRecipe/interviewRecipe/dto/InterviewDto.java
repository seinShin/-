package interviewRecipe.interviewRecipe.dto;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Builder
@NoArgsConstructor
public class InterviewDto {

    private Long titleId;
    private Long userId;
    private String title;
    private LocalDateTime regDt;
    private LocalDateTime updDt;
    private Boolean delYn;

    @Builder
    public InterviewDto(Long titleId, Long userId, String title, LocalDateTime regDt, LocalDateTime updDt, Boolean delYn) {
        this.titleId = titleId;
        this.userId = userId;
        this.title = title;
        this.regDt = regDt;
        this.updDt = updDt;
        this.delYn = delYn;
    }
}
