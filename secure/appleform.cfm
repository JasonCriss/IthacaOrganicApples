<cfparam name="appleid" default="">

<cfif appleid eq "">
	<cfif not session.objUser.hasRole("can access apples")>
		<cflocation url="index.cfm">
	</cfif>
	<cfset loadInfo = false>
<cfelse>
	<cfif not session.objUser.hasRole("can access apples")>
		<cflocation url="index.cfm">
	</cfif>
	<cfset objEditApple = CreateObject("component","hgf.code.obj.apple")>
	<cfset loadInfo = objEditApple.load(appleid)>
</cfif>
<cfset objAdmin = CreateObject("component","hgf.code.obj.admin")>
<cfset pageTitle = "Hemlock Grove Farm - Apple Details">
<cfset navlocation = "apples">
<cfinclude template="./includes/header.cfm">
<div class="container">
	<h3>Apple Form</h3>
	<form role="form" method="post" action="/secure/code/proc/processappleform.cfm" enctype="multipart/form-data">
		<cfoutput><input type="hidden" name="appleid" value="#appleid#"></cfoutput>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label for="variety">Variety</label>
					<input type="text" class="form-control" id="variety" placeholder="Enter Variety" name="variety" <cfif loadInfo><cfoutput> value ="#objEditApple.getvariety()#"</cfoutput></cfif>>
				</div>
				<div class="form-group">
					<label for="description">Description</label>
					<textarea name="description" id="description" class="form-control" rows="6"><cfif loadinfo><cfoutput>#objEditApple.getdescription()#</cfoutput></cfif></textarea>
				</div>
				<div class="form-group">
					<label for="month">Ripening Month</label>
                    <select name="month" id="month"  class="form-control">
                        <option value="0"></option>
                        <cfloop from="1" to="12" index="i">
                            <cfoutput>
                            <option value="#i#" <cfif loadinfo and objEditApple.getripeningmonth() eq i>selected="selected"</cfif>>#MonthAsString(i)#</option>
                            </cfoutput>
                        </cfloop>
                    </select>
                </div>
                <div class="form-group">
                    <label for="timeofmonth">Time of Month</label>
                    <select name="timeofmonth" id="timeofmonth" class="form-control">
                    	<option value="0"></option>
                        <option value="1" <cfif loadinfo and objEditApple.getripeningtimeofmonth() eq 1>selected="selected"</cfif>>early</option>
                        <option value="2" <cfif loadinfo and objEditApple.getripeningtimeofmonth() eq 2>selected="selected"</cfif>>mid</option>
                        <option value="3" <cfif loadinfo and objEditApple.getripeningtimeofmonth() eq 3>selected="selected"</cfif>>late</option>
                    </select>
				</div>
                <div class="form-group">
                	<label for="photo">Photo</label>
                    <input type="file" class="form-control" name="uploadfile" id="photo">
                </div>
            </div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<button type="submit" class="btn btn-primary btn-lg col-sm-12" name="login"><span class="glyphicon glyphicon-save"></span> Save Apple</button>
			</div>
		</div>
	</form>
</div>
<cfinclude template="./includes/footer.cfm">