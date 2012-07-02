<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

<xsl:import href="/nas01/depts/ie/cempd/apps/SMOKE_archive/DocBook/xsl/fo/docbook.xsl" />

<xsl:include href="custom-common.xsl" />

<xsl:param name="xep.extensions" select="1" />
<xsl:param name="body.start.indent" select="'0pc'" />
<xsl:param name="alignment" select="'left'" />
<xsl:param name="insert.xref.page.number" select="1" />
<xsl:param name="double.sided" select="1" />
<xsl:param name="header.column.widths" select="'1 2 1'" />

<xsl:param name="toc.section.depth" select="1" />
<xsl:param name="toc.max.depth" select="2" />

<xsl:param name="generate.toc">
  book     toc,title
  chapter  toc
</xsl:param>

<!-- Set remarks to be formatted normally -->
<xsl:template match="remark">
  <fo:inline>
    <xsl:call-template name="inline.charseq" />
  </fo:inline>
</xsl:template>

<!-- Set special processing for segmented lists -->
<xsl:template match="segmentedlist" mode="seglist-table">
  <xsl:apply-templates select="title" mode="list.title.mode" />
  <fo:table>
    <fo:table-column column-number="1" column-width="proportional-column-width(25)"/>
    <fo:table-column column-number="2" column-width="proportional-column-width(75)"/>
    <fo:table-header>
      <fo:table-row>
        <xsl:apply-templates select="segtitle" mode="seglist-table"/>
      </fo:table-row>
    </fo:table-header>
    <fo:table-body>
      <xsl:apply-templates select="seglistitem" mode="seglist-table"/>
    </fo:table-body>
  </fo:table>
</xsl:template>

<xsl:template match="segtitle" mode="seglist-table">
  <fo:table-cell>
    <fo:block font-weight="bold">
      <xsl:apply-templates/>
    </fo:block>
  </fo:table-cell>
</xsl:template>

<!-- Set indent for table to always be 0, fixes problems with tables inside lists -->
<xsl:template match="tbody">
  <xsl:variable name="tgroup" select="parent::*"/>

  <fo:table-body start-indent="0">
    <xsl:apply-templates select="row[1]">
      <xsl:with-param name="spans">
        <xsl:call-template name="blank.spans">
          <xsl:with-param name="cols" select="../@cols"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:apply-templates>
  </fo:table-body>
</xsl:template>

<!-- Set font for titles of formal objects (figures, tables, etc.) -->
<xsl:attribute-set name="formal.title.properties" 
                   use-attribute-sets="normal.para.spacing">
  <xsl:attribute name="font-family">sans-serif</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="font-size">10pt</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
