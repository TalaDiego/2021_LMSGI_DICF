<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="/listatickets">
        <!-- Autor .- Nombre y Apellidos -->
        <!-- Fecha .- Jueves 29 de abril de 2021 -->
        <!-- Descripcion .- Listado de tickets -->
        <html lang="es">
            <head>
                <meta charset="utf-8"/>
                <title> 02 XSLT Diego Castaño Freile </title>
                <meta name="description" content="Listado de tickets compra"/>
                <meta name="author" content="Diego Castaño Freile"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="Keywords" content="clave"/>
                <meta name="generator" content="NetBeans IDE 12.0"/>
                <meta name="refresh" content="180"/>
                <link rel="icon" href="../../images/finn.ico" type="image/ico"/>
                <style> 
                    
                    h1 {
                    background-color: #FF4500;
                    color: #8A2BE2;
                    }
                     
                    h2 {
                    background-color: #8A2BE2;
                    color: #FF4500;
                    }
                    
                    h3 {
                    border: 2px solid #800080;
                    color: #8A2BE2;
                    }
                    
                    table {
                    
                    border-collapse: collapse;
                    width: 50%;
                    margin-left: auto;
                    margin-right: auto;
                    } 
                    
                    th,td {
                    
                    border: 1px solid black; 
                    padding: 20px;
                    text-allign: center;
                    }
                </style>
            </head>
            <body>
                <header>
                    <h1>Información de tickets</h1>
                </header>
                <h2>Listado de tickets</h2>
                <h3>Tickets: 7483</h3>
                <table style="width:75%">
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th> 
                    </tr>
                    <tr>
                        <td>Agua</td>
                        <td>0.60</td>
                    </tr>
                    <tr>
                        <td>Refresco</td>
                        <td>1.00</td>
                    </tr>
                    <tr>
                        <th>Total</th>
                        <th>1.60</th>
                    </tr>
                </table>
                <h3>Tickets: 7484</h3>
                <table style="width:100%">
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th> 
                    </tr>
                    <tr>
                        <td>Refresco</td>
                        <td>1.00</td>
                    </tr>
                    <tr>
                        <td>Refresco</td>
                        <td>1.00</td>
                    </tr>
                    <tr>
                        <th>Total</th>
                        <th>2.00</th>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
