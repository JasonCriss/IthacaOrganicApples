<cfparam name="error" default="0">
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NYS Promise Login</title>
<!--- JQuery CDN --->
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!--- Bootstrap  CDN --->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<h2>Hemlock Grove Farm</h2>
			<cfswitch expression="#error#">
				<cfcase value="1">
					<div class="alert alert-danger">
						Passwords did not match
					</div>
				</cfcase>
				<cfcase value="2">
					<div class="alert alert-danger">
						Password must be at least 8 characters in length
					</div>
				</cfcase>
				<cfdefaultcase>
				</cfdefaultcase>
			</cfswitch>
			<form role="form" method="post" action="/secure/code/proc/processchangepassword.cfm">
				<div class="form-group">
					<label for="password">New Password (at least 8 characters)</label>
					<input type="password" class="form-control" id="password" placeholder="New Password" name="password">
				</div>
				<div class="form-group">
					<label for="passwordverify">Verify Password</label>
					<input type="password" class="form-control" id="passwordverify" placeholder="Verify Password" name="passwordverify">
				</div>
				<button type="submit" class="btn btn-default" name="login">Change Password</button>
			</form>
		</div>
	</div>
</div>
<cfdump var="#session#">
</body>
</html>