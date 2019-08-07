<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
<xsl:output method="html" indent="yes" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>

	<xsl:template match="/Project/Environments">
		<HTML>
			<HEAD>
				<STYLE type="text/css">
					.off {
						color: blue;
		   				background: white;
						text-decoration: none;
		   				size: 9pt;
				   	    font-family: Verdana,Arial,Helvetica;
				    	font-size: xx-small;
					}
					.over { 
						color: white;
		   				background: blue;
						text-decoration: none;
			            size: 9pt;
		   				font-family: Verdana,Arial,Helvetica;
			     		font-size: xx-small;
					}
				</STYLE>
			</HEAD>
			<BODY>
				<TABLE style="border: thick solid" WIDTH="100%">
					<xsl:for-each select="Environment">
		        		<TR>
							<TH style="background-color:#000000;color:#FFFFFF">Environment:</TH>
							<TD colspan="7"><xsl:value-of select="@name"/>
								<xsl:if test="@URL != ''">
									- <xsl:value-of select="@URL"/> 
								</xsl:if>
							</TD>
						</TR>
						<TR style="background-color:#000000;color:#FFFFFF">
							<TH WIDTH="18%">Server Name</TH>
							<TH WIDTH="10%">IP Address</TH>
							<TH WIDTH="10%">RILO Address</TH>
							<TH WIDTH="10%">Gigabit Address</TH>
							<TH WIDTH="15%">Server Type</TH>
							<TH WIDTH="10%">Serial Number</TH>
							<TH WIDTH="7%">Asset Number</TH>
							<TH WIDTH="20%">Operating System</TH>
						</TR>
						<xsl:for-each select="Rack">
							<TR>
								<TD WIDTH="20%" COLSPAN="8"><xsl:value-of select="@name"/></TD>
							</TR>
							<xsl:for-each select="Blade">
								<xsl:element name="tr">
									<xsl:attribute name="style">
										<xsl:choose>
											<xsl:when test="position() mod 2">
												background-color:#DDDDFF;
											</xsl:when>
											<xsl:otherwise>
												background-color:#BBBBBB;
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<TD WIDTH="18%" align="right"><font size="2"><xsl:value-of select="@name"/> - (<xsl:value-of select="@enclosure"/>/<xsl:value-of select="@bay"/>)</font></TD>
									<TD WIDTH="10%" align="right"><font size="2"><xsl:value-of select="@ip"/></font></TD>
									<TD WIDTH="10%" align="right"><font size="2"><xsl:value-of select="RILO/@ip"/></font></TD>
									<xsl:if test="Gigabit/@ip != ''">
										<TD WIDTH="10%" align="right"><font size="2"><xsl:value-of select="Gigabit/@ip"/></font></TD>
									</xsl:if>
									<xsl:if test="Gigabit/@ip = ''">
										<TD WIDTH="10%" align="right"><font size="2">N/A</font></TD>
									</xsl:if>
									<TD WIDTH="15%" align="right"><font size="2"><xsl:value-of select="Type"/></font></TD>
									<TD WIDTH="10%" align="right"><font size="2">N/A</font></TD>
									<TD WIDTH="7%" align="right"><font size="2">N/A</font></TD>
									<TD WIDTH="20%" align="right"><font size="2"><xsl:value-of select="OperatingSystem/version"/></font></TD>
								</xsl:element>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="Server">
								<xsl:element name="tr">
									<xsl:attribute name="style">
										<xsl:choose>
											<xsl:when test="position() mod 2">
												background-color:#DDDDFF;
											</xsl:when>
											<xsl:otherwise>
												background-color:#BBBBBB;
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
								<TD WIDTH="18%"><xsl:value-of select="@name"/></TD>
								<TD WIDTH="10%"><xsl:value-of select="@ip"/></TD>
								<xsl:if test="RILO/@ip != ''">
									<TD WIDTH="10%"><xsl:value-of select="RILO/@ip"/></TD>
								</xsl:if>
								<xsl:if test="RILO/@ip = ''">
									<TD WIDTH="10%">N/A</TD>
								</xsl:if>
								<xsl:if test="Gigabit/@ip != ''">
									<TD WIDTH="10%"><xsl:value-of select="Gigabit/@ip"/></TD>
								</xsl:if>
								<xsl:if test="Gigabit/@ip = ''">
									<TD WIDTH="10%">N/A</TD>
								</xsl:if>
								<TD WIDTH="15%"><xsl:value-of select="Type"/></TD>
								<TD WIDTH="10%"><xsl:value-of select="SerialNumber"/></TD>
								<TD WIDTH="7%"><xsl:value-of select="AssetNumber"/></TD>
								<TD WIDTH="20%"><xsl:value-of select="OperatingSystem/version"/></TD>
							</xsl:element>
							<xsl:for-each select="VMware[Instance]/Instance">
								<xsl:element name="tr">
									<xsl:attribute name="style">
										<xsl:choose>
											<xsl:when test="position() mod 2">
												background-color:#DDDDFF;
											</xsl:when>
											<xsl:otherwise>
												background-color:#BBBBBB;
											</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<TD WIDTH="18%" align="right"><font size="2"><xsl:value-of select="@Name"/></font></TD>
									<TD WIDTH="10%" align="right"><font size="2"><xsl:value-of select="@ip"/></font></TD>
									<TD WIDTH="10%" align="right"><font size="2">N/A</font></TD>
									<TD WIDTH="10%" align="right"><font size="2">N/A</font></TD>
									<TD WIDTH="15%" align="right"><font size="2">VMware Instance</font></TD>
									<TD WIDTH="10%" align="right"><font size="2">N/A</font></TD>
									<TD WIDTH="7%" align="right"><font size="2">N/A</font></TD>
									<TD WIDTH="20%" align="right"><font size="2"><xsl:value-of select="OS/version"/></font></TD>
							</xsl:element>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</TABLE>
				<BR/><BR/>
			</BODY>
		</HTML>
	</xsl:template>
</xsl:stylesheet>
