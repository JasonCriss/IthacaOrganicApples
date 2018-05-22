<cfparam name="user_id" default="">
<cfparam name="role" default="">
<cfparam name="forcepwreset" default="0">
<cfparam name="form.contacts" default="">
<cfif userid eq "">
	<cfif not session.objUser.hasRole("can access users")>
		<cflocation url="secure/index.cfm">
	</cfif>
<cfelse>
	<cfif not session.objUser.hasRole("can access users")>
		<cflocation url="/secure/index.cfm">
	</cfif>
</cfif>

<cfif userid eq "">
	<cfset objNewUser = CreateObject("component","hgf.code.obj.user")>
	<cfset objNewUser.create(
		firstname = form.firstname ,
		lastname = form.lastname ,
		email = form.email ,
		login = form.email ,
		resetpassword = forcepwreset ,
		roleids = role)>
	<cfset objNewUser.setPassword(password)>
<cfelse>
	<cfset objEditUser = CreateObject("component","hgf.code.obj.user")>
	<cfset loadInfo = objEditUser.load(userid)>
	<cfif loadInfo>
		<cfset objEdituser.setfirstname(form.firstname)>
		<cfset objEdituser.setlastname(form.lastname)>
		<cfset objEdituser.setemail(form.email)>
		<cfset objEdituser.setlogin(form.email)>
		<cfset objEdituser.setresetpassword(forcepwreset)>
		<cfset objEdituser.setroleids(role)>
		<cfset objEditUser.save()>
		<cfif password neq "">
			<cfset objEditUser.setPassword(password)>
		</cfif>
	</cfif>
</cfif>

<cflocation url="/secure/users.cfm">
