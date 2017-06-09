<?xml version="1.0" encoding="UTF-8"?>
<!-- Unified Streaming SMIL Stylesheet -->
<xsl:stylesheet version="2.0"
                xmlns:html="http://www.w3.org/TR/REC-html40"
                xmlns:smil="http://www.w3.org/2001/SMIL20/Language"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="smil:smil">
    <html>
      <head>
        <title>Unified Streaming Remix SMIL File</title>
        <link href="smil/smil.css" type="text/css" rel="stylesheet"/>
      </head>
      <body>
        <xsl:apply-templates />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="smil:video">
    <xsl:choose>
      <xsl:when test="@clipBegin or @clipEnd">
        <div class="video partial">
          <xsl:value-of select="@src" />
        </div> 
      </xsl:when>
      <xsl:otherwise>
        <div class="video">
          <xsl:value-of select="@src" />
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="smil:seq">
    <div class="seq">
      <xsl:apply-templates select="smil:video" />
    </div>
  </xsl:template>

  <xsl:template match="smil:par">
    <div class="par">
      <xsl:apply-templates />
    </div>
  </xsl:template>

</xsl:stylesheet>
