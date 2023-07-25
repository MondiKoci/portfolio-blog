<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:javascript src="color-modes.js"/>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="colorModes.css"/>

    <g:layoutHead/>
</head>

<body>
<g:render template='/includes/topNav'/>
<g:render template="/includes/themeSelection"/>

<main class="container mt-2 h-100">
    <asset:javascript src="application.js"/>
    <g:layoutBody/>
</main>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>



</body>
</html>
