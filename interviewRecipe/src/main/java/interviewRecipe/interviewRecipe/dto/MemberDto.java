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
public class MemberDto {
    private Long userId;
    private String groupCd;
    private String userNm;
    private String userNick;
    private String userPw;
    private Boolean reviewYn;
    private LocalDateTime regDt;
    private LocalDateTime updDt;

}
