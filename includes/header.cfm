<!doctype html>
<html lang="en">
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
    <script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
	  fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));
	</script>
    <title>Hemlock Grove Farm Organic Apples</title>
    <link rel="stylesheet" type="text/css" href="/styles/main.css">
</head>
<body>
<div class="container" id="mainContent">
	<div class="row">
    	<div class="col-md-12">
        	<a href="index.cfm"><img src="/images/hgflogo150h.png" style="margin:10px 0 35px 0; " alt="Hemlock Grove Farm"></a>
        </div>
    </div>
    <div class="row">
    	<div id="mainNav">    
            <ul class="nav nav-pills">
                <li><a href="index.cfm">About</a></li>
                <!---<li <cfif section eq "csa">class="active"</cfif>><a href="csa.cfm">CSA</a></li>--->
                <li <cfif section eq "sales">class="active"</cfif>><a href="sales.cfm">Sales</a></li>
                <li <cfif section eq "varieties">class="active"</cfif>><a href="varieties.cfm">Varieties</a></li>
                <!---<li><a href="#">Photos</a></li>--->
                <li <cfif section eq "contact">class="active"</cfif>><a href="contact.cfm">Contact</a></li>
            </ul>
        </div>
    </div>