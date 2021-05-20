<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 10.xsl
    Created on : 19 de mayo de 2021
    Author     : daw1
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" indent="yes"/>

    <xsl:template match="network">
        <xsl:variable name="newline">
            <xsl:value-of disable-output-escaping="yes" select="'&#10;'"/>
        </xsl:variable>
        <xsl:variable name="newtab">
            <xsl:value-of disable-output-escaping="yes" select="'&#9;'"/>
        </xsl:variable>
        <xsl:value-of select="concat(name(current()), ':')"/>
        <xsl:value-of select="concat($newline, $newtab, name(//ethernets), ':')"/>
        <xsl:value-of select="concat($newline, $newtab, $newtab, //name,  ':')"/>
        <xsl:value-of select="concat($newline, $newtab, $newtab, $newtab, name(//ethernets/addresses),  ':')"/>
        <xsl:value-of select="concat($newline, $newtab, $newtab, $newtab, '- ', //ethernets/addresses)"/>
        <xsl:value-of select="concat($newline, $newtab, $newtab, $newtab, name(//gateway4),  ': ', //gateway4)"/>
        <xsl:value-of select="concat($newline, $newtab, $newtab, $newtab, name(//nameservers),  ':')"/>
        <xsl:value-of select="concat($newline, $newtab, $newtab, $newtab, $newtab, name(//addresses),  ':')"/>
        <xsl:for-each select="//nameservers/addresses">
            <xsl:value-of select="concat($newline, $newtab, $newtab, $newtab, $newtab, $newtab, '- ' ,current())"/>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>