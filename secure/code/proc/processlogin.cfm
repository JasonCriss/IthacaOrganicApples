<cfparam name="password" default="">
<cfparam name="email" default=""> 
<cfset passwordHash = hash(password)>
<cfquery datasource="hemlockgrove" name="checkCredentials">
	select
		*
	from
		[user]
	where
		login = <cfqueryparam cfsqltype="cf_sql_varchar" value="#email#">
		and password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#passwordHash#">
</cfquery>
<cfif checkCredentials.recordcount eq 1>
	<!--- login successful load user object and continue --->
	<cfset objUser = CreateObject("component","hgf.code.obj.user")>
	<cfset proceed = objUser.load(checkCredentials.user_id)>
	<cfif proceed>
		<cfset session.objUser = objUser>
		<cfif session.objUser.getresetpassword() eq 1>
			<cflocation url="/secure/changepassword.cfm" addtoken="no">
		<cfelse>
			<cflocation url="/secure/index.cfm" addtoken="no">
		</cfif>
	</cfif>
<cfelse>
	<!--- login failed return to login screen --->
	<cflocation url="/secure/login.cfm?error=1">
</cfif>

