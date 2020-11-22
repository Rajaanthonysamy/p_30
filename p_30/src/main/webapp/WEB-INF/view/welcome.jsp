<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>


<style>

body {
  /* The image used */
  background-image:url("https://www.homestratosphere.com/wp-content/uploads/2019/07/A-trailer.jpg");
  /*background-image: url("https://images.unsplash.com/photo-1485575301924-6891ef935dcd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"); */

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  
  background-repeat: no-repeat;
  background-size: cover;

  border: 2px solid;
  color: pink;
}
.homediv
{
background-color:white;
}
.container{
  color:white;
  background-color:transprent;
}
.txt{
margin-left:100px;
margin-right:100px;
font-size:20px;
}



</style>
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

</head>

<body>

	<div role="navigation" id="nav">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Euro_trucK</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">                     
					<li><a href="/login">Login</a></li>
					<!-- <li><a href="/register">New Registration</a></li> -->
					<li><a href="/showtrucks">All Users</a></li>
				</ul>
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${mode=='MODE_HOME'}">

			<div class="container" id="homediv" >
				<div >
					<h1><center>EuroTruck DEALER</center></h1>
					<h3><center>Awesome</center></h3>
				</div>
			</div>
			<div class="jumbotron container" style="background-color:transparent;"><br><br> <br>
			<p style="color:black;">One of the leading Indian truck booking portals, EUROTRUCK offers you the opportunity to enjoy transport facility with the simple click of a button. Enjoy a hassle-free online truck transport facility at the best rates when you avail our logistic service that is here to aid you by picking loads and delivering the same across different locations in India.
			Services like real time tracking and alerts to ensure the safety of the in-transit materials, on-time delivery, improved inventory management, customised reporting, dashboards, and much more have helped us to build a better rapport with our consumers. You can look forward to an easy load booking procedure and better fleet management along with minimised idle truck time when you choose us as a transport partner for delivering or fetching important loads across your city. We endeavour to offer you the best online truck booking facilities in India. To improve our services, we have implemented advanced technologies.
			</p>
	</div>
		</c:when>


		<c:when test="${mode=='MODE_REGISTER'}">
			<div class="container text-center">
				<h3>New Registration</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="saveuser">
					<input type="hidden" name="id" value="${user.id }" />
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
						<input type="submit" class="btn btn-primary" value="Register" />
					</div>
				</form>
			</div>
		</c:when>


		<c:when test="${mode=='ALL_USERS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All Users</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>UserName</th>
								<th>First Name</th>
								<th>LastName</th>
								<th>Email</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users }">
								<tr>
									<td>${user.id}</td>
									<td>${user.username}</td>
									<td>${user.firstname}</td>
									<td>${user.lastname}</td>
									<td>${user.useremail}</td>
									<td><a href="/delete?id=${user.id }"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit?id=${user.id }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>



		<c:when test="${mode=='MODE_LOGIN' }">
			<div class="container text-center">
				<h3>Log in</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="loginuser">

					<c:if test="${not empty Error }">
						<div class="alert alert-danger">
							<c:out value="${Error}"></c:out>
						</div>
					</c:if>


					<div class="form-group">
					
						<label class="control-label col-md-3">Email</label>
						<div class="col-md-7">
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
						<input type="submit" class="btn btn-primary" value="login" />
						<br>
						<br>
						<button class="btn btn-primary" ><a href="/register" style="text-decoration:none;color:white;">New User</a></button>
						
					</div>
					
				</form>
			</div>
		</c:when>
	</c:choose>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>





</html>

