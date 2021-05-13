<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/horario">
        <html>
            <head>
                <title>XSLT 03 Diego Castaño Freile</title>
            </head>
            <body>
                <h1>HORARIOS DEL CURSO <xsl:value-of select="@curso"/></h1>
                <table>
                    <tr>
                        <th>Codigo del modulo</th>
                        <th>Nombre del modulo</th>
                    </tr>
                    <xsl:apply-templates select="modulos/modulo"/>
                </table>
                <table>
                    <tr>
                        <th>Codigo del profesor</th>
                        <th>Nombre del profesor</th>
                    </tr>
                    <xsl:apply-templates select="profesores/profesor"/>
                </table>
                <table>
                    <tr>
                        <th>Codigo del modulo</th>
                        <th>Codigo del profesor</th>
                    </tr>
                    <xsl:apply-templates select="imparte/asignatura"/>
                </table>
                <table>
                    <tr>
                        <th>dia</th>
                        <th>numero</th>
                        <th>modulos</th>
                    </tr>
                    <xsl:apply-templates select="grupo/hora/dia_sem"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <!-- Mostrar los modulos -->
    <xsl:template match="modulos/modulo">
        <tr>
            <td>
                <abbr>
                    <xsl:attribute name="title">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                    <xsl:value-of select="@codM"/>
                </abbr>
            </td>
            <td>
                <xsl:value-of select="."/>
            </td>
        </tr>
    </xsl:template>
    <!-- Mostrar los profesores -->
    <xsl:template match="profesores/profesor">
        <tr>
            <td>
                <abbr>
                    <xsl:attribute name="title">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                    <xsl:value-of select="@codP"/>
                </abbr>
            </td>
            <td>
                <xsl:value-of select="."/>
            </td>
        </tr>
    </xsl:template>
    <!-- Mostrar las asignaturas -->
    <xsl:template match="imparte/asignatura">
        <tr>
            <td>
                <xsl:value-of select="@codM"/>
            </td>
            <td>
                <xsl:value-of select="@codProfesor"/>
            </td>
        </tr>
    </xsl:template>
    <!-- Mostrar los dia_sem -->
    <xsl:template match="grupo/hora/dia_sem">
        <tr>
            <td>
                <xsl:value-of select="@dia"/>
            </td>
            <td>
                <xsl:value-of select="@num"/>
            </td>
            <td>
                <xsl:value-of select="."/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
