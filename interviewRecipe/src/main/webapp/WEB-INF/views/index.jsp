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
	            <form id="loginFrm" method="post" action="login">
	            	<fieldset>
	            		<legend>login</legend>
	            		<h2 class="form-tit">Interview Recipe</h2>
	            		<div class="form-group type2">
	            			<div class="form-group-inner">
		            			<label for="userName" class="form-label">Username</label>
		            			<input type="text" id="userName" name="userNm" class="form-control">
	            			</div>
	            		</div>
	            		<div class="form-group type2">
	            			<div class="form-group-inner">
		            			<label for="Userpassword" class="form-label">Password</label>
		            			<input type="password" id="Userpassword" name="userPw" class="form-control">
		            		</div>
	            		</div>
	            		<div class="btn-wrap">
	            			<button type="submit" class="btn-form">
	            				<span></span>
	            				<span></span>
	            				<span></span>
	            				<span></span>
		            			SUBMIT
		            		</button>
	            			<button type="button" class="btn-form" id="joinBtn">
								<a href="member/join" id="toJoin" style="display: none;"></a>
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
	</main>
	<!-- e:main -->

</div>
<!-- s:wrap -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>

<script type="text/javascript">

	// join 버튼 -> join 페이지 이동
	$("#joinBtn").click(function(){
		location.href="member/join";
	})
</script>