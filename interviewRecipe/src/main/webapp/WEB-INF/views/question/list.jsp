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
                        <h2 class="form-tit">KTDS 면접 준비</h2>

                        <div class="question-list">
<%--                            <div class="list-head">--%>
<%--                                <span>Order</span>--%>
<%--                                <span>Question</span>--%>
<%--                            </div>--%>
                            <ol class="questionList">
<%--                                <li>--%>
<%--                                    <a href="#">--%>
<%--                                        <span>1.</span>--%>
<%--                                        <p>질문 1</p>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
                            </ol>
                        </div>
                    </fieldset>
                </form>
            </div>
        </section>

        <!-- s:floating-menu -->
        <div class="floating-menu">
<%--            <a href="#" class="monitor"><i class="fas fa-desktop"></i></a>--%>
            <a href="/main" class="home"><i class="fas fa-paper-plane"></i></a>
            <a href="#" class="plus"><i class="fas fa-solid fa-plus"></i></a>
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
    const userId = ${userInfo.userId};
    let titleId;

    $(document).ready(function(){
        const params = new URLSearchParams(window.location.search);
        titleId = params.get('titleId');

        $(".plus").prop("href","/question/write?titleId="+titleId);
        questionObj.list();
    })


    let questionObj = {
        list : function(){
            $.ajax({
                type: 'GET',
                url: '/v1/question/'+titleId,
                success: function(response) {
                    // console.log(response);
                    if(response.length >0){
                        questionObj.listReturn(response);
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
        listReturn : function(res){
            // 질문 세팅
            for(const i in res) {
                let question = '';
                question += '<li>';
                question += '  <a href="#">';
                question += '   <span><i class="fas fa-check"></i></span>';
                question += '   <p>'+res[i].question+'</p>';
                question += '   <i class="fas fa-times-circle" onclick="questionObj.delTitle(' + res[i].queId + ')"></i>';
                question += '  </a>'
                question += '</li>';
                // console.log(question);
                $('.questionList').append(question);
            }

        },
        delTitle : function(queId){
            // 삭제
            $.ajax({
                type: 'Patch',
                url: '/v1/question/'+queId,
                success: function(response) {
                    // console.log(response);
                    if(response > 0){
                        alert("질문이 삭제되었습니다.");
                        //삭제 후 리스트 정리
                        $(".questionList").empty(); // ul 요소 비우기
                        questionObj.list();
                    }else{
                        alert("삭제에 실패하였습니다. \n 관리자에게 문의해주세요.")
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText); // 에러가 발생하면 콘솔에 로그 출력
                    alert("오류가 발생했습니다. \n 관리자에게 문의해주세요.")
                }
            });
        }
    }

</script>