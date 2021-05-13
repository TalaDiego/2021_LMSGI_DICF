<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>

    <xsl:template match="/factura">
        
        <xsl:copy>
            <xsl:apply-templates select='@n_factura'/>
            <xsl:apply-templates select='datos_emisor'/>
            <xsl:apply-templates select='datos_receptor'/>
            <xsl:apply-templates select='datos_factura'/>
        </xsl:copy>
        
    </xsl:template>
    
    <xsl:template match='datos_emisor'>
        <xsl:element name='{name()}'>
            <xsl:element name='nombre'>
                <xsl:value-of select='nombre'/>
            </xsl:element>
            <xsl:element name="dir">
                <xsl:value-of select='dir'/>
            </xsl:element>
            <xsl:element name='poblacion'>
                <xsl:value-of select='poblacion'/>
            </xsl:element>
            <xsl:element name="cod_postal">
                <xsl:value-of select='poblacion/@cod_postal'/>
            </xsl:element>
            <xsl:element name="provincia">
                <xsl:value-of select='provincia'/>
            </xsl:element>
            <xsl:element name="cif">
                <xsl:value-of select='cif'/>
            </xsl:element>
            <xsl:element name="telefono">
                <xsl:value-of select='telefono/@num_tel'/>
            </xsl:element>
            <xsl:element name="fax">
                <xsl:value-of select='fax/@num_fax'/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="datos_receptor">
        <xsl:element name="{name()}">
            <xsl:element name="n_cli">
                <xsl:value-of select='@n_cli'/>
            </xsl:element>
            <xsl:element name="nombre">
                <xsl:value-of select='nombre'/>
            </xsl:element>
            <xsl:element name="dir_env">
                <xsl:value-of select='dir_env'/>
            </xsl:element>
            <xsl:element name="poblacion">
                <xsl:value-of select='poblacion'/>
            </xsl:element>
            <xsl:element name="cod_postal">
                <xsl:value-of select='poblacion/@cod_postal'/>
            </xsl:element>
            <xsl:element name="provincia">
                <xsl:value-of select='provincia'/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match='datos_factura'>
        <xsl:element name="{name()}">
            <xsl:element name='n_ped'>
                <xsl:value-of select="@n_ped"/>
            </xsl:element>
            <xsl:element name='iva'>
                <xsl:value-of select="@iva"/>
            </xsl:element>
            <xsl:element name='f_pago'>
                <xsl:value-of select="@f_pago"/>
            </xsl:element>
            <xsl:element name='moneda'>
                <xsl:value-of select="@moneda"/>
            </xsl:element>
            <xsl:element name='fecha'>
                <xsl:value-of select="fecha"/>
            </xsl:element>
            <xsl:for-each select="linea">
                <xsl:element name="linea">
                    <xsl:element name="ref">
                        <xsl:value-of select='ref'/>
                    </xsl:element>
                    <xsl:element name="desc">
                        <xsl:value-of select='desc'/>
                    </xsl:element>
                    <xsl:element name="cant">
                        <xsl:value-of select='cant'/>
                    </xsl:element>
                    <xsl:element name="precio">
                        <xsl:value-of select='precio'/>
                    </xsl:element>
                    <xsl:element name="importe">
                        <xsl:value-of select="importe"/>
                        <!--<xsl:value-of select='((((//linea/precio)*(//linea/cant))*(//@iva))*0.01)+(//linea/precio)'/>-->
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
            <xsl:element name='base'>
                <xsl:value-of select='base'/>
            </xsl:element>
            <xsl:element name='cuota_iva'>
                <xsl:value-of select="cuota_iva"/>
                <!--<xsl:value-of select='((//base)*(16))*0.01'/>-->
            </xsl:element>
            <xsl:element name='total'>
                <xsl:value-of select="total"/>
                <!--<xsl:value-of select='sum(//importe)'/>-->
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>