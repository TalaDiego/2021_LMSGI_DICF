<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : libWeb.xsl
    Created on : 11 de mayo de 2021, 8:09
    Author     : amor
    Description:
       Plantillas comunes a todas las páginas web
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <!--  Escribir las tag META de la web y el favicon    -->
    <xsl:template name="metaWeb">
        <xsl:param name="titulo"/>
        <xsl:param name="keywords"/>
        <xsl:param name="description"/> 
       
        <!--Etiquetas meta-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>       
        <meta name="author" content="Amor Rodríguez"/>
        <meta name="application-name" content="AppWeb de LMSGI"/>
        <meta name="description">
            <xsl:attribute name="content">
                <xsl:value-of select="$description"/>
            </xsl:attribute>
        </meta>
        <meta name="keywords">
            <xsl:attribute name="content">
                <xsl:value-of select="$keywords"/>
            </xsl:attribute>
        </meta>
        <meta name="robots" content="index, follow"/>      
        <link href="css/estilo.css"  rel="stylesheet"       type="text/css" />
        <link rel="icon" href="favicon.ico" type="image/x-icon"/>
        <title>
            <xsl:value-of select="$titulo"/>
        </title>
    </xsl:template>
    <!--  *********************Escribir el DocType -->
    <xsl:template name="DocTipo">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    </xsl:template>
    <!-- Copiar los comentario -->
    <xsl:template match="comment()"> 
        <xsl:text xml:space="preserve">  
        <xsl:comment>
                <xsl:value-of select="."/>
        </xsl:comment>
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>
