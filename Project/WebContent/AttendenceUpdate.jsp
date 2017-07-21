<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!including bootstrap file>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/Style.css">
<title>Transport Department</title>
<style type="text/css">
.footer{
 position:absolute;
    bottom:0px;
    width: 100%;
    margin: 0;
    background-color:black;
    height: 10%;
    color: white;
}

</style>
<body>
<!-- logo image -->
 <img alt="..." src="Image/web%20page.png" class="logo-img" >
<!-- end of logo image -->    

<!--Navigator  -->
<div class="navbar navbar-default" role="navigation">

 <div class="navbar-header">
   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
     <span class="sr-only">Toggle navigation</span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
   </button>
   <a class="navbar-brand">Jeppiaar Transport</a>
 </div>

 <div class="navbar-collapse collapse">
   <ul class="nav navbar-nav navbar-right">
     <li><a href="Attendence.jsp" >Home</a></li>
    <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown">Register<b class="caret"></b></a>
       <ul class="dropdown-menu">
         <li><a href="Registration.jsp">Student</a></li>
         <li><a href="StaffRegistration.jsp">Staff</a></li>
         </ul>
         </li>
          
     <li class="dropdown">
       <a class="dropdown-toggle" data-toggle="dropdown">Update<b class="caret"></b></a>
       <ul class="dropdown-menu">
       			 <li><a href="BoardingPoint.jsp">BoardingPoint</a></li>
                  <li><a href="Delete.jsp">Delete</a></li>
        			
       </ul>
     </li>
     <li><a href="Login.jsp" >Logout</a></li>
   </ul>
 </div>
  
 </div>
    
<!-- end of navigator -->
<!-- update -->
<% 
String msg=(String)request.getAttribute("msg");
if(msg!=null){
%>
<div id="contact-form" class="form-container" data-form-container style="color: rgb(46, 125, 50); background: rgb(200, 230, 201);">
	<div class="row">
		<div class="form-title">
			<span>Updated Successfully</span>
		</div>
	</div>
	</div>
<%
}%>
<!--end update -->

<!-- footer -->
 <footer class="footer">
    <div class="container">
      <div class="row">
      <div class="col-lg-4 col-md-4 col-sm-5 col-xs-5">
        &copy Jeppiaar Engineering College
        </div>
         <div class="col-lg-3 col-md-3 col-sm-1 col-xs-1"></div>
         <div class="col-lg-5 col-md-5 col-sm-6 col-xs-6">
         Designed by Eugine(IT-department)
         </div>
        </div>
      </div>
</footer>
    
<!-- Bootstrap core JavaScript -->
        <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    
</body>
</html>