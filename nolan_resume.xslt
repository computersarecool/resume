<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="/">
    <html>
      <head>
        <title>Willy Nolan Resume</title>        
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" type="text/css" href="nolan_resume.css" />
      </head>

      <body>
        <section class="contact">
          <xsl:apply-templates select="Resume/Contact" />
        </section>
        
        <section class="programming">
          <h2>Programming Skills</h2>
          <xsl:apply-templates select="Resume/TechnicalSkills/Programming" />
        </section>
                
        <section class="applications">
          <h2>Application Skills</h2>
          <xsl:apply-templates select="Resume/TechnicalSkills/Applications" />
        </section>
        
        <section class="other-skills">
          <h2>Other Skills</h2>
          <xsl:apply-templates select="Resume/TechnicalSkills/OtherComputerSkills" />
        </section>
        
        <section class="experience">
          <h2>Work Experience</h2>
          <xsl:apply-templates select="Resume/RelevantExperience" />
        </section>
        
        <section class="education">
          <h2>Education</h2>
          <xsl:apply-templates select="Resume/Education" />
        </section>
        
        <section class="interests">
          <h2>Interests</h2>
          <xsl:apply-templates select="Resume/Interests" />
        </section>
          
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Name">
    <li><xsl:value-of select="text()" /></li>
  </xsl:template>

  <xsl:template match="Contact">
    <h1>
      <xsl:value-of select="FullName/text()" />
    </h1>
    <p>
      <xsl:value-of select="Email/text()" /><xsl:text> </xsl:text><span class="redact"><xsl:value-of select="Phone/text()" /></span>
    </p>
    <div class="redact">
      <p>
        <span><xsl:value-of select="Address/Street1/text()" /></span>
        <xsl:text> </xsl:text>
        <span><xsl:value-of select="Address/Street2/text()" /></span>
      </p>
      <p>
        <span><xsl:value-of select="Address/City/text()" /></span>
        <xsl:text> </xsl:text>
        <span><xsl:value-of select="Address/State/text()" /></span>
        <xsl:text> </xsl:text>
        <span><xsl:value-of select="Address/Zip/text()" /></span>
      </p>
    </div>
  </xsl:template>

  <xsl:template match="Programming">
    <ul>
      <xsl:apply-templates select="LanguageOrAPI" />
    </ul>
  </xsl:template>

  <xsl:template match="LanguageOrAPI">
    <li><xsl:value-of select="Name/text()" /></li>
  </xsl:template>

  <xsl:template match="Applications">
    <ul>
      <xsl:apply-templates select="Application" />
    </ul>
  </xsl:template>

  <xsl:template match="OtherComputerSkills">
    <ul>
      <xsl:apply-templates select="Skill" />
    </ul>
  </xsl:template>

  <xsl:template match="Skill">
    <li><xsl:value-of select="Name/text()" /><xsl:apply-templates select="Example" /></li>
  </xsl:template>

  <xsl:template match="Example">
    <xsl:text> </xsl:text><span><xsl:value-of select="text()" /></span>
  </xsl:template>

  <xsl:template match="RelevantExperience">
    <xsl:apply-templates select="Position" />
  </xsl:template>

  <xsl:template match="Position">
    <div class="work-experience">
      <p class="title work-details">
        <xsl:value-of select="Title/text()" />
      </p>
      <p class="work-details">
        <xsl:value-of select="Company/text()" />
      </p>
      <p class="work-details">
        <xsl:value-of select="Location/City/text()" />, <xsl:value-of select="Location/State/text()" />
      </p>
      <p class="work-details">
        <xsl:value-of select="Dates/StartDate/text()" /> - <span><xsl:value-of select="Dates/EndDate/text()" /></span>
      </p>
      <xsl:apply-templates select="Highlights" />
    </div>
  </xsl:template>

  <xsl:template match="Highlights">
    <ul>
      <xsl:apply-templates select="Highlight" />
    </ul>
  </xsl:template>

  <xsl:template match="Highlight">
    <li><xsl:value-of select="text()" /></li>
  </xsl:template>

  <xsl:template match="Education">
    <xsl:apply-templates select="School" />
  </xsl:template>

  <xsl:template match="School">
    <div class="education">
      <p class="degree">
        <xsl:value-of select="Degree/text()" />
      </p>
      <p>
        <xsl:value-of select="Name/text()" />
      </p>
      <p>
        <xsl:value-of select="Graduation/text()" />
      </p>
    </div>
  </xsl:template>

  <xsl:template match="Interests">
    <xsl:apply-templates select="Interest" />
  </xsl:template>

  <xsl:template match="Interest">
    <p>
      <xsl:value-of select="text()" />
    </p>
  </xsl:template>

</xsl:stylesheet>
