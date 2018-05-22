<cfquery name="getversion" datasource="hemlockgrove">
	select max(version) as version from webcontent where section = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.section#">
</cfquery>

<cfif getversion.version neq ''>
	<cfset newversion = getversion.version + 1>
<cfelse>
	<cfset newversion = 1>
</cfif>

<cfquery name="insertContent" datasource="hemlockgrove">
	insert into webcontent
        (webcontent,
        version,
        section)
    values
    	(<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.content#">,
        #newversion#,
        <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.section#">) 
</cfquery>

<cfquery name="empty" datasource="hemlockgrove">
	delete from apple_inshare where 1=1
</cfquery>
<cfloop list="#form.shareapples#" index="appleid">
	<cfquery name="insert" datasource="hemlockgrove">
    	insert into apple_inshare (apple_id) values (<cfqueryparam cfsqltype="cf_sql_integer" value="#appleid#">)
    </cfquery>
</cfloop>