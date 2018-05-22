<cfset objAdmin = CreateObject("component","hgf.secure.code.obj.admin")>
<cfset aboutContent = objAdmin.getLatestWebContent("csasales")>
<cfset section="csasales">
<cfinclude template="/includes/header.cfm">

<cfoutput>#aboutContent.webcontent#</cfoutput>

<cfinclude template="/includes/footer.cfm">