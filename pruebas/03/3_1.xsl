<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/horario">
        <html>
            <head>
                <title>XSLT 03 Ricardo Santiago Tomé</title>
                <style type="text/css">
                    body{text-align:center;}
                    td,th{ border : 1px solid black;}
                    table{ border-collapse: collapse;}
                    
                </style>
            </head>
            <body>
                <h2>HORARIOS DEL CURSO <xsl:value-of select='@curso'/></h2>
                <h3>GRUPO <xsl:value-of select='grupo/@idgrupo'/></h3>
                <h4>Tutor: <xsl:value-of select='//profesor[@codP=//grupo/@codT]/text()'/></h4>
                <table style="margin: 0 auto;text-allign: center;">
                    <tr>
                        <th>Horario</th>
                        <th>
                            <xsl:value-of select='//hora[1]/dia_sem[1]/@dia'/>
                        </th>
                        <th>
                            <xsl:value-of select='//hora[1]/dia_sem[2]/@dia'/>
                        </th>
                        <th>
                            <xsl:value-of select='//hora[1]/dia_sem[3]/@dia'/>
                        </th>
                        <th>
                            <xsl:value-of select='//hora[1]/dia_sem[4]/@dia'/>
                        </th>
                        <th>
                            <xsl:value-of select='//hora[1]/dia_sem[last()]/@dia'/>
                        </th>                      
                    </tr>
                    <tr>
                        <xsl:apply-templates select='grupo/hora'/>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match='grupo/hora'>
        <tr>
            <td>
                <xsl:value-of select='@entrada'/>-<xsl:value-of select='@salida'/>
                <xsl:apply-templates select="dia_sem"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match='dia_sem'>
        <td>
            <xsl:attribute name="rowspan">
                <xsl:value-of select='@num'/>
            </xsl:attribute>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:value-of select='//modulos/modulo[@codM=current()]/text()'/>
                </xsl:attribute>
                <xsl:value-of select='current()'/>
            </abbr>
            <br/>
            <xsl:variable name='listaProfesores' select='//asignatura[@codM=current()]/text()'/>
            <xsl:value-of select='//asignatura[@codM=current()]/@codP'/>
        </td>
    </xsl:template>
    <xsl:template match='profesor' mode='xxx'>
        <xsl:if test='position()!=1'>
            <xsl:text>,</xsl:text>
            <xsl:value-of select='text()'/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>