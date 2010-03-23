<cfcomponent output="false">

	<!--- Application settings --->
	<cfset this.name = "GMUKBackoffice" />
	<cfset this.version = '' />
	
	<!--- Web Root Mapping --->
	<cfset this.mappings['/'] = getDirectoryFromPath(getCurrentTemplatePath()) />
	
	<!--- Mapppings for classes --->
	<cfset this.mappings['/com'] = getDirectoryFromPath(getCurrentTemplatePath()) & 'model/com' />


	<!--- PUBLIC --->
	
	<cffunction name="onApplicationStart" 
		hint="Only runs when the App is started"
		access="public"
		output="false"
		returnType="void" 
	>
		<cfset application.init = true />
	
		<!--- Place ResourceManager in application scope --->
		<cfset application.resourceManager = createObject('component', 'com.bealearts.util.ResourceManager').init('/locale', 'en') />

	</cffunction>




	<cffunction name="onRequestStart" 
		returnType="void" 
		output="true"
		hint="Run at the start of a page request."
	>
		<cfargument name="targetPage" type="string" required="true" />
		
		<!--- Default to UTF-8 --->
		<cfset setEncoding('url', 'utf-8') />
		<cfset setEncoding('form', 'utf-8') />		
		
		<!--- Make sure application is init --->	
		<cfif not isDefined('application.init') or isDefined('url.reinit') >
			<cfset onApplicationStart() />
		</cfif>	
		

		<!--- Detect and Set Locale --->
		<cfparam name="url.locale" type="string" default="en_GB">
		<cfset application.resourceManager.setLocaleCode(url.locale) />
			
	</cffunction>
	

	
	<!--- PRIVATE --->

</cfcomponent>