<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>Truck</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<title>Insert title here</title>
<style>
body
{
 background-image: url("https://pictures.topspeed.com/IMG/crop/201005/scania-v8-truck-rang-24_1600x0w.jpg");
   background-repeat: no-repeat;
  background-size: cover;
  color:white;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="\" class="navbar-brand">Euro_trucK</a>
			</div>
			
				<ul class="nav navbar-nav">
					                       <!--      <a href="/delete?id=${user.id }" -->  
					<li><a href="/truck?id=${user.id }">All Trucks</a></li>
					<li><a href="/edit?id=${id}">Edit</a></li>
					<li><a href="/yourbookings?id=${id }">your book</a></li>
					</ul>
					
					
					<form class="navbar-form navbar-right" method="post" action="search">
					<div class="input-group">
					<input class="form-control" type="text" name="location" placeholder="search location" required="true">
					<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
					<i class="glyphicon glyphicon-search"></i>
					</button>
					</div>
					
					</div>
					<a href="/login">        <span class="glyphicon glyphicon-log-out"></span> Log out</a>
					</form>
					 
					</div>
						
				</div>

	</nav>

<h1><center>Booking</center></h1>
<c:choose>
<c:when test="${mode=='BOOKED' }">
<c:set var="now" value="<%=new java.util.Date()%>" />
<p>Today Date: <fmt:formatDate pattern="yyyy-MM-dd" value="${now}" /></p>
<hr>
<div class="container">
  <table class="table">
    <thead>
<h2>Details</h2>
    </thead>
    <tbody>
      <tr>
        <td>User name</td>
        <td>${username }</td>
      </tr>      
      <tr>
        <td>Truck Id</td>
        <td>${truckid }</td>
      </tr>
      <tr >
        <td>Contact Email</td>
        <td>${email }</td>
      </tr>
      <tr >
        <td>Your contact</td>
        <td>${useremail }</td>
      </tr>
    </tbody>
  </table>
</div>
<div class="container text-center">
<div class="alert alert-success">
  <strong>Success!</strong> Successfully Booked Our client will contact soon.
</div>
</div>

</c:when>

<c:when test="${mode=='CHOOSE_OTHER'}">

<div class="container text-center">
<div class="alert alert-danger">
  <strong>${error} !</strong> 

</div>
<button class="btn btn-success" type="button" "><a  href="/truck?id=${user.id }" style="color:white;text-decoration:none;">Show Trucks</a></button>
</div>
</c:when>
</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	
</body>
</html>