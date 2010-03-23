<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="<cfoutput>#application.resourceManager.getLocaleCode()#</cfoutput>" dir="<cfoutput>#application.resourceManager.getLocaleDirection()#</cfoutput>">
	<head>
		<title><cfoutput>#application.resourceManager.getString('HomePage', 'PAGE_HEADING')#</cfoutput></title>
	</head>
	
	<body>
		<h1><cfoutput>#application.resourceManager.getString('HomePage', 'PAGE_HEADING')#</cfoutput></h1>
		
		<p><cfoutput>#application.resourceManager.getString('HomePage', 'FAVORITE_COLOR_LABEL')#</cfoutput></p>
		
		<cfset variables.params = arrayNew(1) /> 
		<cfset arrayAppend(variables.params, lsDateFormat(now())) />
		<p><cfoutput>#application.resourceManager.getString('HomePage', 'CURRENT_DATE_LABEL', variables.params )#</cfoutput></p>
		
		<p>
			<cfloop index="variables.locale" array="#application.resourceManager.getLocaleChain()#">
				<cfif application.resourceManager.getLocaleCode() eq variables.locale >
					<cfoutput><strong title="#getLocaleDisplayName(variables.locale)#">#variables.locale#</strong></cfoutput>
				<cfelse>	
					<cfoutput><a href="?locale=#variables.locale#" title="#getLocaleDisplayName(variables.locale)#">#variables.locale#</a></cfoutput>
				</cfif>
			</cfloop>
		</p>
	</body>
</html>