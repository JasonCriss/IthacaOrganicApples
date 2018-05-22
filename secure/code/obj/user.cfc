<cfcomponent name="User" output="no">

	<!--- private variables --->
	<cfset variables.userId = 0 />
    <cfset variables.firstname = "" />
    <cfset variables.lastname = "" />
    <cfset variables.email = "" />
	<cfset variables.login = "" />
    <cfset variables.resetpassword = 0 />
	<cfset variables.roleids = "" />
	
	<!--- Getters & Setters --->
	<cffunction name="setUserId" output="no" access="public">
	    <cfargument name="userId" type="numeric" required="yes" />
        <cfset variables.userId = arguments.userId />
    </cffunction>

    <cffunction name="getUserId" output="no" access="public" returntype="numeric">
		<cfreturn variables.userId />
    </cffunction>
    
    <cffunction name="setfirstname" output="no" access="public">
	   	<cfargument name="firstname" type="string" required="yes" />
		<cfset variables.firstname = arguments.firstname />
	</cffunction>
    
    <cffunction name="getfirstname" output="no" access="public" returntype="string">
		<cfreturn variables.firstname />
    </cffunction>
    
    <cffunction name="setlastname" output="no" access="public">
	   	<cfargument name="lastname" type="string" required="yes" />
		<cfset variables.lastname = arguments.lastname />
	</cffunction>
    
    <cffunction name="getlastname" output="no" access="public" returntype="string">
		<cfreturn variables.lastname />
    </cffunction>    
    
    <cffunction name="setEmail" output="no" access="public">
    	<cfargument name="Email" type="string" required="yes" />
        <cfset variables.Email = arguments.Email />
    </cffunction>
    
    <cffunction name="getEmail" output="no" access="public" returntype="string">
    	<cfreturn variables.Email />
    </cffunction>
	
	<cffunction name="setlogin" output="no" access="public">
    	<cfargument name="login" type="string" required="yes" />
        <cfset variables.login = arguments.login />
    </cffunction>
    
    <cffunction name="getlogin" output="no" access="public" returntype="string">
    	<cfreturn variables.login />
    </cffunction>
	
    <cffunction name="setroleids" output="no" access="public">
    	<cfargument name="roleids" type="string" required="yes" />
        <cfset variables.roleids = arguments.roleids />
    </cffunction>
    
    <cffunction name="getroleids" output="no" access="public" returntype="any">
    	<cfreturn variables.roleids />
    </cffunction>
    
	<cffunction name="setresetpassword" output="no" access="public">
    	<cfargument name="resetpassword" type="numeric" required="yes" />
        <cfset variables.resetpassword = arguments.resetpassword />
	</cffunction>

    <cffunction name="getresetpassword" output="no" access="public">
    	<cfreturn variables.resetpassword />
	</cffunction>
	
	<!--- Procedural Functions --->
	<cffunction name="hasRole" output="no" access="public" hint="User account has role permission" returntype="boolean">
        <cfargument name="Role" type="string" required="yes" />
        <cfset returnval = false>
        <cfquery name="getRole" datasource="hemlockgrove">
        	select
                *
            from
                user_role
                inner join role on user_role.role_id = role.role_id
            where
                user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.userId#">
                and role = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.role#">
        </cfquery>
        <cfif getRole.recordcount gt 0>
        	<cfset returnval = true>
        </cfif>
        <cfreturn returnval>
    </cffunction>
	
	<!--- Database Functions --->
	<cffunction name="setPassword" output="no" returntype="void">
		<cfargument name="password" required="yes">
		<cfset passwordHash = hash(password)>
		<cfquery name="setPassword" datasource="hemlockgrove">
			update
				[user] 
			set
				password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#passwordHash#"> 
			where
				user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.userid#">
		</cfquery>
	</cffunction>
	
	<cffunction output="yes" access="public" name="load" returntype="boolean">
		<cfargument name="user_id" required="yes">
		
		<cfset success = false>
		<cfquery datasource="hemlockgrove" name="getUser">
			select * from [user] where user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.user_id#">
		</cfquery>
		<cfquery datasource="hemlockgrove" name="getUserRoles">
			select * from user_role where user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.user_id#">
		</cfquery>
		<cfset temproles=ValueList(getUserRoles.role_id)>
		
		
		<cfif getUser.recordcount eq 1>
			<cfset setuserId(getUser.user_id) />
			<cfset setfirstname(getUser.firstname) />
			<cfset setlastname(getUser.lastname) />
			<cfset setemail(getUser.email) />
			<cfset setlogin(getUser.login) />
			<cfset setresetpassword(getUser.resetpassword) />
			<cfset setroleids(temproles) />
			<cfset success = true>
		</cfif>
		
		<cfreturn success>
	</cffunction>
	
	<cffunction name="save" output="no" returntype="void">
		<cfquery name="save" datasource="hemlockgrove">
			update
				[user]
			set
				firstname = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.firstname#">,
				lastname = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.lastname#">,
				email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.email#">,
				login = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.login#">,
				resetpassword = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.resetpassword#">
			where
				user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.userid#">
		</cfquery>
		
		<cfquery name="getAllRoles" datasource="hemlockgrove">
			select role_id from role
		</cfquery>
		
		<cfloop query="getAllRoles">
			<cfif listfind(variables.roleids,role_id)>
				<cfquery name="checkRole" datasource="hemlockgrove">
					select
						*
					from
						user_role
					where
						user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.userid#">
						and role_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#role_id#">
				</cfquery>
				<cfif checkrole.recordcount eq 0>
					<cfquery datasource="hemlockgrove">
						insert into user_role
							(user_id,
							role_id)
						values
							(<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.userid#">,
							<cfqueryparam cfsqltype="cf_sql_integer" value="#role_id#">)
					</cfquery>
				</cfif>
			<cfelse>
				<cfquery name="deleteRole" datasource="hemlockgrove">
					delete from
						user_role
					where
						user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.userid#">
						and role_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#role_id#">
				</cfquery>
			</cfif>
		</cfloop>

	</cffunction>
		
	<cffunction name="create" output="no" returntype="any">
		<cfargument name="firstname" required="no" default="">
		<cfargument name="lastname" required="no" default="">
		<cfargument name="email" required="yes" default="">
		<cfargument name="login" required="no" default="">
		<cfargument name="resetpassword" required="no" default="">
		<cfargument name="roleids" required="no" default="">
		
		<cfquery name="createnewuser" datasource="hemlockgrove" result="newuser">
			insert into [user] (firstname) values ('')
		</cfquery>
		
		<cfset setuserid(newuser.IDENTITYCOL)>
		<cfset setfirstname(arguments.firstname)>
		<cfset setlastname(arguments.lastname)>
		<cfset setemail(arguments.email)>
		<cfset setlogin(arguments.login)>
		<cfset setresetpassword(arguments.resetpassword)>
		<cfset setroleids(arguments.roleids)>
		
		<cfset save()>
	</cffunction>	
		
	
</cfcomponent>