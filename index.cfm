<cfset objAdmin = CreateObject("component","hgf.secure.code.obj.admin")>
<cfset aboutContent = objAdmin.getLatestWebContent("about")>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:image" content="http://www.ithacaorganicapples.com/images/fbrect.jpg" />
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
    <link rel="stylesheet" type="text/css" href="/styles/index.css">
</head>
<body>
    <div class="container" id="mainContent">
        <div class="row">
        	<div class="col-md-6">
            	<img class="resizeable" src="/images/hgflogo.png" alt="Hemlock Grove Farm">
            </div>
            <div class="col-md-6 hidden-sm hidden-xs" style="color:#ddd"  id="marketing">
            	<div class="row" style="margin-top:60px;">
                	<h1 class="col-md-offset-1">Delicious</h1>
                </div>
                <div class="row" style="margin-top:30px;">
                	<h1 class="col-md-offset-6">Organic</h1>
                </div>
                <div class="row" style="margin-top:30px;">
                	<h1 class="col-md-offset-3">Local</h1>
                </div>
            </div>
        </div>
        <div class="row">
        	<div class="" id="mainNav">    
            <ul class="nav nav-pills">
                <li class="active"><a href="#about">About</a></li>
                <!---<li><a href="csa.cfm">CSA</a></li>--->
                <li><a href="sales.cfm">Sales</a></li>
                <li><a href="varieties.cfm">Varieties</a></li>
                <!---<li><a href="#">Photos</a></li>--->
                <li><a href="contact.cfm">Contact</a></li>
            </ul>
        </div>
        </div>
        <div class="row" id="about">
        	<div class="col-md-12">
            	<a name="about"></a>
                <h1>About Our Orchard</h1>
                <div style="background-color: rgba(255,255,255,.8);padding:10px;border-radius:10px;font-size:16px;">
                <cfoutput>#aboutContent.webcontent#</cfoutput>
            </div>
        </div>
    </div>
</div>
<div id="footer">
	<div class="container">
    	<div class="row">
            <div class="col-md-4">
                &copy; Hemlock Grove Farm 2014
            </div>
            <div class="col-md-4" style="text-align:center;">
                <a href="mailto:hemlockgrovefarm@gmail.com">hemlockgrovefarm@gmail.com</a>
            </div>
            <div class="col-md-4">
                <div id="fb-root"></div>
                <div class="fb-like pull-right" data-href="https://www.facebook.com/HemlockGroveFarm" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
        </div>
    </div>
</div>
</body>
</html>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-39348640-1', 'ithacaorganicapples.com');
  ga('send', 'pageview');

</script>

