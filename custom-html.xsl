<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="/Users/Shared/DocBook/lib/docbook/xsl/html/chunk.xsl" />

<xsl:include href="custom-common.xsl" />

<xsl:param name="chunker.output.indent" select="'yes'" />
<xsl:param name="chunk.fast" select="1" />
<xsl:param name="base.dir" select="'../html/'" />
<xsl:param name="html.stylesheet" select="'manual.css'" />

</xsl:stylesheet>
