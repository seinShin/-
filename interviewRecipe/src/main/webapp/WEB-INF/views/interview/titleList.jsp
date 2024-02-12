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
                        <legend>면접 주제 리스트</legend>
                        <h2 class="form-tit">${userInfo.userNick}의 모의 면접</h2>

                        <div class="form-list">
                            <ul class="titleList">
<%--                                <li class="active">--%>
<%--                                    <!-- s:active -->--%>
<%--                                    <button type="button">KTDS 면접 준비</button>--%>
<%--                                    <i class="fas fa-times-circle"></i>--%>
<%--                                    <!-- e:active -->--%>
<%--                                </li>--%>
                            </ul>
                        </div>
                    </fieldset>
                </form>
            </div>
        </section>

        <!-- s:floating-menu -->
        <div class="floating-menu">
            <a href="/main" class="home"><i class="fas fa-paper-plane"></i></a>
<%--            <a href="/interview/titleList" class="menu"><i class="fas fa-bars"></i></a>--%>
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
    const userId = ${userInfo.userId}
    $(document).ready(function(){
        interviewObj.list();
    })

    let interviewObj = {
        list : function(){

            $.ajax({
                type: 'GET',
                url: '/v1/interview/all/${userInfo.userId}',
                // contentType: 'application/json',
                // data: JSON.stringify(formData),
                success: function(response) {
                    console.log(response);
                    if(response.length >0){
                        interviewObj.listReturn(response);
                    }else{
                        alert("등록된 주제가 없습니다. \n 주제를 등록해주세요.")
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText); // 에러가 발생하면 콘솔에 로그 출력
                    alert("오류가 발생했습니다. \n 관리자에게 문의해주세요.")
                }
            });
        },
        listReturn : function(res){

            for(const i in res){
                let title='';
                title += '<li class="">';
                title += '  <button type="button" onclick="interviewObj.toDetail('+res[i].titleId+')">'+res[i].title+'</button>';
                title += '  <i class="fas fa-times-circle" onclick="interviewObj.delTitle('+res[i].titleId+')"></i>';
                title += '</li>';
                console.log(title);
                $('.titleList').append(title);
            }

        },
        delTitle : function(titleId){
            // 삭제

        },
        toDetail : function(titleId){
            // 상세 페이지 이동
        }

    }

</script>