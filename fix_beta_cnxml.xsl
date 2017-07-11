<xsl:stylesheet version="1.0"
 xmlns="http://cnx.rice.edu/cnxml"  xmlns:c="http://cnx.rice.edu/cnxml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output omit-xml-declaration="yes" indent="yes"/>
 <xsl:strip-space elements="*"/>

 <xsl:template match="node()|@*">
     <xsl:copy>
       <xsl:apply-templates select="node()|@*"/>
     </xsl:copy>
 </xsl:template>

 <xsl:template match="c:para[not(*) and not(text())]">
    <xsl:message>empty para delete</xsl:message>
</xsl:template>

 <xsl:template match="c:list[not(*) and not(text())]">
    <xsl:message>empty list delete</xsl:message>
</xsl:template>

<xsl:template match="*[@id and string(number(substring(@id, 1, 1)))!='NaN']">
     <xsl:message>Bad id value: <xsl:value-of select="@id"/></xsl:message>
     <xsl:element name="{local-name()}">
         <xsl:attribute name="id">id_<xsl:value-of select="@id"/></xsl:attribute>
       <xsl:apply-templates select="node()|@*[not(name()='id')]"/>
   </xsl:element>
     
 </xsl:template>
<xsl:template match="@draggable" />
<xsl:template match="@hover-placeholder" />
<xsl:template match="@style" />

<xsl:template match="c:document[not(@id)]|
                     c:section[not(@id)]|
                     c:para[not(@id) and node()]|
                     c:figure[not(@id)]|
                     c:subfigure[not(@id)]|
                     c:media[not(@id)]|
                     c:list[not(@id)]|
                     c:definition[not(@id)]|
                     c:meaning[not(@id)]|
                     c:div[not(@id)]">
     <xsl:message><xsl:value-of select="local-name()"/></xsl:message>
     <xsl:element name="{local-name()}">
         <xsl:attribute name="id">
             <xsl:value-of select="generate-id(current())"/>
         </xsl:attribute>
       <xsl:apply-templates select="node()|@*"/>
   </xsl:element>
 </xsl:template>

 <xsl:template match="c:title/c:title"/>

 <xsl:template match="c:title[c:title]">
     <xsl:message>nested titles</xsl:message>
     <xsl:element name="title">
         <xsl:value-of select="./c:title"/>
         <xsl:apply-templates select="node()|@*"/>
     </xsl:element>
 </xsl:template>

 <xsl:template match="c:caption/c:para">
     <xsl:message>para under caption</xsl:message>
     <xsl:element name="caption">
         <xsl:apply-templates select="node()|@*"/>
     </xsl:element>
 </xsl:template>

 <xsl:template match="c:newline"/>

</xsl:stylesheet>
