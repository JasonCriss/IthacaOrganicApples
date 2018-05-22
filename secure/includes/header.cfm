<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><cfoutput>#pageTitle#</cfoutput></title>
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

<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
<!-- include (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.min.css" />
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.min.css">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.min.js"></script>

<!-- include summernote css/js-->
<link rel="stylesheet" type="text/css" href="scripts/summernote.css">
<script src="/secure/scripts/summernote.min.js"></script>

</head>

<body>

	<nav class="navbar navbar-default" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.cfm">Hemlock Grove Farm</a>
		</div>
		
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<cfif isdefined("session.objUser") and session.objUser.hasRole("can access users")>
					<li<cfif navlocation eq "users"> class="active"</cfif>><a href="users.cfm">Users</a></li>
				</cfif>
                <cfif isdefined("session.objUser") and session.objUser.hasRole("can access file tool") and cgi.SERVER_NAME neq "www.ithacaorganicapples.com">
					<li<cfif navlocation eq "migration"> class="active"</cfif>><a href="migration.cfm">Migration Tool</a></li>
				</cfif>
				<cfif isdefined("session.objUser") and session.objUser.hasRole("can access apples")>
					<li<cfif navlocation eq "apples"> class="active"</cfif>><a href="apples.cfm">Apples</a></li>
				</cfif>
				<cfif isdefined("session.objUser") and session.objUser.hasRole("can access website")>
					<li<cfif navlocation eq "website"> class="active"</cfif>><a href="pages.cfm">Pages</a></li>
				</cfif>
			</ul>
			<ul class="nav navbar-nav navbar-right">
     			<li><a href="logout.cfm"><span class="glyphicon glyphicon-log-out"> LOGOUT</a></li>
    		</ul>
		</div><!-- /.navbar-collapse -->
	</nav>
