<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

<xsl:import href="/Users/Shared/DocBook/lib/docbook/xsl/fo/docbook.xsl" />

<xsl:param name="fop.extensions" select="1" />
<xsl:param name="title.margin.left" select="'0pc'" />
<xsl:param name="alignment" select="'left'" />

<xsl:template match="remark">
  <fo:inline font-style="italic" color="red">
    <xsl:call-template name="inline.charseq" />
  </fo:inline>
</xsl:template>

</xsl:stylesheet>
