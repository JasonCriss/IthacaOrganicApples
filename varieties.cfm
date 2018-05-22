<cfset objAdmin = CreateObject("component","hgf.secure.code.obj.admin")>
<cfset apples = objAdmin.getAllApples("ripeningmonth, ripeningtimeofmonth")>
<cfset section="varieties">
<cfinclude template="/includes/header.cfm">
<link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="/scripts/imagegallery/css/bootstrap-image-gallery.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<script src="/scripts/imagegallery/js/bootstrap-image-gallery.min.js"></script>
<script>
	$(document).ready(function(e) {
        $('#blueimp-gallery').data('useBootstrapModal', false);
        $('#blueimp-gallery').toggleClass('blueimp-gallery-controls', true);
    });
</script>
<cfloop query="apples">
<cfoutput>
	<div class="row">
    	
        <div class="col-sm-8 col-sm-offset-1" id="links">
            <div class="row"   style="background-color:##eee; margin-bottom:10px; padding-bottom:20px;border-radius:10px;">
                <div class="col-sm-4">
                    <a href="/images/apples/large/#photo#" title="#variety#" data-gallery>
                    	<img src="/images/apples/medium/#photo#" style="width:100%;margin-top:20px;" class="img-circle" alt="#variety# apple" />
                    </a>
                </div>
                <div class="col-sm-8">
                    <h2>#variety#</h2>
                    <p>#description#</p>
                </div>
                <p style="display:block;position:absolute;bottom:5px;;right:10px;padding-top10px;">Ripens in 
                    <cfswitch expression="#ripeningtimeofmonth#">3
                        <cfcase value="1">
                            Early
                        </cfcase>
                        <cfcase value="2">
                            Mid
                        </cfcase>
                        <cfcase value="3">
                            Late
                        </cfcase>
                    </cfswitch>
                    #Monthasstring(ripeningmonth)#
                </p>
            </div>
    	</div>
        <div class="col-sm-2 hidden-xs">
        	<cfswitch expression="#ripeningmonth#">
            	<cfcase value="8">
                	<img src="/images/aug.png" style="width:100%;margin-top:20px;" alt="Ripens in August">
                </cfcase>
                <cfcase value="9">
                	<img src="/images/sep.png" style="width:100%;margin-top:20px;" alt="Ripens in September">
            	</cfcase>
                <cfcase value="10">
                	<img src="/images/oct.png" style="width:100%;margin-top:20px;" alt="Ripens in October">
            	</cfcase>
            </cfswitch>
        </div>
	</div>
</cfoutput>
</cfloop>
<div id="blueimp-gallery" class="blueimp-gallery">
    <!-- The container for the modal slides -->
    <div class="slides"></div>
    <!-- Controls for the borderless lightbox -->
    <h3 class="title"></h3>
    <a class="prev" style="border:none;background:none;"><span class="glyphicon glyphicon-chevron-left"></span>
</a>
    <a class="next" style="border:none; background:none;margin-right:20px;"><span class="glyphicon glyphicon-chevron-right"></a>
    <a class="close"><span class="glyphicon glyphicon-remove"></a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
    <!-- The modal dialog, which will be used to wrap the lightbox content -->
    <div class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body next"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left prev">
                        <i class="glyphicon glyphicon-chevron-left"></i>
                        Previous
                    </button>
                    <button type="button" class="btn btn-primary next">
                        Next
                        <i class="glyphicon glyphicon-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<cfinclude template="/includes/footer.cfm">

			