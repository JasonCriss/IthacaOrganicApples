<cfquery name="empty" datasource="hemlockgrove">
	delete from apple_available where 1=1
</cfquery>
<cfloop list="#form.availableapples#" index="appleid">
	<cfquery name="insert" datasource="hemlockgrove">
    	insert into apple_available (apple_id) values (<cfqueryparam cfsqltype="cf_sql_integer" value="#appleid#">)
    </cfquery>
</cfloop>