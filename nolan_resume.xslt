<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!--  Root template-->
    <xsl:template match="/">
        <html>
            <head>
                <title>Willy Nolan Resume</title>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" type="text/css" href="nolan_resume.css"/>
            </head>

            <body>
                <section class="about">
                    <h1 class="heading"><xsl:value-of select="Resume/Contact/FullName/text()"/></h1>
                    <xsl:apply-templates select="Resume/Contact"/>
                    <!--  Uncomment to include Personal Summary  -->
                    <!--  <xsl:apply-templates select="Resume/Summary"/>  -->
                    <xsl:apply-templates select="Resume/Interests"/>
                </section>

                <section class="education">
                    <xsl:apply-templates select="Resume/Education"/>
                </section>

                <section class="experience">
                    <xsl:apply-templates select="Resume/Experience"/>
                </section>

                <section class="skills">
                    <xsl:apply-templates select="Resume/Skills"/>
                </section>

                <section class="projects">
                    <xsl:apply-templates select="Resume/Projects"/>
                </section>
            </body>
        </html>
    </xsl:template>

    <!--  Contact template  -->
    <xsl:template match="Contact">
        <aside class="multi-element">
            <p>
                <span class="street-name">
                    <xsl:value-of select="Address/Street/text()"/>
                </span>

                <span class="city-name">
                    <xsl:value-of select="Address/City/text()"/>
                </span>

                <span class="state-name">
                    <xsl:value-of select="Address/State/text()"/>
                </span>

                <span>
                    <xsl:value-of select="Address/Zip/text()"/>
                </span>
            </p>

            <p class="email">
                <xsl:value-of select="Email/text()"/>
            </p>

            <p class="phone">
                <xsl:value-of select="Phone/text()"/>
            </p>

        </aside>
    </xsl:template>

    <!--  Personal Summary  -->
    <xsl:template match="Summary">
        <aside class="multi-element">
            <h2 class="second-heading"><xsl:value-of select ="name(.)"/></h2>
            <p>
                <xsl:value-of select="text()"/>
            </p>
        </aside>
    </xsl:template>

    <!--  Interests  -->
    <xsl:template match="Interests">
        <aside class="interests">
            <h2 class="second-heading"><xsl:value-of select ="name(.)"/></h2>
            <ul class="styled-list">
                <xsl:for-each select="Interest">
                    <li>
                        <xsl:apply-templates select="text()"/>
                    </li>
                </xsl:for-each>
            </ul>
        </aside>
    </xsl:template>

    <!--  Skills  -->
    <xsl:template match="Skills">
        <h1 class="heading"><xsl:value-of select ="name(.)"/></h1>
        <xsl:apply-templates select="Software"/>
        <xsl:apply-templates select="Applications"/>
        <xsl:apply-templates select="Other"/>
    </xsl:template>

    <!--  Programming Skills  -->
    <xsl:template match="Software">
        <aside class="multi-element">
            <h2 class="second-heading"><xsl:value-of select ="name(.)"/></h2>
            <ul>
                <xsl:for-each select="Skill">
                    <li>
                        <xsl:value-of select="Name/text()"/>
                    </li>
                </xsl:for-each>
            </ul>
        </aside>
    </xsl:template>

    <!--  Application Skills  -->
    <xsl:template match="Applications">
        <aside class="multi-element">
            <h2 class="second-heading"><xsl:value-of select ="name(.)"/></h2>
            <ul>
                <xsl:for-each select="Skill">
                    <li>
                        <xsl:value-of select="Name/text()"/>
                    </li>
                </xsl:for-each>
            </ul>
        </aside>
    </xsl:template>

    <!--  Other Skills  -->
    <xsl:template match="Other">
        <aside class="multi-element">
            <h2 class="second-heading"><xsl:value-of select ="name(.)"/></h2>
            <ul>
                <xsl:for-each select="Skill">
                    <li>
                        <span class="skill-example">
                            <xsl:value-of select="Name/text()"/>
                        </span>
                        <xsl:for-each select="Example">
                            <span class="no-display">
                                <xsl:value-of select="text()"/>
                            </span>
                        </xsl:for-each>
                    </li>
                </xsl:for-each>
            </ul>
        </aside>
    </xsl:template>

    <!--  Experience -->
    <xsl:template match="Experience">
        <h1 class="heading"><xsl:value-of select ="name(.)"/></h1>
        <xsl:for-each select="Position">
            <aside class="multi-element">
                <h2 class="second-heading">
                    <xsl:value-of select="Title/text()"/>
                </h2>

                <p>
                    <xsl:value-of select="Company/text()"/>
                </p>

                <p class="work-location">
                    <span class="city-name">
                        <xsl:value-of select="Location/City/text()"/>
                    </span>

                    <span class="state-name">
                        <xsl:value-of select="Location/State/text()"/>
                    </span>

                    <span class="start-date">
                        <xsl:value-of select="Dates/StartDate/text()"/>
                    </span>

                    <span class="end-date">
                        <xsl:value-of select="Dates/EndDate/text()"/>
                    </span>
                </p>

                <xsl:for-each select="Highlights">
                    <ul>
                        <xsl:for-each select="Highlight">
                            <li class="job-highlight">
                                <xsl:value-of select="text()"/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
            </aside>
        </xsl:for-each>
    </xsl:template>

    <!--  Education  -->
    <xsl:template match="Education">
        <h1 class="heading"><xsl:value-of select ="name(.)"/></h1>
        <xsl:for-each select="School">
            <aside class="school">
                <p class="second-heading">
                    <xsl:value-of select="Degree/text()"/>
                </p>

                <p class="degree">
                    <span class="degree-name">
                        <xsl:value-of select="Name/text()"/>
                    </span>
                    <xsl:value-of select="Graduation/text()"/>
                </p>

                <xsl:for-each select="Highlights">
                    <ul>
                        <xsl:for-each select="Highlight">
                            <li class="education-highlight">
                                <xsl:value-of select="text()"/>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
            </aside>
        </xsl:for-each>
    </xsl:template>

    <!--  Projects  -->
    <xsl:template match="Projects">
        <h1 class="heading"><xsl:value-of select ="name(.)"/></h1>
        <ul class="styled-list">
            <xsl:for-each select="Project">
                <li>
                    <xsl:value-of select="text()"/>
                </li>
            </xsl:for-each>
        </ul>

        <p class="list-annotate">
            These and other projects and research that can be shared publicly are documented at <a href="https://willynolan.com">willynolan.com</a>
        </p>

    </xsl:template>

</xsl:stylesheet>
