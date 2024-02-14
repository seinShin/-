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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="/static/css/common.css">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<!-- s:wrap -->
<div id="wrap">
    <!-- s:header -->
    <header id="header">
        <div><h1>Interview Recipe</h1></div>
        <div class="header-menu">
            <a href="/member/logout" class="" ><i class="fas fa-right-from-bracket"></i></a>
        </div>
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
                            <div class="section">
                                <div>
                                    <video id="video-output"></video>
                                    <br/>
                                    <div class="btn-wrap">
                                        <button type="button" class="btn-form" id="start-btn">Start</button>
                                        <button type="button" class="btn-form" id="finish-btn">Stop</button>
                                    </div>
                                </div>
                                <div>
                                    <video id="recorded-video" controls></video>
                                    <br />
                                    <div class="btn-wrap">
                                        <button type="button" id="download-btn"  class="btn-form">Download</button>
                                    </div>
                                </div>
                            </div>
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
    const videoOutput = document.getElementById('video-output');
    const startBtn = document.getElementById('start-btn');
    const downloadBtn = document.getElementById('download-btn');
    const finishBtn = document.getElementById('finish-btn');
    const recordedVideo = document.getElementById('recorded-video');

    let mediaStream = null;
    let mediaRecorder = null;
    let recordedMediaURL = null;

    // 유저의 카메라로 부터 입력을 사용할 수 있도록 요청
    navigator.mediaDevices
        .getUserMedia({ video: true })
        .then(function (newMediaStream) {
            mediaStream = newMediaStream;

            // 카메라의 입력을 실시간으로 비디오 태그에서 확인
            videoOutput.srcObject = mediaStream;
            videoOutput.onloadedmetadata = function (e) {
                videoOutput.play();
            };
        });

    // 녹화 시작 버튼 클릭 시 빌생하는 이벤트 핸들러 등록
    startBtn.addEventListener('click', function () {
        let recordedChunks = [];
        // 1.MediaStream을 매개변수로 MediaRecorder 생성자를 호출
        mediaRecorder = new MediaRecorder(mediaStream, {
            mimeType: 'video/webm;',
        });

        // 2. 전달받는 데이터를 처리하는 이벤트 핸들러 등록
        mediaRecorder.ondataavailable = function (event) {

            if (event.data && event.data.size > 0) {
                console.log('ondataavailable');
                recordedChunks.push(event.data);
            }
        };


        // 3. 녹화 중지 이벤트 핸들러 등록
        mediaRecorder.onstop = function () {
            // createObjectURL로 생성한 url을 사용하지 않으면 revokeObjectURL 함수로 지워줘야합니다.
            // 그렇지 않으면 메모리 누수 문제가 발생합니다.
            if (recordedMediaURL) {
                URL.revokeObjectURL(recordedMediaURL);
            }

            const blob = new Blob(recordedChunks, { type: 'video/webm;' });
            recordedMediaURL = URL.createObjectURL(blob);
            recordedVideo.src = recordedMediaURL;
        };

        mediaRecorder.start();
    });

    // 녹화 종료 버튼 클릭 시 빌생하는 이벤트 핸들러 등록
    finishBtn.addEventListener('click', function () {
        if (mediaRecorder) {
            // 5. 녹화 중지
            mediaRecorder.stop();
        }
    });

    // 다운로드 버튼 클릭 시 발생하는 이벤트 핸들러 등록
    downloadBtn.addEventListener('click', function () {
        console.log('recordedMediaURL : ', recordedMediaURL);
        if (recordedMediaURL) {
            const link = document.createElement('a');
            document.body.appendChild(link);
            link.href = recordedMediaURL;
            link.download = 'video.webm';
            link.click();
            document.body.removeChild(link);
        }
    });
</script>
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
        next : function(){

            $(".question").text(questionList[order].question);
            $("#forSound").val($(".question").text());
            $(".volume").trigger("click");
            order++;

            //비디오 설정 초기화
            document.getElementById('recorded-video').src="";
        },
        sound : function(){

            // 텍스트 음성 추출
            const textInputField = document.querySelector("#forSound")
            const utterThis = new SpeechSynthesisUtterance()
            const synth = window.speechSynthesis
            let ourText = ""

            const checkBrowserCompatibility = () => {
                "speechSynthesis" in window
                    ? console.log("Sound Success")
                    : console.log("Sound Failed :-(")
            }

            checkBrowserCompatibility()
                ourText = textInputField.value
                utterThis.text = ourText
                synth.speak(utterThis)
                textInputField.value = ""
        }
    }



</script>