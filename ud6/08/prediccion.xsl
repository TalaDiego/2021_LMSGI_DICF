<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : prediccion.xsl
    Created on : 13 de mayo de 2021, 9:25
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Diego Castaño Freile.xsl</title>
            </head>
            <body>
                <h1>Prediccion de municipios</h1>
                <table>
                    <caption>
                        <xsl:value-of select="concat('EL TIEMPO. ',//municipio/nombre,'(',//municipio/provincia,')')"></xsl:value-of>
                    </caption>
                    <tr>
                        <td>Dia</td>
                        <td>Prob. Precip.</td>
                        <td>Estado del cielo</td>
                        <td>Temperatura (ºC)</td>
                        <td>Viento(km/h)</td>
                    </tr>
                    <xsl:apply-templates select="//dia"/>
                    
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="dia">
        <tr>
            <td>
                <xsl:value-of select="substring(@fecha,9,2)"/>
            </td>
            <td>
                <xsl:value-of select="concat(prob_precipitacion,'%')"/>
            </td>
            <td>
                <img>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('images/',estado_cielo,'.gif')"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="estado_cielo/@descripcion"/>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="estado_cielo/@descripcion"/>
                    </xsl:attribute>
                </img>
            </td>
            <td>
                <span class="minimo">
                    <xsl:value-of select="temperatura/minima"/>
                </span>
                /
                <span class="maximo">
                    <xsl:value-of select="temperatura/maxima"/>
                </span>
            </td>
            <td>
                <img>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('images/',viento/direccion,'.gif')"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="viento/direccion"/>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="viento/direccion"/>
                    </xsl:attribute>
                </img>
                <xsl:value-of select="viento/velocidad"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
