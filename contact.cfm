<cfset errormsg = "">
<cfif isdefined("form.send")>
	<cfset continue = true>
	
	<cfif form.name eq ''>
    	<cfset continue = false>
        <cfset errormsg = errormsg & "You must enter your name<br>">
    </cfif>
    <cfif form.email eq ''>
    	<cfset continue = false>
        <cfset errormsg = errormsg & "You must enter your email<br>">
    <cfelseif not isvalid("email",form.email)>
    	<cfset continue = false>
        <cfset errormsg = errormsg & "You must enter a valid email<br>">
    </cfif>
    <cfif form.subject eq ''>
    	<cfset continue = false>
        <cfset errormsg = errormsg & "You must enter a subject<br>">
    </cfif>
    <cfif form.hp eq '' and continue eq true>
    	<cfoutput>
    	<cfmail from="#form.email#" to="hemlockgrovefarm@gmail.com" subject="#form.subject#">
    		#message#
            From: #form.name#
        </cfmail>
        </cfoutput>
    </cfif>
</cfif>
<cfset section="contact">
<cfinclude template="/includes/header.cfm">
<cfoutput>
<h1>Contact Us</h1>
<p>You can contact us by email at <a href="mailto:hemlockgrove@gmail.com">hemlockgrovefarm@gmail.com</a>, or use the form below.</p>
<cfif errormsg neq "">
	<div class="alert alert-danger">
    <h3>Please fix the following errors</h3>
    <p>#errormsg#</p>
    </div>
</cfif>
<cfif isdefined("continue") and continue eq true>
	<div class="alert alert-success">
    	<h3>Your message has been sent</h3>
    </div>
</cfif>
<form action="contact.cfm" method="post">
	<div class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" <cfif isdefined("form.name")>value="#form.name#"</cfif> required>
    </div>
    <div class="form-group">
        <label for="email">Email address</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" <cfif isdefined("form.email")>value="#form.email#"</cfif> required>
    </div>
    <div class="form-group">
        <label for="subject">Subject</label>
        <input type="text" class="form-control" id="subject" name="subject" placeholder="Enter subject" <cfif isdefined("form.subject")>value="#form.subject#"</cfif> required>
    </div>
    <div class="form-group">
        <label for="message">Message</label>
        <textarea class="form-control" rows="7" id="message" name="message"><cfif isdefined("form.message")>#form.message#</cfif></textarea>
    </div>
    <div style="display:none;visibility:hidden">
    	<label for="hp">Leave this empty</label>
        <input type="text" class="form-control" id="hp" name="hp" placeholder="Enter nothing!">
    </div>
    <button type="submit" class="btn btn-primary btn-lg" name="send"><span class="glyphicon glyphicon-envelope"></span> Send Message</button>
</form>
</cfoutput>
<br>
<cfinclude template="/includes/footer.cfm">