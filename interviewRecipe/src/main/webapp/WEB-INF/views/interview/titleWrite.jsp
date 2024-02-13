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
                <form id="interviewFrm">
                    <fieldset>
                        <legend>모의 면접 주제 등록</legend>
                        <h2 class="form-tit">모의 면접 주제 등록</h2>

                        <div class="form-inner-box">
                            <div class="form-group">
                                <div class="form-group-inner">
                                    <label for="formTitle" class="form-label">Title</label>
                                    <input type="text" id="formTitle" name="title" class="form-control">
                                </div>
                            </div>
                            <div class="btn-wrap">
                                <button type="button" class="btn-form" id="saveBtn">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    SAVE
                                </button>
                                <button type="button" class="btn-form" id="queBtn" onclick="interviewObj.questionAdd();" >
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    Question
                                </button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </section>

        <!-- s:floating-menu -->
        <div class="floating-menu">
            <a href="/main" class="home"><i class="fas fa-paper-plane"></i></a>
            <a href="/interview/titleList" class="menu"><i class="fas fa-bars"></i></a>
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
    $(document).ready(function(){

        const params = new URLSearchParams(window.location.search);
        titleId = params.get('titleId');
        title = params.get('title');

        if(titleId !== null){
            // 수정
            state = true;
            $("#formTitle").val(title);
            $(".form-tit").text("모의 면접 주제 수정");
            $("#queBtn").show();
        }else{
            // 등록
            state = false;
            $("#queBtn").hide();
        }

    });

    $("#saveBtn").click(function (){
        if(state === true) interviewObj.modify();
        else interviewObj.save();
    });

    let interviewObj = {
        save : function(){
            const formData = {
                userId :  ${userInfo.userId},
                title  : $('#formTitle').val()
            }
            $.ajax({
                type:'POST',
                url : "/v1/interview",
                contentType: 'application/json',
                data : JSON.stringify(formData),
                success:function(res){
                    if(res===1){
                        location.href="/interview/titleList";
                    }else{
                        alert("등록에 실패하였습니다.\n관리자에게 문의해주세요.");
                    }
                },error:function(){
                    alert("등록에 실패하였습니다.\n관리자에게 문의해주세요.");
                }
            });
        },
        modify : function(){
            const formData = {
                "userId" :  ${userInfo.userId},
                "titleId": titleId,
                "title"  : $('#formTitle').val()
            }
            $.ajax({
                type:'Patch',
                url : "/v1/interview",
                contentType: 'application/json',
                data : JSON.stringify(formData),
                success:function(res){
                    if(res===1){
                        location.href="/interview/titleList";
                    }else{
                        alert("수정에 실패하였습니다.\n관리자에게 문의해주세요.");
                    }
                },error:function(){
                    alert("수정에 실패하였습니다.\n관리자에게 문의해주세요.");
                }
            });
        },
        questionAdd : function(){
            location.href="/question/list?titleId="+titleId;
        }
    }

</script>