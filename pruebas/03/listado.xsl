<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="curso" select="'DAW1'"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Profesores listado / Asignaturas</title>
            </head>
            <body>
                <h1>curso <xsl:value-of select="$curso"/></h1>
                <table>
                    <tr>
                        <td>Módulo</td>
                        <td>Profesor/es</td>
                    </tr>
                    <xsl:apply-templates select="horario/imparte/asignatura"/>
                </table>
                <xsl:value-of select="count(document('modulos.xml')/modulos/modulo)"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="asignatura">
        <tr>
            <td>
                <xsl:value-of select="document('modulos.xml')//modulo[@codM=current()/@codM]"/>
            </td>
            <td>
                <xsl:apply-templates select="document('profesores.xml')//profesor[contains(current()/@codProfesor,@codP)]"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
