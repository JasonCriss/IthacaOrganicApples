<cfcomponent displayname="hgf" output="true" hint="Handle the application.">

<cfset THIS.Name = "hgf"/>
<cfset THIS.ApplicationTimeout = CreateTimeSpan(2,0,0,0)/>
<cfset THIS.sessionmanagement = true/>
<cfset THIS.sessiontimeout = CreateTimeSpan(2,0,0,0)/>
<cfset this.mappings["/hgf"] = getDirectoryFromPath(getCurrentTemplatePath()) />


<!--- APPLICATION START --->
<cffunction name="OnApplicationStart">
	<cfparam name="session.authenticated" default="false">
</cffunction>


<!--- REQUEST START --->
<cffunction name="OnRequestStart">
	<cfif (not isDefined("session.objUser")) and cgi.SCRIPT_NAME neq "/secure/login.cfm" and cgi.SCRIPT_NAME neq "/secure/passrecover.cfm" and cgi.SCRIPT_NAME neq "/secure/code/proc/processlogin.cfm" and cgi.SCRIPT_NAME neq "/secure/code/proc/processpassrecover.cfm">
    	<cflocation url="/secure/login.cfm" addtoken="no">

	<cfelseif 	isDefined("session.objUser") AND 
				session.objuser.getresetpassword() EQ 1 AND
				cgi.SCRIPT_NAME neq "/secure/login.cfm" AND
				cgi.SCRIPT_NAME neq "/secure/changepassword.cfm" AND
				cgi.SCRIPT_NAME neq "/secure/code/proc/processchangepassword.cfm">
		<cflocation url="/secure/changepassword.cfm" addtoken="no" />
    </cfif>
</cffunction>


<!--- REQUEST END --->
<cffunction name="OnRequestEnd">
</cffunction>


<!--- ON ERROR --->
<!---
<cffunction name="OnError" access="public" returntype="void" output="true" hint="Fires when an exception occures that is not caught by a try/catch block">
	<cfif NOT isDefined("session.objUser") OR session.objUser.getCanLogin() NEQ 1>
    	The session has time out.  Please log back into the site <a href="login.cfm">NSTTAC</a>.
    </cfif>
</cffunction>
--->


</cfcomponent>