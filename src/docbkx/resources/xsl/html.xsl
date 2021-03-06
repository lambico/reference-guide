<?xml version="1.0" encoding="utf-8"?>
<!--

    Copyright (C) 2009 Lambico Team <lucio.benfante@gmail.com>

    This file is part of Lambico Reference Guide.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

-->

<!-- 
    This is the XSL HTML configuration file for the Lambico
    reference guide.
    
    Thanks are due to the Spring Security project
    team for writing the original stylesheet upon which this one
    is based.
        
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xslthl="http://xslthl.sf.net"
                exclude-result-prefixes="xslthl"
                version='1.0'>

    <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/html/docbook.xsl"/>
    <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/html/highlight.xsl"/>

    <!-- Only use scaling in FO -->
    <xsl:param name="ignore.image.scaling">1</xsl:param>

    <!-- Use code syntax highlighting -->
    <xsl:param name="highlight.source">1</xsl:param>

<!-- Extensions -->
    <xsl:param name="use.extensions">1</xsl:param>
    <xsl:param name="tablecolumns.extension">0</xsl:param>
    <xsl:param name="callout.extensions">1</xsl:param>

<!-- Activate Graphics -->
    <xsl:param name="admon.graphics" select="1"/>
    <xsl:param name="admon.graphics.path">images/</xsl:param>
    <xsl:param name="admon.graphics.extension">.png</xsl:param>
    <xsl:param name="callout.graphics" select="1" />
    <xsl:param name="callout.defaultcolumn">120</xsl:param>
    <xsl:param name="callout.graphics.path">images/callouts/</xsl:param>
    <xsl:param name="callout.graphics.extension">.png</xsl:param>

    <xsl:param name="table.borders.with.css" select="1"/>
    <xsl:param name="html.stylesheet">css/manual.css</xsl:param>
    <xsl:param name="html.stylesheet.type">text/css</xsl:param>
    <xsl:param name="generate.toc">book toc,title</xsl:param>

    <xsl:param name="admonition.title.properties">text-align: left</xsl:param>

    <!-- Leave image paths as relative when navigating XInclude -->
    <xsl:param name="keep.relative.image.uris" select="1"/>

<!-- Label Chapters and Sections (numbering) -->
    <xsl:param name="chapter.autolabel" select="1"/>
    <xsl:param name="section.autolabel" select="1"/>
    <xsl:param name="section.autolabel.max.depth" select="2"/>

    <xsl:param name="section.label.includes.component.label" select="1"/>
    <xsl:param name="table.footnote.number.format" select="'1'"/>

<!-- Show only Sections up to level 2 in the TOCs -->
    <xsl:param name="toc.section.depth">2</xsl:param>

<!-- Remove "Chapter" from the Chapter titles... -->
    <xsl:param name="local.l10n.xml" select="document('')"/>
    <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
        <l:l10n language="en">
            <l:context name="title-numbered">
                <l:template name="chapter" text="%n.&#160;%t"/>
                <l:template name="section" text="%n&#160;%t"/>
            </l:context>
        </l:l10n>
    </l:i18n>

    <xsl:template match='xslthl:keyword' mode="xslthl">
        <span class="hl-keyword"><xsl:apply-templates mode="xslthl"/></span>
    </xsl:template>

    <xsl:template match='xslthl:comment' mode="xslthl">
        <span class="hl-comment"><xsl:apply-templates mode="xslthl"/></span>
    </xsl:template>

    <xsl:template match='xslthl:oneline-comment' mode="xslthl">
        <span class="hl-comment"><xsl:apply-templates mode="xslthl"/></span>
    </xsl:template>

    <xsl:template match='xslthl:multiline-comment' mode="xslthl">
        <span class="hl-multiline-comment"><xsl:apply-templates mode="xslthl"/></span>
    </xsl:template>

    <xsl:template match='xslthl:tag' mode="xslthl">
        <span class="hl-tag"><xsl:apply-templates mode="xslthl"/></span>
    </xsl:template>

    <xsl:template match='xslthl:attribute' mode="xslthl">
        <span class="hl-attribute"><xsl:apply-templates mode="xslthl"/></span>
    </xsl:template>

    <xsl:template match='xslthl:value' mode="xslthl">
        <span class="hl-value"><xsl:apply-templates mode="xslthl"/></span>
    </xsl:template>

    <xsl:template match='xslthl:string' mode="xslthl">
        <span class="hl-string"><xsl:apply-templates mode="xslthl"/></span>
    </xsl:template>

    <!-- Google Analytics -->
    <xsl:template name="user.head.content">
<xsl:comment>Begin Google Analytics code</xsl:comment>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-566017-9']);
  _gaq.push(['_setDomainName', '.lambico.org']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<xsl:comment>End Google Analytics code</xsl:comment>
    </xsl:template>

    </xsl:template>

</xsl:stylesheet>

