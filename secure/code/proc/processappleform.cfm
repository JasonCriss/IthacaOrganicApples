<cfparam name="appleid" default="">
<cfparam name="photofilename" default="">

<cfif appleid eq "">
	<cfif not session.objUser.hasRole("can access apples")>
		<cflocation url="/secure/index.cfm">
	</cfif>
<cfelse>
	<cfif not session.objUser.hasRole("can access apples")>
		<cflocation url="/secure/index.cfm">
	</cfif>
</cfif>

<cfif structKeyExists(form, "uploadfile") and form.uploadfile neq "">
	<cfset destination = expandPath("../../../images/apples/full")>
    <cfif not directoryExists(destination)>
    <cfdirectory action="create" directory="#destination#">
    </cfif>
    <cfset destinationlarge = expandPath("../../../images/apples/large")>
    <cfif not directoryExists(destinationlarge)>
    <cfdirectory action="create" directory="#destinationlarge#">
    </cfif>
    <cfset destinationmedium = expandPath("../../../images/apples/medium")>
    <cfif not directoryExists(destinationmedium)>
    <cfdirectory action="create" directory="#destinationmedium#">
    </cfif>
    <cfset destinationsmall = expandPath("../../../images/apples/small")>
    <cfif not directoryExists(destinationsmall)>
    <cfdirectory action="create" directory="#destinationsmall#">
    </cfif>
    <cfset destinationthumb = expandPath("../../../images/apples/thumb")>
    <cfif not directoryExists(destinationthumb)>
    <cfdirectory action="create" directory="#destinationthumb#">
    </cfif>
    <cffile action="upload" filefield="uploadfile" destination="#destination#" nameConflict="makeUnique" result="upload">
    
    <cfset photofullpath = "#upload.serverdirectory#\#upload.serverfile#">
    <cfset photofilename = upload.serverfile>
    <cfimage
        action = "info"
        source = "#photofullpath#"
        structname = "photoinfo">
    <cfdump var="#photoinfo#">
    
    <cfif photoinfo.height gte photoinfo.width>
    	<cfimage
            action = "resize"
            height = "100"
            width = ""
            source = "#photofullpath#" 
            destination = "#destinationthumb#\#photofilename#">
        <cfimage
            action = "resize"
            height = "200"
            width = ""
            source = "#photofullpath#" 
            destination = "#destinationsmall#\#photofilename#">
        <cfimage
            action = "resize"
            height = "600"
            width = ""
            source = "#photofullpath#" 
            destination = "#destinationmedium#\#photofilename#">
        <cfimage
            action = "resize"
            height = "900"
            width = ""
            source = "#photofullpath#" 
            destination = "#destinationlarge#\#photofilename#">
    <cfelse>
    	<cfimage
            action = "resize"
            height = ""
            width = "100"
            source = "#photofullpath#" 
            destination = "#destinationthumb#\#photofilename#">
        <cfimage
            action = "resize"
            height = ""
            width = "200"
            source = "#photofullpath#" 
            destination = "#destinationsmall#\#photofilename#">
        <cfimage
            action = "resize"
            height = ""
            width = "600"
            source = "#photofullpath#" 
            destination = "#destinationmedium#\#photofilename#">
        <cfimage
            action = "resize"
            height = ""
            width = "900"
            source = "#photofullpath#" 
            destination = "#destinationlarge#\#photofilename#">
    </cfif>    

</cfif>

<cfdump var="#form#">

<cfif appleid eq "">
	<cfset objNewApple = CreateObject("component","hgf.code.obj.apple")>
	<cfset objNewApple.create(
		variety = form.variety ,
		description = form.description ,
		ripeningmonth = form.month ,
		ripeningtimeofmonth = form.timeofmonth ,
		photo = photofilename)>
<cfelse>
	<cfset objEditApple = CreateObject("component","hgf.code.obj.apple")>
	<cfset loadInfo = objEditApple.load(appleid)>
	<cfif loadInfo>
		<cfset objEditApple.setvariety(form.variety)>
		<cfset objEditApple.setdescription(form.description)>
		<cfset objEditApple.setripeningmonth(form.month)>
		<cfset objEditApple.setripeningtimeofmonth(form.timeofmonth)>
		<cfif photofilename neq "">
		<cfset objEditApple.setphotofilename(photofilename)>
		</cfif>
		<cfset objEditApple.save()>
	</cfif>
</cfif>

<cflocation url="/secure/apples.cfm">
