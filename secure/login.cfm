<cfparam name="error" default="">
<!doctype html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    
    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
    
    <!-- Latest compiled and minified JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <title>Hemlock Grove Farm Organic Apples Administration</title>
</head>

<body>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="col-md-12" style="text-align:center">
				<h1>Hemlock Grove Farm</h1>
			</div>
			<cfif error eq "1">
				<div class="alert alert-danger">
					Login Failed! Please try again.
				</div>
			</cfif>
			<form role="form" method="post" action="/secure/code/proc/processlogin.cfm">
				<div class="form-group">
					<label for="exampleInputEmail1">Username</label>
					<input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter username" name="email">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
				</div>
				<button type="submit" class="btn btn-success col-md-12" name="login"><span class="glyphicon glyphicon-log-in"> Log in</button>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div style="display:block;text-align:right;margin-top:20px;"><a  class="btn btn-danger btn-xs" role="buton" href="passrecover.cfm">Forgot Password?</a></div>
		</div>
	</div>
</div>
</body>
</html>
