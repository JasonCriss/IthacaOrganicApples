<cfset objAdmin = CreateObject("component","hgf.secure.code.obj.admin")>
<cfset aboutContent = objAdmin.getLatestWebContent("sales")>
<cfset apples = objAdmin.getApplesByList("availableapples")>
<cfset section="sales">
<cfinclude template="/includes/header.cfm">
<div class="row">
	<div class="col-md-12">
		<cfoutput>#aboutContent.webcontent#</cfoutput>
    </div>
</div>
<div class="row">
	<div class="col-md-12">
    	<h2>Apple Varieties Currently Available</h2>
        <div class="table-responsive">
        <table class="table table-striped table-hover">
				<thead>
					<tr>
                    	<th>Photo</th>
						<th>Variety</th>
						<th>Descrition</th>
					</tr>
				</thead>
				<tbody>
					<cfloop query="apples">
						<cfoutput>
						<tr>
                        	<td><img src="/images/apples/thumb/#photo#" alt="#variety# apple"></td>
							<td><strong>#variety#</strong></td>
							<td>#description#</td>
						</tr>
						</cfoutput>
					</cfloop>
				</tbody>
			</table>
            </div>
    </div>
</div>

<cfinclude template="/includes/footer.cfm">