<link rel="stylesheet" href = "/resources/static/css/index.css">
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<div class="indexLine">
  <div class="login-box en">
    <h2>Interview Recipe</h2>
    <form id="loginFrm" method="">
      <div class="user-box en">
        <input type="text" name="name" id="name" required="">
        <label>Username</label>
      </div>
      <div class="user-box en">
        <input type="password" name="password" id="password" required="">
        <label>Password</label>
      </div>
      <a href="#" class="en" id="loginBtn">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        Submit
      </a>
      <a href="/member/join" style="margin-left: 80px;" class="en">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        Join
      </a>
    </form>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  const userId = $("#name").val();
  const userPw = $("#password").val();


  // 로그인 버튼
  $('#loginBtn').click(function (){
    const userId = $("#name").val();
    const userPw = $("#password").val();
      $fn.login();
  });

  $fn = {
    login : function(){
        //ajax
    }
  }

</script>