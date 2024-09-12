<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작화면</title>

<style>
a,a:active,a:focus,a:hover {
    -webkit-text-decoration: none;
    text-decoration: none
}

body{
    background-color: rgb(255,254,247);
}
.entire-container{
    width: 100%;
    height: 100%;
    display : flex;
    flex-direction : column;
    justify-content : center;
    row-gap: 50px;
    
}



.container{
    display : flex;
    flex-direction: row;
    justify-content: center;
}

.image{
    width: 300px;
    height: 250px;
}
.login-text{
    font-size:32px;
    display : flex;
    flex-direction: row;
    justify-content: center;
    font-weight: bolder;
}
.login-container{
    display : flex;
    flex-direction: row;
    justify-content: center;
    gap:30px;
    
}

.sub-login-container{
    border :1px solid;
    border-radius: 10px;
    font-size:30px;
    
   
}
.sub-login-container :hover{
    cursor: pointer;
}

.sub-image{
    width: 250px;
    height: 200px;
    padding: 10px;
    margin: 20px;
}

.sub-text{
    display: flex;
    justify-content: center;
    padding: 10px;
    
}


</style>
</head>
<body>
	    
    <div class = "entire-container">
        
        <div class="container" style="margin-top: 70px;">
            
            <img src="${pageContext.request.contextPath}/img/devpanda.png" class="image">
            
    
            
        </div>

        <div class = "login-text">로그인</div>



        <div class="login-container">
            <div class = "sub-login-container" onclick="location.href='/DevPanda/Person/login'">
                <img src="${pageContext.request.contextPath}/img/individual.png" class="sub-image">
                <div class = "sub-text">개인 회원</div>
            </div>


            <div class = "sub-login-container" onclick="location.href='/DevPanda/Company/login'">
                <img src="${pageContext.request.contextPath}/img/company.png" class="sub-image">
                <div class = "sub-text">기업 회원</div>
            </div>


            
           
           
    
            
        </div>






        


        


      

    </div>

</body>
</html>