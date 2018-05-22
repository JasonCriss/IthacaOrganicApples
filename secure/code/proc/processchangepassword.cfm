<cfparam name="password" default="">
<cfparam name="passwordverify" default="">

<cfset continue = true>
<cfset error = 0>

<cfif password neq passwordverify>
	<cfset continue = false>
	<cfset error = 1>
<cfelseif len(password) lt 8>
	<cfset continue = false>
	<cfset error = 2>
</cfif>

<cfif continue>
	<cfset session.objUser.setpassword(password)>
	<cfset session.objUser.setresetpassword(0)>
	<cfset session.objUser.save()>
	<cflocation url="/secure/index.cfm" addtoken="no">
<cfelse>
	<cfoutput>
		<cflocation url="/secure/changepassword.cfm?error=#error#" addtoken="no">
	</cfoutput>
</cfif>



