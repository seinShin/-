<link rel="stylesheet" href = "/resources/static/css/join.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

<div class="indexLine">
    <div class="login-box">
      <h2 class="en">Join</h2>
        <form id="joinFrm" method="">
            <div class="user-box">
              <p class="en title"> Name </p>
              <input type="text" name="" id="name" required="">
            </div>
            <div class="user-box">
              <p class="en title"> Nickname </p>
              <input type="text" name="" id="nickname" required="">
            </div>
            <div class="user-box">
                <p class="en title"> Password </p>
                <input type="password" name="" id="password" required="">
            </div>
            <div class="user-box">
                <p class="en lines"> Confirm <br/> Password </p>
                <input type="passwordChk" name="" id="passwordChk" required="">
            </div>
            <div class="radios">
                <p class="en title"> Type </p>
                <div class="radio">
                    <p class="en title"> interviewer </p>
                    <input type="radio" id="interviewer" name="type" value="interviewer" checked />
                </div>
                <div class="radio">
                    <p class="en title"> Learner </p>
                    <input type="radio" id="Learner" name="type" value="Learner"/>
                </div>
            </div>
        <a href="#" id="joinBtn" style="margin-left: 113px; margin-bottom: -30px" class="en">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          Join
        </a>
      </form>
    </div>

    <div class="wrapper">

    </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    const name = $("#name").val();
    const nickName = $("#nickname").val();
    const password = $("#password").val();
    const passwordChk = $("#passwordChk").val();
    const type = $("input[name='type']:checked").val();

    // 회원가입 버튼
    $('#loginBtn').click(function (){
        $fn.login();
    });

    $fn = {
        join : function(){
            //ajax
        }
    }
</script>