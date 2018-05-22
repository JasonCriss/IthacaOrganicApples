<cfset objAdmin = CreateObject("component","hgf.code.obj.admin")>
<cfset pageTitle = "Hemlock Grove Admin - Apples">
<cfset navlocation = "apples">
<cfinclude template="./includes/header.cfm">
<cfset apples = objAdmin.getAllApples()>

<div class="container">
	<div class="row">
		<div class="col-md-4">
			<a href="appleform.cfm" class="btn btn-success btn-md" role="button"><span class="glyphicon glyphicon-plus-sign"></span> Add New Apple</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
                    	<th></th>
						<th>Variety</th>
						<th>Descrition</th>
						<th>Ripens</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<cfloop query="apples">
						<cfoutput>
						<tr>
                        	<td><img src="/images/apples/thumb/#photo#"></td>
							<td>#variety#</td>
							<td>#description#</td>
							<td>
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
                            #MonthAsString(ripeningmonth)#</td>
							<td align="right">
								<a href="appleform.cfm?appleid=#apple_id#" class="btn btn-primary btn-xs" role="button"><span class="glyphicon glyphicon-edit"></span> Edit Apple</a>
							</td>
						</tr>
						</cfoutput>
					</cfloop>
				</tbody>
			</table>
		</div>
	</div>
</div>
<cfinclude template="./includes/footer.cfm">