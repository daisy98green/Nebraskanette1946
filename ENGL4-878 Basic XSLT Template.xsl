<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="iso-8859-1" omit-xml-declaration="yes"/>
    
    
    
    <xsl:template match="/"> <!-- NOTICE THE SLASH THERE. In XPath this means root node (which in a TEI XML file is <TEI>).  I USE THIS TO ORGANIZE THE BASIC STRUCTURE  OF THE OUTPUT DOCUMENT. SO IT WILL INCLUDE BASIC DOCUMENT STRUCTURE TAGS AND ANY PULLING/REORGANIZING OF INFORMATION FROM THE ORIGINAL.-->
        <html>
            <head><link rel="stylesheet" href="CSS%20Template.css"/></head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:titlePart">
        <p class="title">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:docImprint">
        <p class="docImprint">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:docDate">
        <p class="docDate">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="tei:closer">
        <p class="closer">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
   
    
    <xsl:template match="tei:table">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="tei:row">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="tei:cell">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <xsl:template match="tei:cell[@rend='right aligned']">
        <td class="right">
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:p[@rend='centered']">
        <p class="center">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:ref">
        <xsl:element name="a">
            <xsl:attribute name="href">
            <xsl:value-of select="@target"/>
           <xsl:apply-templates/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="tei:sp/tei:p">
            <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="tei:stage">
        <p class="stage">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:sp">
        <p class="sp">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="tei:ptr">
        <xsl:choose>
            <xsl:when test="parent::tei:cell">
                <xsl:element name="a">
                    <xsl:attribute name="href">
                    <xsl:value-of select="@target"/>
                </xsl:attribute>
                    <xsl:value-of select="preceding-sibling::tei:p"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            (<xsl:value-of select="@n"/>)
            <xsl:apply-templates/>
        </xsl:element></xsl:otherwise></xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:anchor">
        <xsl:element name="a">
            <xsl:attribute name="id">
                <xsl:apply-templates select="@xml:id"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:cell/tei:p">
        <xsl:choose>
            <xsl:when test="following-sibling::tei:ptr"/>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    
    
    
    <xsl:template match="tei:space"/>
    
    
    
    <xsl:template match="tei:head[@type='1']">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    
    <xsl:template match="tei:head[@type='2']">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>


    <xsl:template match="tei:head[@type='subtitle']">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    

    
    <xsl:template match="label">
        <h5>
            <xsl:apply-templates/>
        </h5>
    </xsl:template>
    
    
    <xsl:template match="tei:byline">
        <p class="byline">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="tei:lg">
        <p class="stanza">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="tei:fw"/>
    
    
    
    <xsl:template match="tei:figDesc"/>
        
    
    
    <xsl:template match="tei:l">
        <xsl:apply-templates/><br/>
    </xsl:template>    
    
    
    
    <xsl:template match="tei:lb"/>

    
    
    <xsl:template match="tei:hi[@rend='bold']">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    
    
    
    <xsl:template match="tei:hi[@rend='underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    
    
    <xsl:template match="tei:hi[@rend='italic']">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    
    
    <xsl:template match="tei:note[@type='editorial']">
        <p class="editorial">
            <xsl:element name="a">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </p>
    </xsl:template>        
    
    
    <xsl:template match="tei:ref">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@source"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    
    
    <xsl:template match="tei:pb">
        <a>
            <xsl:attribute name="href">1946/<xsl:value-of select="@facs"/></xsl:attribute><img><xsl:attribute name="src">1946/<xsl:value-of select="@facs"/></xsl:attribute></img>
        </a>
    </xsl:template>
    
    
    <xsl:template match="tei:choice"> 
        <xsl:choose>
            <xsl:when test="tei:orig">
                <xsl:apply-templates select="child::tei:orig"/> [<xsl:value-of select="child::tei:reg"/>]
            </xsl:when>
            <xsl:when test="tei:sic">
                <xsl:apply-templates select="child::tei:sic"/> [<xsl:value-of select="child::tei:corr"/>]
            </xsl:when>
            <xsl:when test="tei:abbr">
                <xsl:apply-templates select="child::tei:abbr"/> [<xsl:value-of select="child::tei:expan"/>]
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    
    
    
    <xsl:template match="tei:teiHeader"/>
    
    
    
</xsl:stylesheet>
