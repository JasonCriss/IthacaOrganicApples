<cfcomponent name="admin" output="no">
	<cffunction name="getAllUsers" output="no" returntype="any">
		<cfargument name="orderby" default="lastname">
		<cfquery name="allUsers" datasource="hemlockgrove">
			select * from [user] order by #orderby#
		</cfquery>
		<cfreturn allUsers> 
	</cffunction>
    <cffunction name="getAllApples" output="no" returntype="any">
		<cfargument name="orderby" default="variety">
		<cfquery name="allApples" datasource="hemlockgrove">
			select * from apple order by #orderby#
		</cfquery>
		<cfreturn allApples> 
	</cffunction>
    <cffunction name="getApplesByList" returntype="any">
    	<cfargument name="list" required="yes">
        <cfswitch expression="#list#">
        	<cfcase value="thisweeksshare">
            	<cfset ids = getThisWeeksAppleIDs()>
            </cfcase>
            <cfcase value="availableapples">
            	<cfset ids = getAvailableAppleIDs()>
            </cfcase>
        </cfswitch>
		<cfif ids eq ''>
        	<cfset ids = 0>
        </cfif>
        <cfquery name="getApples" datasource="hemlockgrove">
        	select * from apple where apple_id in (#ids#)
        </cfquery>
        <cfreturn getApples>
    </cffunction>
	<cffunction name="getRoles" output="no" returntype="any">
		<cfquery name="allRoles" datasource="hemlockgrove">
			select * from role order by priority
		</cfquery>
		<cfreturn allRoles> 
	</cffunction>
	<cffunction name="getUserIDFromEmail" output="no" returntype="numeric">
		<cfargument name="email" required="yes">
		<cfquery name="getUserID" datasource="hemlockgrove">
			select user_id from [user] where email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#email#">
		</cfquery>
		<cfreturn getUserID.user_id>
	</cffunction>
    <cffunction name="getLatestWebContent" returntype="any">
    	<cfargument name="section" default="">
        <cfquery name="getContent" datasource="hemlockgrove">
    		select Top (1) * from webcontent where section = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.section#"> order by version desc
        </cfquery>
        <cfreturn getContent>
    </cffunction>
    <cffunction name="getThisWeeksAppleIDs" returntype="any">
    	<cfquery name="getAppleIDS" datasource="hemlockgrove">
        	select * from apple_inshare
        </cfquery>
        <cfreturn valuelist(getAppleIDs.apple_id)>
    </cffunction>
    <cffunction name="getAvailableAppleIDs" returntype="any">
    	<cfquery name="getAppleIDS" datasource="hemlockgrove">
        	select * from apple_available
        </cfquery>
        <cfreturn valuelist(getAppleIDs.apple_id)>
    </cffunction>
</cfcomponent>