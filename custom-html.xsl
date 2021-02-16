<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="/proj/vizuetelab/projects/NIEHS_Gulf/apps/SMOKE_archive/DocBook/xsl/html/chunk.xsl" />

<xsl:include href="custom-common.xsl" />

<xsl:param name="chunker.output.indent" select="'yes'" />
<xsl:param name="chunk.fast" select="1" />
<xsl:param name="base.dir" select="'../html/'" />
<xsl:param name="html.stylesheet" select="'manual.css'" />
<xsl:param name="chunk.section.depth" select="'2'" />

<xsl:param name="generate.section.toc.level" select="'7'" />
<xsl:param name="toc.section.depth" select="'7'" />
<xsl:param name="toc.max.depth" select="'1'" />

<xsl:param name="generate.toc">
  book     toc,title
  chapter  toc
  section  toc
</xsl:param>

<xsl:template match="remark">
  <xsl:call-template name="inline.charseq"/>
</xsl:template>

</xsl:stylesheet>
