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
		<section class="section-center">
			<div class="menu-list">
				<div class="menu-list-inner">
					<ul>
						<li><a href="/interview/titleWrite">면접 주제 등록하기</a></li>
						<li><a href="/interview/titleList">모의 면접 하기</a></li>
						<li><a href="#">리뷰 확인하기</a></li>
						<li><a href="#">마이 페이지</a></li>
					</ul>
				</div>
			</div>
        </section>
	</main>
	<!-- e:main -->

	<!-- s:floating-menu -->
<%--    <div class="floating-menu">--%>
<%--        <a href="/interview/titleList" class="menu"><i class="fas fa-bars"></i></a>--%>
<%--    </div>--%>
    <!-- e:floating-menu -->

</div>
<!-- s:wrap -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</body>
</html>