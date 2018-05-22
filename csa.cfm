<cfset objAdmin = CreateObject("component","hgf.secure.code.obj.admin")>
<cfset aboutContent = objAdmin.getLatestWebContent("csa")>
<cfset sharetext = objAdmin.getLatestWebContent("thisweeksshare")>
<cfset apples = objAdmin.getApplesByList("thisweeksshare")>
<!---<cfset bagpadding = 40 + (apples.recordcount * 50)>--->
<cfset section="csa">
<cfinclude template="/includes/header.cfm">
<cfif apples.recordcount gt 0>
<div class="well">
	<div class="row">
        <div class="col-md-4">
            <h2>Whats in my bag?</h2>
            <cfoutput>#sharetext.webcontent#</cfoutput>
        </div>
        <!---style="padding:<cfoutput>#bagpadding#</cfoutput>px 40px 20px 40px; "--->
        <div class="col-md-8"  >
            <div style="height:50px;border-top: 20px solid #81623e; border-left: 20px solid #81623e; border-right: 20px solid #81623e; border-top-right-radius:40px;border-top-left-radius:40px;">
            </div>
            <div class style="border:4px solid #81623e; background-color:#ba9b6f;">
            <cfloop query="apples">
				<cfoutput>
                    <div class="row"   style="background-color:##e8ded0;margin:20px;border-radius:10px;">
                        <div class="col-sm-3">
                            <img src="/images/apples/medium/#photo#" style="width:100%;margin:10px;" alt="#variety# apple">
                        </div>
                        <div class="col-sm-9">
                            <h2 style="padding-top:5px;margin-top:0px;">#variety#</h2>
                            <p>#description#</p>
                        </div>
                    </div>
                </cfoutput>
            </cfloop>
			</div>
        </div>
    </div>
</div>
</cfif>
<cfoutput>#aboutContent.webcontent#</cfoutput>

<cfinclude template="/includes/footer.cfm">