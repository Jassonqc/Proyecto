<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
 
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
        <title><tiles:getAsString name="title" /></title>        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,medium,light&lang=en">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="webjars/material-design-lite/1.3.0/material.min.css">
        <link rel="stylesheet" href="resources/estilo/dashboard.css"/>        
    </head>

    <body>
        <div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">                   
            <tiles:insertAttribute name="header" />  
            <tiles:insertAttribute name="menu" />            
            <main class="mdl-layout__content mdl-color--grey-100">
                <div class="mdl-grid demo-content">
                    <tiles:insertAttribute name="body" />           
                </div>
            </main>
        </div>
        <script src="webjars/material-design-lite/1.3.0/material.min.js"></script>        
    </body>
</html>