<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" indent="yes"/>
    <xsl:include href="head.main.page.xsl"/>
    <xsl:include href="head.page.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="content">
            <xsl:value-of select="//page/body/@contentContainer"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
        <html>
            <xsl:call-template name="main_head"/>
            <body>
                <xsl:attribute name="id">
                    <xsl:value-of select="//page/@name"/>
                </xsl:attribute>
                <xsl:attribute name="user_name">
                    <xsl:value-of select="//page/body/module[@name='CurentUser']/container/user_name"/>
                </xsl:attribute>
                <xsl:attribute name="group_id">
                    <xsl:value-of select="//page/body/module[@name='CurentUser']/container/group_id"/>
                </xsl:attribute>
                <xsl:attribute name="user_id">
                    <xsl:value-of select="//page/body/module[@name='CurentUser']/container/user_id"/>
                </xsl:attribute>
                <div class="body-top">
                    <div class="main">
                        <xsl:if test="/page/@without_menu != 1">
                            <xsl:if test="/page/body/module[@name='CurentUser']/container/login = 1">
                                <xsl:call-template name="main_headWrap"/>
                            </xsl:if>
                            <xsl:if test="not(/page/body/module[@name='CurentUser']/container/login) or /page/body/module[@name='CurentUser']/container/login != 1">
                                <xsl:call-template name="headWrap"/>
                            </xsl:if>
                        </xsl:if>
                        <div id="content">
                            <div class="wrapper2">
                                <xsl:choose>
                                    <xsl:when test="//page/body[@hasErrors = 0]">
                                        <xsl:apply-templates
                                                select="//page/body/module[@name = 'menu' and @name != '$content']"/>
                                        <xsl:apply-templates select="//page/body/module[@name = $content]"/>
                                    </xsl:when>
                                    <xsl:when test="//page/body[@hasErrors = 1]">
                                        <div id="errors">
                                            <h2>Ошибка</h2>
                                            <xsl:apply-templates select="//page/body/module[@name = 'error']"/>
                                            <xsl:apply-templates
                                                    select="//page/body/module[@name = $content]/container[@module = 'errors']"/>
                                            <p>
                                                <a href="/" title="На главную">На главную</a>
                                            </p>
                                        </div>
                                    </xsl:when>
                                    <xsl:when test="//page/body[@hasErrors = 2]">
                                        <xsl:apply-templates select="//page/body/module[@name = $content]"/>
                                    </xsl:when>
                                </xsl:choose>
                            </div>
                        </div>
                        <div class="clear"/>
                        <xsl:if test="/page/@without_menu != 1">
                            <xsl:call-template name="bottom_block"/>
                        </xsl:if>
                    </div>
                </div>
                <!--ВРЕМЕННО !!! -->
                <xsl:if test="/page/@without_menu = 1">
                <!-- BEGIN JIVOSITE CODE {literal} -->
                <script type='text/javascript'>
                    (function(){ var widget_id = 'so0nsK6RO4';var d=document;var w=window;function l(){
                    var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();</script>
                <!-- {/literal} END JIVOSITE CODE -->
                    <!-- Global site tag (gtag.js) - Google Analytics -->
                    <script async="async" src="https://www.googletagmanager.com/gtag/js?id=UA-106491809-1"/>
                    <script>
                        window.dataLayer = window.dataLayer || [];
                        function gtag(){dataLayer.push(arguments);}
                        gtag('js', new Date());
                        gtag('config', 'UA-106491809-1');
                    </script>
                </xsl:if>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
