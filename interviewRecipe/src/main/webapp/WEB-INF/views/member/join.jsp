<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Content-Script-Type" content="text/javascript">
    <meta http-equiv="Content-Style-Type" content="text/css">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="format-detection" content="telephone=no">
    <title>Interview Recipe</title>
    <link rel="icon" type="image/png" sizes="16x16" href="">
    <link rel="icon" type="image/png" sizes="32x32" href="">
    <link rel="apple-touch-icon" sizes="57x57" href="">
    <link rel="apple-touch-icon" sizes="60x60" href="">
    <link rel="apple-touch-icon" sizes="72x72" href="">
    <link rel="apple-touch-icon" sizes="76x76" href="">
    <link rel="icon" type="image/png" sizes="96x96" href="">
    <link rel="apple-touch-icon" sizes="114x114" href="">
    <link rel="apple-touch-icon" sizes="120x120" href="">
    <link rel="apple-touch-icon" sizes="144x144" href="">
    <link rel="apple-touch-icon" sizes="152x152" href="">
    <link rel="apple-touch-icon" sizes="180x180" href="">
    <link rel="icon" type="image/png" sizes="192x192" href="">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <!-- SNS share -->
    <meta property="og:title" content="">
    <meta property="og:url" content="">
    <meta property="og:image" content="">
    <meta property="og:description" content="">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="/static/css/common.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<!-- s:wrap -->
<div id="wrap">
    <!-- s:header -->
    <header id="header">
        <h1>Interview Recipe</h1>
    </header>
    <!-- e:header -->

    <!-- s:main -->
    <main id="container">
        <section class="section-center">
            <div class="login-box">
                <form id="joinFrm">
                    <fieldset>
                        <legend>join</legend>
                        <h2 class="form-tit">Join</h2>
                        <div class="form-group">
                            <div class="form-group-inner">
                                <label for="userName" class="form-label">Username</label>
                                <input type="text" id="userName" name="userNm" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-group-inner">
                                <label for="userNickName" class="form-label">Nickname</label>
                                <input type="text" id="userNickName" name="userNick" class="form-control">
                            </div>
                            <span class="caution" id="idChk"></span>
                        </div>
                        <div class="form-group">
                            <div class="form-group-inner">
                                <label for="Userpassword" class="form-label">Password</label>
                                <input type="password" id="Userpassword" name="userPw" class="form-control">
                            </div> 
                            <span class="caution" id="pwChk"></span>
                        </div>
                        <div class="form-group">
                            <div class="form-group-inner">
                                <label for="Userpassword2" class="form-label">confirm<br>Password</label>
                                <input type="password" id="Userpassword2" class="form-control">
                            </div>
                            <span class="caution" id="rePwChk"></span>
                        </div>
                        <div class="form-group">
                            <div class="form-group-inner">
                                <label for="MEM002" class="form-label">Type</label>
                                <div class="form-radio-wrap">
                                    <div class="fancy-box">
                                        <input type="radio" name="groupCd" class="fancy-check" id="MEM002" value="MEM002">
                                        <label for="MEM002" class="ico-fancy">
                                            <span>Interviewer</span>
                                        </label>
                                    </div>
                                    <div class="fancy-box">
                                        <input type="radio" name="groupCd" class="fancy-check" id="MEM003" value="MEM003" checked>
                                        <label for="MEM003" class="ico-fancy">
                                            <span>Learner</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="btn-wrap">
                            <button type="button" class="btn-form" id="joinBtn" onclick="joinObj.joinChk();">
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                JOIN
                            </button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </section>

        <!-- s:floating-menu -->
        <div class="floating-menu">
            <a href="#" class="home"><i class="fas fa-paper-plane"></i></a>
            <a href="#" class="login"><i class="fas fa-user"></i></a>
            <a href="#" class="menu"><i class="fas fa-bars"></i></a>
        </div>
        <!-- e:floating-menu -->

    </main>
    <!-- e:main -->

