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
        <section class="section-top">
            <div class="form-box">
                <form action="">
                    <fieldset>
                        <legend>모의면접 하기</legend>
                        <h2 class="form-tit title"></h2>

                        <div class="canvas-box">
<%--                                <span>Q. </span>--%>
                            <p>Q.</p>
                            <p class="question"></p>
                            <input type="hidden" id="forSound"/>
<%--                            <div class="canvas-content"></div>--%>
                        </div>
                    </fieldset>
                </form>
            </div>
        </section>

        <!-- s:floating-menu -->
        <div class="floating-menu">
            <a href="#" class="volume" onclick="playObj.sound();"><i class="fas fa-volume-up"></i></a>
            <a href="#" class="chat" onclick="playObj.next();"><i class="fas fa-play"></i></a>
            <a href="/main" class="home"><i class="fas fa-paper-plane"></i></a>
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
    let state = false;
    let titleId;
    let title;
    let questionList = Array;
    let order = 0;

    $(document).ready(function(){
        const params = new URLSearchParams(window.location.search);
        titleId = params.get('titleId');
        title = params.get('title');

        $(".title").text(title);
        playObj.questionList();

    });

    let playObj = {
        questionList : function () {
            $.ajax({
                type: 'GET',
                url: '/v1/question/'+titleId,
                success: function(response) {
                    console.log(response);
                    if(response.length >0){
                        questionList = response;
                        playObj.next(response);
                    }else{
                        alert("등록된 질문이 없습니다. \n 질문을 등록해주세요.")
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText); // 에러가 발생하면 콘솔에 로그 출력
                    alert("오류가 발생했습니다. \n 관리자에게 문의해주세요.")
                }
            });
        },
        // listReturn : function(rst){
        //     $(".question").text(rst[0].question);
        //     $("#forSound").val($(".question").text());
        //     $(".volume").trigger("click");
        // },
        next : function(){
            $(".question").text(questionList[order].question);
            $("#forSound").val($(".question").text());
            $(".volume").trigger("click");
            order++;
        },
        sound : function(){
            // $("#forSound").val($(".question").text());
            const textInputField = document.querySelector("#forSound")
            // const btn = document.querySelector("#soundBtn")
            const utterThis = new SpeechSynthesisUtterance()
            const synth = window.speechSynthesis
            let ourText = ""

            const checkBrowserCompatibility = () => {
                "speechSynthesis" in window
                    ? console.log("Web Speech API supported!")
                    : console.log("Web Speech API not supported :-(")
            }

            checkBrowserCompatibility()

            // btn.onclick = (event) => {
            //     event.preventDefault()
                ourText = textInputField.value
                utterThis.text = ourText
                synth.speak(utterThis)
                textInputField.value = ""
            // }
        }
    }



</script>