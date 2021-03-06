<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Это гостевой заголовок - ТИТУЛЬНАЯ СТРАНИЦА -->
	<xsl:include href="CSSnJS.header.xsl"/>
	<xsl:template name="head">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
			<xsl:if test="//@fullscreen != 1">
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
			</xsl:if>
			<base href="."/>
			<title>Скорая почта</title>
			<xsl:call-template name="css_js_header"/>
			<script type="text/javascript" src="/callme/js/callme.js"/>
		</head>
	</xsl:template>
	<xsl:template name="headWrap">
		<div id="header">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"/>
							<span class="icon-bar"/>
							<span class="icon-bar"/>
						</button>
						<a class="navbar-brand" href="/" title="Доставка цветов">
							<img src="./images/logo_black.png?v2.1" alt="Logo"/>
							<span class="header1" style="display:none;">Скорая почта</span>
						</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<div class="moduletable_LoginForm navbar-right">
							<xsl:apply-templates select="//page/body/module[@name = 'CurentUser']/container[@module = 'login']"/>
						</div>
						<div class="phone-in-header phone">
							<a class="mgo-number-11544" href="tel:+78122428081"><span class="city-code">8 (812)</span> 242-80-81</a>
							<script>
								(function(w, d, u, i, o, s, p) {
								if (d.getElementById(i)) { return; } w['MangoObject'] = o;
								w[o] = w[o] || function() { (w[o].q = w[o].q || []).push(arguments) }; w[o].u = u; w[o].t = 1 * new Date();
								s = d.createElement('script'); s.async = 1; s.id = i; s.src = u;
								p = d.getElementsByTagName('script')[0]; p.parentNode.insertBefore(s, p);
								}(window, document, '//widgets.mango-office.ru/widgets/mango.js', 'mango-js', 'mgo'));
								mgo({calltracking: {id: 11544, elements: [{selector: '.mgo-number-11544'}]}});
							</script>
						</div>
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="/pages/view-50/">О нас</a>
							</li>
							<li>
								<a href="/pages/view-51/">Тарифы</a>
							</li>							
							<li>
								<a href="/pages/view-49/">Условия сотрудничества</a>
							</li>
							<li>
								<a href="#" onclick="showThem('register_pop'); return false;"><b class="text-danger">Регистрация</b></a>
							</li>
							<li>
								<a href="/pages/view-52/">Контакты</a>
							</li>
						</ul>
						<script>
							var now_path = window.location.pathname;
							$('ul li a[href="'+now_path+'"]').parent().addClass('active');
						</script>
					</div><!-- /.navbar-collapse -->
				</div><!-- /.container-fluid -->
			</nav>
			<div id="register_pop" style="display: none;">
				<form id="register-form" action="/?register" method="post" name="form">
					<div class="module_login">
						<div class="boxIndent">
							<div class="wrapper">
								<p class="alert alert-info">Для регистрации на сайте заполните, пожалуйста, представленную форму и мы вышлем СМС с кодом подтверждения для доступа ко всем функциям сайта.</p>
								<p>
									<label for="mod-reg-name">Ваше имя</label>
									<input id="mod-reg-name" type="text" name="name" class="form-control" size="18" value="" onblur="" onfocus="" required=""/>
								</p>
								<p>
									<label for="mod-reg-login">Логин <small class="text-muted">придумайте логин который будет использоваться в вашем аккаунте</small></label>
									<input id="mod-reg-login" type="text" name="login" class="form-control login" onkeyup="check_user(this)" required=""/>
								</p>
								<p>
									<label for="mod-reg-phone">Номер мобильного телефона</label>
									<input id="mod-reg-phone" type="text" name="phone" class="form-control phone-number" maxlength="11" required=""/>
								</p>
								<p>
									<label for="mod-reg-desc">Что планируете доставлять с нашей помощью</label>
									<input id="mod-reg-desc" type="text" name="desc" class="form-control" maxlength="11"  placeholder="Доставка почты, цветов, подарков, документов..."/>
								</p>
								<div class="wrapper">
									<div class="create" style="text-align: right">
										<span class="btn btn-success" onclick="yaCounter46761789.reachGoal('registration');reg_form_submit(this)">Зарегистрироваться</span>
										<!--<span class="btn btn-success" onclick="reg_form_submit()">Зарегистрироваться</span>-->
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<script>
					function reg_form_submit(obj) {
						var allright = true;
						var $form = $(obj).closest('form');
						// Check if empty of not
						$($form).find( ':input[required]:visible' ).each(function () {
							if ($(this).val() === '') {
								$(this).focus();
								allright = false;
								return false;
							}
						});
						if (allright){
							bootbox.hideAll()
							var formData = $form.serialize();
							$.post($form.attr("action"), formData, function(data) {
								bootbox.alert(data, function(){ showThem('login_pop'); });
							});
						}
						return false;
					};
				</script>
			</div>
			<div class="mobile-sub-menu">
				<div class="slogan">Мы спасаем ваше время</div>
				<div class="moduletable_LoginForm login-mobile">
					<xsl:apply-templates select="//page/body/module[@name = 'CurentUser']/container[@module = 'login']"/>
				</div>
				<div class="phone-in-header phone-mobile">
					<a href="tel:+7-812-242-80-81"><span class="city-code">(812)</span> 242-80-81</a>
				</div>
			</div>
		</div>
		<div id="loading2" style="display:none;"><div class="loading-block"><p class="title" style="text-align:center;">Пожалуйста, подождите...<br/><img src="/images/anim_load.gif" /></p></div></div>
		<div id="login_pop" style="display: none;">
			<form id="login-form" action="/?login" method="post" name="form">
				<div class="module_login">
					<div class="boxIndent">
						<div class="wrapper">
							<form action="#" method="post" id="login-form">
								<strong class="msg-login">
									<xsl:value-of select="title"/>
								</strong>
								<xsl:if test="error != ''">
									<p class="alert alert-info">
										<xsl:value-of select="error"/>
									</p>
								</xsl:if>
								<p id="form-login-username">
									<label for="modlgn-username">Логин</label>
									<input id="modlgn-username" type="text" name="username" class="form-control" size="18" value=""/>
								</p>
								<p id="form-login-password">
									<label for="modlgn-passwd">Пароль</label>
									<input id="modlgn-passwd" type="password" name="userpass" class="form-control" size="18" value=""/>
								</p>
								<p id="form-login-password">
									<span class="btn btn-link" onclick="recover_password()">Забыли пароль?</span>
								</p>
								<div class="wrapper">
									<div class="create" style="text-align: right">
										<input type="submit" name="submit" value="Войти" class="btn btn-success"/>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</form>
		</div>
	</xsl:template>
</xsl:stylesheet>
