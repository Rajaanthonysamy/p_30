<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>Truck</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>

body {
  /* The image used */
  background-image:url("https://www.trucksplanet.com/photo/scania/l-series-4th-generation/l-series-4th-generation_27457.jpg");
  /*background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQCDEq3xlGGUY_r7DL8JHRCaM-io5LS6svOvg&usqp=CAU"); */

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  
  background-repeat: no-repeat;
  background-size: cover;
 background-attachment: fixed;
  color: white;
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
	
		<h1>Welcome ${username}</h1>
		<br>
		<br>
		<br>
		
	<c:choose>
	
	<c:when test="${mode=='PAGE' }">
	<div class="txt">
	<center>	<h2> Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work.</h2></center>
	</div>
	</c:when>
	
	
		<c:when test="${mode=='ALL_TRUCKS' }">
			<div class="container text-center" id="tasksDiv">

				<h3>All Trucks</h3>
				<hr>
				<div class="table-responsive">
					<table class="table ">
						<thead>
							<tr>
								<th>Truck ID</th>
								<th>Location</th>
								<th>Capacity</th>
								<th>Category</th>
								<th>Cost /Km</th>
								<th>Driver Salary</th>
								<th>Email</th>
								<th>Booking</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="trucks" items="${truck}">
							${user.id }
								<tr>
									<td>${trucks.truckid}</td>
									<td>${trucks.location}</td>
									<td>${trucks.capacity}</td>
									<td>${trucks.type}</td>
									<td>${trucks.cost}</td>
									<td>${trucks.driver_salary}</td>
								    <td>${trucks.email}</td>
								    <td><a href="/book?truckid=${trucks.truckid }&email=${trucks.email}"><button type="button" class="btn btn-success">Book</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		
		<c:when test="${mode=='BOOKING_MODE' }">
		
		
		<div class="container">
  <h2>Details of truck </h2>
  
  
  <form class="form-horizontal" action="booking" method="post">
  <input type="hidden" name="truckid" value="${trucks.truckid}" />
  <input type="hidden" name="id" value="${id}" />
  <input type="hidden" name="temail" value="${trucks.email }"/>
   <!--  <div class="form-group">
      <label class="control-label col-sm-2" for="truckid">Truck Id:</label>
      <div class="col-sm-10">
       <p>${truck.truckid}</p>
      </div>
    </div> -->
    
    
    
    
    <div class="container">
  <h2></h2>          
  <table class="table table-bordered">
    <tbody>
    <tr>
    <td>Username </td>
    <td><input type="text" value=${username} name="username" readonly style="border:0px;background-color:transparent;"></td>
    </tr>
      <tr>
        <td>Truck id</td>
        <td><input type="text" value="${truck.truckid}" name="tid" readonly style="border:0px;background-color:transparent;"></td>

      </tr>
                <tr>
         <td>Truck Contact</td>
         <td><input type="text" value="${truck.email}" name="temail" readonly  style="border:0px;background-color:transparent; "></td>
         </tr>
      
      <tr>
        <td>Truck Location</td>
        <td>${truck.location}</td>
      </tr>
      <tr>
        <td>Cost /km</td>
        <td>${truck.cost}</td>
         </tr>
         
         <tr>
         <td>From</td>
         <td><input type="text" name="fromlocation" placeholder="From location" required="true" style="color:black;"></td>
         </tr>
         
                  <tr>
         <td>To</td>
         <td><input type="text" name="tolocation" placeholder="To location" required="true" style="color:black;"></td>
         </tr>
         
         <tr>
         <td>Kilometer</td>
         <td><input type="text" name="km" placeholder="Enter the total kilometer" required="true" style="color:black;"></td>
         </tr>
         
         <tr>
         <td>Date</td>
         <td><input type="date" name="bookingdate" required="true" style="color:black;"></td>
         </tr>

         
    </tbody>
  </table>
</div>
    
   <!--      
    <div class="form-group">
      <label class="control-label col-sm-2" for="location">Location:</label>
      <div class="col-sm-10">          
        <p>${truck.location}</p>
      </div>
    </div>
    <div class="form-group">     
    
        <div class="form-group">
      <label class="control-label col-sm-2" for="type">Type:</label>
      <div class="col-sm-10">          
        <p>${truck.type}</p>
      </div>
    </div>
    <div class="form-group"> 
     -->
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> Agree</label>
        </div>
      </div>
    </div>
    <center>
    <div class="form-group"style="left-margin=45%;">        
      <div class="col-sm-offset-2 col-sm-10" >
        <button type="submit" class="btn btn-default" >Submit</button>
      </div>
    </div></center>
  </form>
</div>
			
		</c:when>
		
		<c:when test="${mode=='SEARCH_MODE' }">
			<div class="container text-center" id="tasksDiv">

				<h3>All Trucks</h3>
				<hr>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>Truck ID</th>
								<th>Location</th>
								<th>Capacity</th>
								<th>Category</th>
								<th>Cost /Km</th>
								<th>Driver Salary</th>
								<th>Email</th>
								<th>Booking</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="trucks" items="${truck}">
							${user.id }
								<tr>
								
									<td>${trucks.truckid}</td>
									<td>${trucks.location}</td>
									<td>${trucks.capacity}</td>
									<td>${trucks.type}</td>
									<td>${trucks.cost}</td>
									<td>${trucks.driver_salary}</td>
								    <td>${trucks.email}</td>
								    <td><a href="/book?truckid=${trucks.truckid }&email=${trucks.email}"><button type="button" class="btn btn-success">Book</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		
				<c:when test="${mode=='USER_EDIT' }">
			<div class="container text-center">
				<h3>Update User</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="update">
					<input type="hidden" name="id" value="${id}" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								value="${user.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								value="${user.lastname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Email </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="useremail"
								value="${user.useremail }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		</c:when>
		
		
		
		
		<c:when test="${mode=='BOOKING_HISTORY' }">
			<div class="container text-center" id="tasksDiv">

				<h3>Your Bookings</h3>
				<hr>
				<div class="table-responsive">
					<table class="table ">
						<thead>
							<tr>
								<th>Bookid Id</th>
								<th>User Id</th>
								<th>Truck Id</th>
								<th>Cost </th>
								<th>From Location</th>
								<th>To Location</th>
								<th>Km</th>
								<th>Booking Date</th>
								<th>Contact</th>
								<th>Cancel bookings</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="booking" items="${bookings}">
							${user.id }
								<tr>
									<td>${booking.btid}</td>
									<td>${booking.id}</td>
									<td>${booking.tid}</td>
									<td>${booking.cost }</td>
									<td>${booking.fromlocation}</td>
									<td>${booking.tolocation}</td>
									<td>${booking.km}</td>
								    <td>${booking.bookingdate}</td> 
								    <td>${booking.temail}</td>
								    <td>
								     <c:set var="now" value="<%=new java.util.Date()%>" />
								     
								    <c:if test="${booking.bookingdate ge now}">
  
<button type="button" class="btn btn-danger"><a href="/cancel?btid=${booking.btid }&id=${booking.id}" style="text-decoration:none;color:white;">Cancel</a></button>
								    
</p>
</c:if>
</td> 				
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		
		
	</c:choose>
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	</body>
	</html>