<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="../css/search.css" rel="stylesheet">

<script>

var count = 0;
var anothercount = 0;
var result = false;
var successcount = 0;
var errorcount=0;

function addsend(){
	
	
	
	const form = document.getElementById('form');
	const password = document.getElementById('password');
	
	
	const form_container = document.createElement('div');
	const input_container = document.createElement('div');
	const input_title_2 = document.createElement('div');
	const input_2_container = document.createElement('div');
	const input_2 = document.createElement("INPUT");
	const check_button_container = document.createElement('div');
	const check_button = document.createElement('div');
	
	
	form_container.className='form-container';
	input_container.className='input-container';
	input_title_2.className='input-title-2';
	input_2_container.className='input-2-container';
	input_2.className='input-2';
	check_button_container.className='check-button-container';
	check_button.className='check-button';
	
	input_2.setAttribute('placeholder','인증번호를 입력해주세요');
	input_2.id='certification';
	input_title_2.innerText='인증번호';
	check_button.innerText='인증번호 확인';
	check_button.setAttribute('onclick','check()');
	input_container.id='input-container';
	
	
	check_button_container.appendChild(check_button);
	input_2_container.appendChild(input_2);
	input_2_container.appendChild(check_button_container);
	input_container.appendChild(input_title_2);
	input_container.appendChild(input_2_container);
	form_container.appendChild(input_container);
	
	if(count ===0){
		form.insertBefore(form_container,password);
		
	}
	
	
	
	
	
   $.ajax({
          url:'http://localhost:8080/DevPanda/mailsend',
          dataType:'text',
          type:'POST',
          data:{'id':$('#id').val(),
          		'email':$('#email').val()},
          success:function(result){
              if(result=='success'){
                console.log('성공');
                console.log(result);
                count++;
              }else{
           	  	console.log('실패');
           	 	console.log(result);
           	 	alert('인증번호 버튼을 다시 눌러주세요');
           	 	count++;
              }
          }
      });

	
	
	
	
	
	

}

function check(){
	
	
	$.ajax({
        url:'http://localhost:8080/DevPanda/checkCertification',
        dataType:'text',
        type:'POST',
        data:{'id':$('#id').val(),
        		'email':$('#email').val()},
        success:function(result){
            if(result==$('#certification').val()){
              console.log('성공');
              console.log(result);
              if(successcount==0){
            	  const fail = document.getElementById('fail');
            	  if(fail!==null){
            		  
                	  fail.remove();
            		  
            	  }
            	  
            	  const input_error_title_2 = document.createElement('div');
            	  input_error_title_2.id='success';
          		  input_error_title_2.innerText='인증번호가 일치합니다';
          		  input_error_title_2.className='input-error-title-2';
          		  const input_container = document.getElementById('input-container');
          		  input_container.appendChild(input_error_title_2);
          		  const pwd_button = document.getElementById('pwd-button');
        		  pwd_button.removeAttribute('type');
          		  successcount++;
              }
              
              
            }else{
         	  	console.log('실패');
         	 	console.log(result);
         	 	if(errorcount==0){
         	 		const success = document.getElementById('success');
              	 	if(success!==null){
              	 		success.remove();
              	 	}
         	 		const input_error_title_2 = document.createElement('div');
         	 		input_error_title_2.id='fail';
            		input_error_title_2.innerText='인증번호가 일치하지 않습니다';
            		input_error_title_2.className='input-error-title-2';
            		const input_container = document.getElementById('input-container');
            		input_container.appendChild(input_error_title_2);	
            		errorcount++;
         	 	}
         	 	
         	 	
            }
        }
    });
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}



</script>
</head>
<body>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- Header Start -->
	
	<!-- Header End-->


	<div class="entire-container">
		<div class="container" style="margin-top: 70px;">
			<div class="title">DevPanda</div>
		</div>
		<div class="container">
			<div class="sub-title">기업회원 비밀번호찾기</div>
		</div>
		<div class="hr-container">
			<div class="hr-content-container">
				<hr style="width: 100%;">
				<div>
					아이디와 등록된 이메일을 입력하시면 <br>이메일로 인증번호를 발송합니다
				</div>
			</div>
		</div>
		<form class="form" id="form" method="get" action="/DevPanda/Company/PasswordResult" >
			<div class="form-container">
				<div class="input-container">
					<div class="input-title-1">아이디*</div>
					<input class="input-1" id='id' name='id'placeholder="아이디를 입력해 주세요">
					
				</div>
			</div>
			<div class="form-container" >
				<div class="input-container">
					<div class="input-title-2">이메일*</div>
					<div class="input-2-container">
						<input class="input-2" id='email' name='email' placeholder="이메일을 입력해 주세요">
						<div class="check-button-container">
							<div class="check-button" onclick='addsend()'>인증번호 발송</div>
						</div>
					</div>
					
				</div>
			</div>
			
			
			
			
			
			<div class="form-container" name='password'id='password'>
				<button  type='button' id='pwd-button' class="sign-in"  >비밀번호 찾기</button>
			</div>
		</form>
	</div>
</body>
</html>