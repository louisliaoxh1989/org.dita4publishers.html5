<?xml version="1.0" encoding="utf-8"?>   
<!--   
       Licensed to the Apache Software Foundation (ASF) under one
       or more contributor license agreements.  See the NOTICE file
       distributed with this work for additional information
       regarding copyright ownership.  The ASF licenses this file
       to you under the Apache License, Version 2.0 (the
       "License"); you may not use this file except in compliance
       with the License.  You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing,
       software distributed under the License is distributed on an
       "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
       KIND, either express or implied.  See the License for the
       specific language governing permissions and limitations
       under the License.
-->

<xsl:stylesheet 
  xmlns:df="http://dita2indesign.org/dita/functions" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:relpath="http://dita2indesign/functions/relpath"
  xmlns:htmlutil="http://dita4publishers.org/functions/htmlutil" 
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  exclude-result-prefixes="df xs relpath htmlutil xd" 
  version="2.0"
 >
  <xsl:output name="ant" method="xml" indent="yes"/>
   
  <xsl:template match="/">
      <xsl:apply-templates select="*" mode="tag-preprocess" />  
  </xsl:template>
  
  <xsl:template match="html5" mode="tag-preprocess">
    <project name="compressfiles" basedir=".">
      <xsl:apply-templates select="*" mode="#current" />
    </project>
  </xsl:template>
  
  <xsl:template match="tag" mode="tag-preprocess">
    <xsl:variable name="type" select="source/@type"/>
    <xsl:variable name="filename" select="filename"/>
    <xsl:variable name="filelist">
      <xsl:for-each select="source/file">
        <xsl:value-of select="concat(',',./@path)"/>
      </xsl:for-each>
    </xsl:variable>  
    
    <package type="{$type}" filelist="{$filelist}" to="{$filename}" />
     
  </xsl:template>
  
  <xsl:template match="*"/>
  <xsl:template match="*"  mode="tag-preprocess"/>

</xsl:stylesheet>
