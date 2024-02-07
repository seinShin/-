package interviewRecipe.interviewRecipe.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@Builder
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

    @Builder
    public MemberDto(Long userId, String groupCd, String userNm, String userNick, String userPw, Boolean reviewYn, LocalDateTime regDt, LocalDateTime updDt) {
        this.userId = userId;
        this.groupCd = groupCd;
        this.userNm = userNm;
        this.userNick = userNick;
        this.userPw = userPw;
        this.reviewYn = reviewYn;
        this.regDt = regDt;
        this.updDt = updDt;
    }
}
