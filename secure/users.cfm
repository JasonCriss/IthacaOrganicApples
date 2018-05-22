<cfset objAdmin = CreateObject("component","hgf.code.obj.admin")>
<cfset pageTitle = "Hemlock Grove Admin - Users">
<cfset navlocation = "users">
<cfinclude template="./includes/header.cfm">
<cfset users = objAdmin.getAllUsers()>

<div class="container">
	<div class="row">
		<div class="col-md-4">
			<a href="userform.cfm" class="btn btn-success btn-md" role="button"><span class="glyphicon glyphicon-plus-sign"></span> Add New User</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Last Name</th>
						<th>First Name</th>
						<th>Email</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<cfloop query="users">
						<cfoutput>
						<tr>
							<td>#lastname#</td>
							<td>#firstname#</td>
							<td>#email#</td>
							<td align="right">
								<a href="userform.cfm?userid=#user_id#" class="btn btn-primary btn-xs" role="button"><span class="glyphicon glyphicon-edit"></span> Edit User</a>
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