<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="container[@module = 'index']">
        <xsl:if test="//page/@isAjax != 1">
            <div class="row">
                <div class="camera_wrap" style="height: 200px; display:block;">
                    <div data-src="images/image_1.jpg?v1">
                        <div class="camera_caption fadeIn camera_effected">
                            <h3>Курьерская служба срочной доставки</h3>
                            <h1>в Санкт-Петербурге</h1>
                        </div>
                    </div>
                    <div data-src="images/image_1.jpg?v1">
                        <div class="camera_caption  fadeIn camera_effected">
                            <h1>Доставим за 3 часа по Санкт-Петербургу</h1>
                            <h3>от 360 до 480 руб</h3>
                        </div>
                    </div>
                    <div data-src="images/image_1.jpg?v1">
                        <div class="camera_caption fadeIn camera_effected">
                            <h1>Организуем ваш отдел доставки</h1>
                            <h3> от 30 адресов</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">Калькулятор доставки</h3>
                        </div>
                        <div id="viewListlang" class="panel-body">
                            <xsl:call-template name="calcOnMain"/>
                            <div style="display:none">
                                <xsl:for-each select="prices/item">
                                    <input id="km_{id}" class="km_cost" type="hidden" value="{km_cost}" km_from="{km_from}" km_to="{km_to}"/>
                                </xsl:for-each>
                                <xsl:for-each select="add_prices/item">
                                    <input id="km_{type}" type="hidden" value="{cost_route}"/>
                                </xsl:for-each>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <br/>
        </xsl:if>
        <xsl:if test="//page/@isAjax = 1">
            Ajax!
        </xsl:if>
    </xsl:template>
    <xsl:template name="calcOnMain">
        <div class="col-sm-4">
            <div class="alert alert-warning">
                <span class="glyphicon glyphicon-info-sign"/>
                <i> Введите адреса для моментального расчёта стоимости доставки:</i>
            </div>
            <hr/>
            <div class="row">
                <div class="col-xs-12">
                    <div class="input-group routes-block" rel="{position()}" style="width: 100%;">
                        <div class="form-control" style="width: 100%;">
                            <span class="order-add-title text-info">Адрес отправления</span>
                            <input type="search" class="order-route-data spb-streets" name="to[]" title="Улица, проспект и т.д." onchange="" autocomplete="off" required=""/>
                        </div>
                        <!--<div class="form-control" style="width: 30%;">-->
                            <!--<span class="order-add-title text-info">дом/корп.</span>-->
                            <!--<select type="text" class="order-route-data to_house number" name="to_house[]" title="Дом/Корпус" onchange="calc_route(1)" autocomplete="off" required="" AOGUID=""/>-->
                        <!--</div>-->
                    </div>
                </div>
            </div>
            <br/>
            <div class="row">
                <div class="col-xs-12">
                    <div class="input-group routes-block" rel="{position()}" style="width: 100%;">
                        <div class="form-control" style="width: 100%;">
                            <span class="order-add-title text-info">Адрес доставки</span>
                            <input type="search" class="order-route-data spb-streets" name="to[]" title="Улица, проспект и т.д." onchange="" autocomplete="off" required=""/>
                        </div>
                        <!--<div class="form-control" style="width: 30%;">-->
                            <!--<span class="order-add-title text-info">дом/корп.</span>-->
                            <!--<select type="text" class="order-route-data to_house number" name="to_house[]" title="Дом/Корпус" onchange="calc_route(1)" autocomplete="off" required="" AOGUID=""/>-->
                        <!--</div>-->
                    </div>
                </div>
            </div>
            <hr/>
            <span class="btn btn-info calc_route" onclick="yaCounter46761789.reachGoal('calculate_delivery');calc_route(1)">Рассчитать доставку</span>
            <div class="delivery_sum_title">---</div>
            <hr/>
            <div class="alert alert-info">
                <span class="glyphicon glyphicon-ok-sign"/>
                <xsl:text> </xsl:text>
                <i><a href="#" onclick="showThem('register_pop'); return false;" ><b class="text-danger">Зарегистрируйтесь</b></a>, пожалуйста, чтобы мы могли осуществлять для вас доставки.</i>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="row">
                <div class="col-sm-12 map-form">
                    <div class="map-container">
                        <div class="map-info">
                            <span id="ShortInfo"/>
                            <div class="map-full-info" id="viewContainer"/>
                        </div>
                        <div id="map" style="width: 100%; min-height: 420px"/>
                    </div>
                </div>
            </div>
        </div>


    </xsl:template>
    <!-- НОВОСТИ НА ГЛАВНОЙ -->
    <xsl:template name="newsListIndex">
            <div class="panel panel-info arrow left">
                <div class="panel-heading">
                    <h3 class="panel-title">Новости</h3>
                </div>
                <div class="panel-body">
                  <xsl:for-each select="news/item">
                    <header class="text-left">
                        <span class="label label-info" style="float: right;">
                            <time class="comment-date" datetime="{time}">
                                <i class="fa fa-clock-o"/>
                                <xsl:text> </xsl:text><xsl:value-of select="time"/>
                            </time>
                        </span>
                        <div class="comment-user">
                            <i class="fa fa-user"/>
                            <xsl:text> </xsl:text><xsl:value-of select="title"/>
                        </div>
                    </header>
                    <div class="comment-post">
                        <xsl:value-of select="content" disable-output-escaping="yes"/>
                    </div>
                    <xsl:if test="subject != ''">
                        <p class="text-right" style="margin: 0;"><a href="/news/view-{id}/" class="btn btn-warning btn-xs"><i class="fa fa-reply"/><xsl:text> </xsl:text>Подробнее</a></p>
                    </xsl:if>
                      <hr/>
                 </xsl:for-each>
                </div>
            </div>
    </xsl:template>
</xsl:stylesheet>