</div>
<!-- s:wrap -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</body>
</html>

<script type="text/javascript">

    let idCheck = false;
    const $idChk = $('#idChk');
    //아이디 검사
    $(document).on("keyup","#userNickName",function(){

        if (joinObj.idCheck()) {
            $idChk.css('color','white').text("사용가능한 아이디입니다.");
            idCheck = true;
        }else {
            $idChk.css('color','red').text("* 이미 사용중인 아이디입니다.");
            idCheck = false;
        }
    });

    const $Userpassword = $('#Userpassword');
    const $pwChk = $('#pwChk');
    //비밀번호 검사
    $(document).on("keyup","#Userpassword",function(){
        const pw = $Userpassword.val();
        const reg = /^(?=.*[a-zA-z])(?=.*[0-9]).{8,}$/;
        if(reg.test(pw) === false){
            $pwChk.css('color','red').text("비밀번호는 영문, 숫자를 혼합하여 8자리 이상 입력해주세요.");
        }else{
            $pwChk.css('color','white').text("사용 가능한 비밀번호입니다.");
        }
    });

    const $Userpassword2 = $('#Userpassword2');
    const $rePwChk = $('#rePwChk');
    let pwState = false;
    //비밀번호 확인 검사
    $(document).on("keyup","#Userpassword2",function(){
        const pw = $Userpassword.val();
        const pwRe = $Userpassword2.val();

        if(pw !== pwRe){
            $rePwChk.css('color','red').text("입력하신 비밀번호가 일치하지 않습니다.");
        }else{
            $rePwChk.css('color','white').text("비밀번호가 일치합니다.");
        }
    });


    const $userName = $('#userName');
    const $userNickName = $('#userNickName');
    const $groupCd = $('input[name="groupCd"]:checked');
    let joinObj = {
        idCheck : function(){
            // 아이디 중복 검사 로직.
            const id= $userNickName.val();
            let rstVal = false;

            $.ajax({
                url : "/member/idChk",
                data : {"userNick" : id},
                type:'GET',
                async: false,
                success:function(res){
                    rstVal = res;
                },error:function(res){
                    alert("오류 발생.\n관리자에게 문의해주세요.");
                    rstVal = false;
                }
            });

            return rstVal;
        },
        joinChk : function(){

            if(!idCheck){
                alert("닉네임을 확인해주세요. \n 이미 사용중인 닉네임입니다.");
                return false;
            }

            if( !$userName.val() || !$userName.val().trim()){
                alert("사용자 이름을 입력해주세요.");
                $userName.focus();
                return false;
            }

            if( !$userNickName.val() || !$userNickName.val().trim()){
                alert("닉네임을 입력해주세요.");
                $userNickName.focus();
                return false;
            }

            if( !$Userpassword.val() || !$Userpassword.val().trim()){
                alert("비밀번호를 입력해주세요.");
                $Userpassword.focus();
                return false;
            }

            if( !$Userpassword2.val() || !$Userpassword2.val().trim()){
                alert("비밀번호를 확인해주세요.");
                $Userpassword2.focus();
                return false;
            }

            if( $Userpassword.val() !== $Userpassword2.val()){
                alert("비밀번호가 일치하지 않습니다.");
                $Userpassword2.focus();
                return false;
            }



            const formData = {
                userNm: $userName.val(),
                userNick: $userNickName.val(),
                userPw: $Userpassword.val(),
                groupCd: $groupCd.val()
            };


            // 서버로 데이터 전송
            $.ajax({
                type: 'POST',
                url: '/member/join', // 회원가입 처리를 하는 서버의 엔드포인트로 변경
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    // console.log(response);
                    if(response !== 1){
                        alert("회원가입에 실패하였습니다. \n 관리자에게 문의하세요.")
                    }else{
                        location.href="/index";
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText); // 에러가 발생하면 콘솔에 로그 출력
                    console.log(error);
                    console.log(status);
                }
            });

        }
    }
</script>