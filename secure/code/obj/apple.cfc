<cfcomponent name="User" output="no">
	<cfset variables.appleID = 0 />
    <cfset variables.variety = "" />
    <cfset variables.description = "" />
    <cfset variables.ripeningmonth = "" />
    <cfset variables.ripeningtimeofmonth = "" />
	<cfset variables.photofilename = "" />
    
    <cffunction name="getappleid" output="no" returntype="any" access="public">
    	<cfreturn variables.appleid>
    </cffunction>
    <cffunction name="setappleid" output="no" returntype="any" access="public">
    	<cfargument name="input" type="any">
        <cfset variables.appleId = arguments.input>
    </cffunction>
    
    <cffunction name="getvariety" output="no" returntype="any" access="public">
    	<cfreturn variables.variety>
    </cffunction>
    <cffunction name="setvariety" output="no" returntype="any" access="public">
    	<cfargument name="input" type="any">
        <cfset variables.variety = arguments.input>
    </cffunction>
    
    <cffunction name="getdescription" output="no" returntype="any" access="public">
    	<cfreturn variables.description>
    </cffunction>
    <cffunction name="setdescription" output="no" returntype="any" access="public">
    	<cfargument name="input" type="any">
        <cfset variables.description = arguments.input>
    </cffunction>
    
    <cffunction name="getripeningmonth" output="no" returntype="any" access="public">
    	<cfreturn variables.ripeningmonth>
    </cffunction>
    <cffunction name="setripeningmonth" output="no" returntype="any" access="public">
    	<cfargument name="input" type="any">
        <cfset variables.ripeningmonth = arguments.input>
    </cffunction>
    
    <cffunction name="getripeningtimeofmonth" output="no" returntype="any" access="public">
    	<cfreturn variables.ripeningtimeofmonth>
    </cffunction>
    <cffunction name="setripeningtimeofmonth" output="no" returntype="any" access="public">
    	<cfargument name="input" type="any">
        <cfset variables.ripeningtimeofmonth = arguments.input>
    </cffunction>
    
    <cffunction name="getphotofilename" output="no" returntype="any" access="public">
    	<cfreturn variables.photofilename>
    </cffunction>
    <cffunction name="setphotofilename" output="no" returntype="any" access="public">
    	<cfargument name="input" type="any">
        <cfset variables.photofilename = arguments.input>
    </cffunction>
    
    
    <cffunction output="yes" access="public" name="load" returntype="boolean">
		<cfargument name="apple_id" required="yes">
		
		<cfset success = false>
		<cfquery datasource="hemlockgrove" name="getApple">
			select * from apple where apple_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.apple_id#">
		</cfquery>
		
		<cfif getApple.recordcount eq 1>
			<cfset setappleid(getApple.apple_id) />
			<cfset setvariety(getApple.variety) />
			<cfset setdescription(getApple.description) />
			<cfset setripeningmonth(getApple.ripeningmonth) />
            <cfset setripeningtimeofmonth(getApple.ripeningtimeofmonth) />
			<cfset setphotofilename(getApple.photo) />
            <cfset success = true>
		</cfif>
		
		<cfreturn success>
	</cffunction>
	
	<cffunction name="save" output="no" returntype="void">
		<cfquery name="save" datasource="hemlockgrove">
			update
				apple
			set
				variety = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.variety#">,
				description = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.description#">,
				ripeningmonth = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.ripeningmonth#">,
                ripeningtimeofmonth = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.ripeningtimeofmonth#">,
				photo = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.photofilename#">
			where
				apple_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.appleid#">
		</cfquery>
		
	</cffunction>
    
    <cffunction name="create" output="no" returntype="any">
		<cfargument name="variety" required="no" default="">
		<cfargument name="description" required="no" default="">
		<cfargument name="ripeningmonth" required="yes" default="">
        <cfargument name="ripeningtimeofmonth" required="yes" default="">
		<cfargument name="photo" required="no" default="">
		
		<cfquery name="createnewapple" datasource="hemlockgrove" result="newapple">
			insert into apple (variety) values ('')
		</cfquery>
		
		<cfset setappleid(newapple.IDENTITYCOL) />
		<cfset setvariety(arguments.variety) />
        <cfset setdescription(arguments.description) />
        <cfset setripeningmonth(arguments.ripeningmonth) />
        <cfset setripeningtimeofmonth(arguments.ripeningtimeofmonth) />
        <cfset setphotofilename(arguments.photo) />
		
		<cfset save()>
	</cffunction>
    
</cfcomponent>