<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="${pageContext.servletContext.contextPath}/">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--Đường dẫn icon-->
<link rel="stylesheet" href="<c:url value="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></c:url>">
<!-- Đường dẫn file.css -->
<link rel="stylesheet" href="<c:url value= "resource/css/style.css"> </c:url>" />

<!-- Đường dẫn tới file css của bootstrap 4-->
<link rel="stylesheet"
	href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"></c:url>">
<!--Đường dẫn tới js của bootstrap 4-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>Đăng nhập</title>
</head>
<body>	
<header >
    <div class="container ">
      <nav class="navbar navbar-expand-md navbar-light  ">
        <a class="navbar-brand " href="user/index.htm">
          <img src="resource/img/logo.png" alt="logo" style="width:25%;">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
          <span class="navbar-toggler-icon"></span>
        </button> 
        <div class="collapse navbar-collapse" id="navbarResponsive" >
          <ul class="navbar-nav ml-auto">
            <li class="nav-item" style="background-color: tomato;" >
              <a href="./user/signin.htm" class="nav-link white">  <i class="fa fa-shopping-basket"></i>Thanh Toán</a>
            </li>
            <!-- Chức năng Đăng kí -->
            <li class="nav-item ">
              <a href="user/signup.htm" class="nav-link white">Đăng ký</a>

            </li>
            <li class="nav-item">
               <a href="user/signin.htm" class="nav-link white">Đăng nhập</a>
            </li>
          </ul>
          <form class="form-inline" action="/action_page.php">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Search">
              <!-- <button class="btn" type="submit"> <span class="fa fa-search"></span></button> -->
            </div>
          </form> 
        </div>
      </nav>
    </div>
  </header>
  <section>
	<div class="container" style="width: 50% ; background-color: #dd787d; margin-top: 15px; border-radius: 15px" >
		<br>
		
		<h2>Đăng nhập tài khoản</h2>
		<f:form action="./user/signin.htm"  modelAttribute="user">
			<div class="form-group">
				<label for="email">Email:</label> 
				<f:input type="email" class="form-control" id="email" placeholder="Nhập email" path="email"/>
				<span style="color: red">${LoiDinhDangEmail}</span>
			</div>
			<div class="form-group">
				<label for="pwd">Mật khẩu:</label> 
				<f:input type="password" class="form-control" id="pwd" placeholder="Nhập mật khẩu" path="matKhau"/>
				<span style="color: red">${LoiDinhDangMatKhau}</span>
			</div>
			<a href="./user/quenmatkhau.htm" style="color: black">Quên mật khẩu</a>
			<div><span style="color: red">${message}</span> </div>			
			<f:button type="submit" class="btn btn-primary"> Đăng nhập</f:button>
		</f:form>
		<br>
	</div>
  </section>
	
</body>
</html>