<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

<xsl:import href="/usr/local/docbook/xsl/fo/docbook.xsl" />

<xsl:include href="custom-common.xsl" />

<xsl:param name="fop.extensions" select="1" />
<xsl:param name="xep.extensions" select="1" />
<xsl:param name="title.margin.left" select="'0pc'" />
<xsl:param name="alignment" select="'left'" />
<xsl:param name="insert.xref.page.number" select="1" />
<xsl:param name="double.sided" select="1" />

<xsl:param name="toc.section.depth" select="1" />
<xsl:param name="toc.max.depth" select="2" />

<xsl:param name="generate.toc">
  book     toc,title,figure,table,example,equation
  chapter  toc
</xsl:param>

<xsl:template match="remark">
  <fo:inline>
    <xsl:call-template name="inline.charseq" />
  </fo:inline>
</xsl:template>

<xsl:template match="phrase[@role='symbol']">
  <fo:inline font-family="Symbol">
    <xsl:apply-templates />
  </fo:inline>
</xsl:template>

</xsl:stylesheet>
