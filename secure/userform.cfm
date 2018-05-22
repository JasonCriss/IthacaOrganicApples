<cfparam name="userid" default="">

<cfif userid eq "">
	<cfif not session.objUser.hasRole("can access users")>
		<cflocation url="index.cfm">
	</cfif>
	<cfset loadInfo = false>
<cfelse>
	<cfif not session.objUser.hasRole("can access users")>
		<cflocation url="index.cfm">
	</cfif>
	<cfset objEditUser = CreateObject("component","hgf.code.obj.user")>
	<cfset loadInfo = objEditUser.load(userid)>
</cfif>

<cfset objAdmin = CreateObject("component","hgf.code.obj.admin")>
<cfset pageTitle = "Hemlock Grove Farm - User Details">
<cfset navlocation = "users">
<cfinclude template="./includes/header.cfm">
<div class="container">
	<h3>User Form</h3>
	<form role="form" method="post" action="/secure/code/proc/processuserform.cfm">
		<cfoutput><input type="hidden" name="userid" value="#userid#"></cfoutput>
		<div class="row">
			<div class="col-md-8">
				<div class="form-group">
					<label for="firstname">First name</label>
					<input type="text" class="form-control" id="firstname" placeholder="Enter First Name" name="firstname" <cfif loadInfo><cfoutput> value ="#objEditUser.getfirstname()#"</cfoutput></cfif>>
				</div>
				<div class="form-group">
					<label for="lastname">Last name</label>
					<input type="text" class="form-control" id="lastname" placeholder="Enter Last Name" name="lastname" <cfif loadInfo><cfoutput> value ="#objEditUser.getlastname()#"</cfoutput></cfif>>
				</div>
				<div class="form-group">
					<label for="email">Email address</label>
					<input type="email" class="form-control" id="email" placeholder="Enter Email" name="email" <cfif loadInfo><cfoutput> value ="#objEditUser.getemail()#"</cfoutput></cfif>>
				</div>
            </div>
            <div class="col-md-4">
				<div class="form-group">
					<label for="password">New Password</label>
					<input type="text" class="form-control" id="password" placeholder="Enter Password" name="password">
				</div>
				<div class="form-group">
					<div class="checkbox">
						<label>
							<input type="checkbox" value="1" name="forcepwreset" <cfif not loadInfo>checked='checked'</cfif>>
							Force Password Reset
						</label>
					</div>
				</div>
				<div class="form-group">
					<cfset roles = objAdmin.getRoles()>
					<label>User Roles</label>
					<cfoutput query="roles">
						<div class="checkbox">
						  <label>
							<input type="checkbox" value="#role_id#" name="role"
							<cfif loadInfo>
								<cfif listfind(objEditUser.getroleids(),role_id)>
									checked="checked"
								</cfif>
							</cfif> 
							>
							#role#
						  </label>
						</div>
					</cfoutput>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<button type="submit" class="btn btn-primary btn-lg col-sm-12" name="login"><span class="glyphicon glyphicon-save"></span> Save User</button>
			</div>
		</div>
	</form>
</div>
<cfinclude template="./includes/footer.cfm">