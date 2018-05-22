<cfset objAdmin = CreateObject("component","hgf.code.obj.admin")>
<cfset apples = objAdmin.getAllApples()>
<cfset pageTitle = "Hemlock Grove Admin - Users">
<cfset navlocation = "website">
<cfinclude template="./includes/header.cfm">
<script src="/secure/scripts/pages.js"></script>

<div class="container">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#about" data-toggle="tab">About</a></li>
      <li><a href="#csa" data-toggle="tab">CSA</a></li>
      <li><a href="#sales" data-toggle="tab">Sales</a></li>
      <li><a href="#settings" data-toggle="tab">Settings</a></li>
    </ul>
    
    <!-- Tab panes -->
    <div class="tab-content">
      <div class="tab-pane active" id="about">
      	<cfset aboutContent = objAdmin.getLatestWebContent("about")>
      	<h1>About Our Orchard</h1>
      	<form action="/secure/code/ajax/processcontent.cfm" method="post">
        	<input type="hidden" name="section" value="about">
        	<textarea class="summernote" name="content"><cfoutput>#aboutContent.webcontent#</cfoutput></textarea>
            <button type="submit" class="btn btn-primary" style="margin-top:20px;">Save Text Content</button>
        </form>
      </div>
      <div class="tab-pane" id="csa">
      	<cfset aboutContent = objAdmin.getLatestWebContent("csa")>
      	<h1>CSA</h1>
      	<div class="row">
        <div class="col-md-8">
        <form action="/secure/code/ajax/processcontent.cfm" method="post">
        	<input type="hidden" name="section" value="csa">
        	<textarea class="summernote" name="content"><cfoutput>#aboutContent.webcontent#</cfoutput></textarea>
            <button type="submit" class="btn btn-primary" style="margin-top:20px;">Save Text Content</button>
        </form>
        </div>
        <div class="col-md-4">
        <form action="/secure/code/ajax/processcsa.cfm" method="post">
        	<cfset aboutContent = objAdmin.getLatestWebContent("thisweeksshare")>
            <cfset csaapples = objAdmin.getThisWeeksAppleIDs()>
        	<h3 style="margin:0;padding:0;">Whats in my bag?</h3>
            <input type="hidden" name="section" value="thisweeksshare">
            <textarea id="thisweeksshare" name="content"><cfoutput>#aboutContent.webcontent#</cfoutput></textarea>
			<cfoutput query="apples">
            	<div class="checkbox">
                  <label>
                    <input type="checkbox" value="#apple_id#" name="shareapples" <cfif listfind(csaapples,apple_id)> checked="checked"</cfif>>
                    #variety#
                  </label>
                </div>
            </cfoutput>
            <button type="submit" class="btn btn-primary" style="margin-top:20px;">Save Text Content</button>
        </form>
        </div>
        </div>
      </div>
      <div class="tab-pane" id="sales">
      	<cfset aboutContent = objAdmin.getLatestWebContent("sales")>
      	<h1>Sales</h1>
      	<div class="row">
        <div class="col-md-9">
        <form action="/secure/code/ajax/processcontent.cfm" method="post">
        	<input type="hidden" name="section" value="sales">
        	<textarea class="summernote" name="content"><cfoutput>#aboutContent.webcontent#</cfoutput></textarea>
            <button type="submit" class="btn btn-primary" style="margin-top:20px;">Save Text Content</button>
        </form>
        </div>
        <div class="col-md-3">
        <form action="/secure/code/ajax/processsales.cfm" method="post">
        	<cfset availableapples = objAdmin.getAvailableAppleIDs()>
        	<h3 style="margin:0;padding:0;">Available Apples:</h3>
			<cfoutput query="apples">
            	<div class="checkbox">
                  <label>
                    <input type="checkbox" value="#apple_id#" name="availableapples" <cfif listfind(availableapples,apple_id)> checked="checked"</cfif>>
                    #variety#
                  </label>
                </div>
            </cfoutput>
            <button type="submit" class="btn btn-primary" style="margin-top:20px;">Save Avaialble Apples</button>
        </form>
        </div>
        </div>
      </div>
      <div class="tab-pane" id="settings">settings</div>
    </div>
</div>

<cfinclude template="./includes/footer.cfm">
