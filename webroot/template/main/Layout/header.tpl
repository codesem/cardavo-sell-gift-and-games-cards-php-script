<!DOCTYPE html>
<html class="no-js" lang="en" prefix="og: http://ogp.me/ns#">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$site_title} {do_config(6)} {do_config(0)}</title>
    
    <!-- Keywords -->
    <meta name="keywords" content="{$keywords}" />
    
    <!-- Description -->
    <meta name="description" content="{$site_description}" />

    <!-- Robots -->
    {if do_config(30) == 1}
    <meta name="robots" content="index, follow"/>
    {elseif do_config(30) == 2}
    <meta name="robots" content="noindex, unfollow"/>
    {/if}

    <!-- Verification -->
    {do_config(13)}
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="{do_config(7)}" type="image/png">
    <link rel="apple-touch-icon" href="{do_config(7)}">

    <!-- =========================
        Loding All Stylesheet
    ============================== -->
    <link rel="stylesheet" href="{$AST}custom/css/bootstrap.min.css">
    <link rel="stylesheet" href="{$AST}custom/css/font-awesome.min.css">
    <link rel="stylesheet" href="{$AST}custom/css/owl.carousel.min.css">
    <link rel="stylesheet" href="{$AST}custom/css/owl.carousel.min.css">
    <link rel="stylesheet" href="{$AST}custom/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="{$AST}custom/css/animate.min.css">
    <link rel="stylesheet" href="{$AST}custom/css/megamenu.css">

    <!-- =========================
        Loding Main Theme Style
    ============================== -->
    <link rel="stylesheet" href="{$AST}custom/css/style.css">

    <!-- Canonical -->
    <link rel="canonical" href="{$canonical}" />
    <!-- Open Graph -->
    <meta property="og:locale" content="{do_config(11)}" />
    <meta property="og:title" content="{$site_title} {do_config(6)} {do_config(0)}" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="{$canonical}" />
    <meta property="og:description" content="{$site_description}" />
    <meta property="og:site_name" content="{do_config(0)}" />
    <meta property="og:image" content="{$meta_img}" />
    <meta property="og:image:secure_url" content="{$meta_img}" /> 
    <meta property="og:image:type" content="application/octet-stream">
    <meta property="og:image:width" content="" />
    <meta property="og:image:height" content="" />
        
    <!-- =========================
    	Header Loding JS Script
    ============================== -->
    <script src="{$AST}custom/js/modernizr.js"></script>
    
  </head>
  <body>
    <!--[if lt IE 8]>
      <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <!-- =========================
         Top Header Section
    ============================== -->
	<section id="wd-header" class="dark-header">
		<div class="container-fluid custom-width" >
			<div class="row">
				<div class="col-md-12 col-lg-3 col-xl-3 text-center second-home-main-logo">
					<a href="{$HOST}">
					    <img src="{do_config(21)}" alt="{do_config(0)}">
					</a>
				</div>
				<div class="col-md-4 col-lg-5 slider-search-section d-none d-md-block">
                  <form action="{$HOST}search" method="GET">
						<div class="input-group">
							<div class="input-group-btn">
								<button class="btn btn-secondary wd-slider-search-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								 <i class='fa fa-bars'></i>
								</button>
							</div>
							<input type="text" name="term" class="form-control input-search-box" placeholder="{$_SEARCH_FOR_PRODUCTS}">
							<span class="input-group-btn">
								<button class="btn btn-secondary wd-search-btn" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
							</span>
						</div>
                </form>
				</div>
				<div class="col-md-6 col-lg-3 col-xl-3 text-right d-none d-md-block">
                    <div id="main-menu-2" class="main-menu-desktop no-border main-menu-sh">
                            <div class="menu-container wd-megamenu text-left">
                                <div class="menu">
                                    <ul class="wd-megamenu-ul">
                                        <li><a href="{$HOST}" class="main-menu-list"><i class="fa fa-home" aria-hidden="true"></i> {strtoupper($_HOME)}</a></li>
                                        <li><a href="{$HOST}contact" class="main-menu-list"><i class="fa fa-envelope" aria-hidden="true"></i> {strtoupper($_CONTACT)}</a></li>
                                     {if $role =='admin'}
                                        <li><a href="{$ADM}dashboard" class="main-menu-list"><i class="fa fa-dashboard" aria-hidden="true"></i> {strtoupper($_ADMIN)}</a></li>
                                     {/if}
                                    </ul>
                                </div>
                            </div>
                    </div>
				</div>
			</div>
		</div>
	</section>

    <!-- =========================
         Header Desktop & Mobile
    ============================== -->
    <div class="on-desktop">
        <section id="wd-header-2" class="wd-header-nav sticker-nav mob-sticky bg-orange">
		<div class="container-fluid custom-width">
			<div class="row">
                <div class="col-xl-3 d-none d-xl-block">
                        <div class="department" id="cat-department">
                            <img src="{$AST}custom/img/us-flag.png" width="22" height="20" alt="English">
                        <div class="btn-group" role="group">

                            <button id="btnGroupDrop3" type="button" class="btn btn-lang wd-btn-country dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            {$_ENGLISH}
						    </button>
                            <div class="dropdown-menu wd-btn-country-list" aria-labelledby="btnGroupDrop3">
                                <a class="dropdown-item" href="#"><img src="{$AST}custom/img/us-flag.png" width="22" height="15" alt="{$_ENGLISH}"> {$_ENGLISH}</a>
                            </div>
                        </div>

                            <div id="department-list" class="department-list">
                            </div>
                        </div>
                    </div>
                <div class="col-md-6 col-lg-8 col-xl-6 header-search-box d-none d-md-block">
                    <div id="main-menu-2" class="main-menu-desktop no-border main-menu-sh">
                            <div class="menu-container wd-megamenu text-left">
                                <div class="menu">
                                    <ul class="wd-megamenu-ul">
                            {foreach from=$categories item=foo}
                                        <li><a href="{$CAT}{$foo['link']}" class="main-menu-list">
                                            {$foo['name']}</a>
                                        </li>
                            {/foreach}
                                    </ul>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="col-md-6 col-lg-3 col-xl-3 text-right">
                    
					<!-- =========================
						 User Account Section
					============================== -->
                        <div class="acc-header-wraper">
              {if !$logged}
							<div class="header-cart">
								<a href="#" class="header-wishlist" data-toggle="modal" data-target=".bd-example-modal-lg2">
									<i class="fa fa-sign-in" aria-hidden="true" data-toggle="tooltip" data-placement="left" title="{$_SIGN_IN}"></i>
								</a>
								<span class="header-wishlist">|</span>
								<a class="header-wishlist" href="{$HOST}signup">
									<i class="fa fa-user-plus" aria-hidden="true" data-toggle="tooltip" data-placement="left" title="{$_SIGN_UP}"></i>
								</a>
								<span class="header-wishlist">|</span>
							    <span id="cart-list">
								  <div class="dropdown wd-compare-btn">
								  <button class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								      <div class="header-wishlist">
								          <i class="fa fa-shopping-cart" aria-hidden="true"></i>
								      </div>
								  </button>
								  <span class="count">{count($smarty.session.cart)}</span>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2" x-placement="top-end" style="position: absolute; transform: translate3d(-203px, -91px, 0px); top: 0px; left: 0px; will-change: transform;">
                        {if !isset($smarty.session.cart)}
									 <div class="media med-fix">
										  <div class="media-body text-center">
										      <h5> <i class="fa fa-times icon-big"></i> {$_EMPTY_CART}</h5><hr>
										  </div>
									 </div>
						{else}
									 <div class="media med-fix">
										  <div class="media-body med-title text-center">
										      <h5>
										           {strtoupper($_TOTAL)} : {do_amount($smarty.session.cart_total)}
										           <button onclick="EmptyCart()" class="fa fa-trash-o icon-big" data-toggle="tooltip" data-placement="right" title="{$_EMPTY_CART}"></button>
										      </h5><hr>
										  </div>
									 </div>
								  	<div class="wd-item-list">

						  {foreach from=$smarty.session.cart item=foo}
							<div class="media med-fix">
							    <img class="d-flex mr-3 cart-icon" src="{$foo['icon_img']}" alt="cart-img" height="50" width="50">
							    <div class="media-body">
							        <h6 class="mt-0 list-group-title">{$foo['name']}</h6>
							        <div class="red-color"><small> {$foo['qty']} x {do_amount($foo['price_per_unit'])}<b class="black-color"> | {do_amount($foo['total'])}</b></small>
									</div>
							    </div>
							 </div>
                         {/foreach}

									</div>
								  	<div class="media med-fix text-center">
										<a href="{$HOST}checkout" class="btn btn-primary go-compare-page">{$_CHECKOUT}
										<i class="fa fa-check-circle" aria-hidden="true"></i></a>
									</div>
                        {/if}
									
								  </div>
								</div>
							    </span>
						 </div>
						    <div class="account-section">
								<div class="login-quick-modal modal fade bd-example-modal-lg2" tabindex="-1" role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="container">
												<div class="row text-left">
													<div class="col-md-12 p0">
																<div class="row">
																	<div class="col-md-6 p0 brand-description-area description-background">
																		<div class="brand-description">
																		    <div class="brand-logo">
																				<img src="{do_config(21)}" alt="{do_config(0)}">
																			</div>
																			<div class="modal-description">
																				<p class="username-profile">{do_config(0)} {$_LOGIN}</p>
																			</div>
																			<ul class="list-unstyled">
																				<li class="media">
																					<i class="fa fa-check username-profile" aria-hidden="true"></i>
																					<div class="media-body">
																					    <p class="username-profile">{$_PURCHASE_ITEMS}</p>
																					</div>
																				</li>
																				<li class="media my-4">
																					<i class="fa fa-check username-profile" aria-hidden="true"></i>
																					<div class="media-body">
																					    <p class="username-profile">{$_POST_REVIEWS}</p>
																					</div>
																				</li>
																				<li class="media">
																					<i class="fa fa-check username-profile" aria-hidden="true"></i>
																					<div class="media-body">
																					    <p class="username-profile">{$_POST_COMMENTS}</p>
																					</div>
																				</li>
																			</ul>
																		</div>
																	</div>
																	<div class="col-md-12 col-lg-6 p0">
																		<div class="login-section">
																			<div class="login-form text-left">
																				<form action="{$HOST}signin" method="POST">
																				<input type="hidden" name="login" value="login" />
																				<input type="hidden" name="csrf" value="{$csrfToken}" />
																				<div class="form-group">
																					    <label for="username">{$_USERNAME} *</label>
																						<input type="text" name="username" class="form-control" placeholder="{$_USERNAME}">
																					</div>
																					<div class="form-group">
																						<label for="password">{$_PASSWORD} *</label>
																						<input type="password" name="password" class="form-control" placeholder="{$_PASSWORD}" autocomplete>
																					</div>
																		{if do_config(27) == 1}
																					<div class="form-group">
																					    <label for="recaptcha">{$_PROVE_YOUR_HUMAN}</label>
																						   <div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{do_config(4)}"></div>
																					</div>
																		{/if}
																					<div class="form-group">
																					    <label class="checkbox-container"><small>{$_REMEMBER_ME}</small>
																					       <input type="checkbox" name="remember_me" value="on" checked>
																					       <span class="checkmark"></span>
																                        </label>
																					</div>
																					<button type="submit" class="btn btn-primary wd-login-btn">{$_SIGN_IN}</button><hr>
																					<div class="wd-policy">
																					  <p>{$_NO_ACCOUNT} <a href="{$HOST}signup" class="black-color"><strong><u>{$_SIGN_UP}</u></strong></a></p>
																					</div>
																				</form>
																			</div>
																		</div>
																	</div>
																</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
              {else}
						<!-- =========================
							 Cart Out 
						============================== -->
						
							<div class="header-cart">
							    <span id="cart-list">
								<div class="dropdown wd-compare-btn">
								  <button class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								      <div class="header-wishlist">
								          <i class="fa fa-shopping-cart" aria-hidden="true"></i>
								      </div>
								  </button>
								  <span class="count">{count($smarty.session.cart)}</span>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2" x-placement="top-end" style="position: absolute; transform: translate3d(-203px, -91px, 0px); top: 0px; left: 0px; will-change: transform;">
                        {if !isset($smarty.session.cart)}
									 <div class="media med-fix">
										  <div class="media-body text-center">
										      <h5> <i class="fa fa-times icon-big"></i> {$_EMPTY_CART}</h5><hr>
										  </div>
									 </div>
						{else}
									 <div class="media med-fix">
										  <div class="media-body med-title text-center">
										      <h5>
										           {strtoupper($_TOTAL)} : {do_amount($smarty.session.cart_total)}
										           <button onclick="EmptyCart()" class="fa fa-trash-o icon-big" data-toggle="tooltip" data-placement="right" title="{$_EMPTY_CART}"></button>
										      </h5><hr>
										  </div>
									 </div>
								  	<div class="wd-item-list">

						  {foreach from=$smarty.session.cart item=foo}
							<div class="media med-fix">
							    <img class="d-flex mr-3 cart-icon" src="{$foo['icon_img']}" alt="cart-img" height="50" width="50">
							    <div class="media-body">
							        <h6 class="mt-0 list-group-title">{$foo['name']}</h6>
							        <div class="red-color"><small> {$foo['qty']} x {do_amount($foo['price_per_unit'])}<b class="black-color"> | {do_amount($foo['total'])}</b></small>
									</div>
							    </div>
							 </div>
                         {/foreach}

									</div>
								  	<div class="media med-fix text-center">
										<a href="{$HOST}checkout" class="btn btn-primary go-compare-page">{$_CHECKOUT}
										<i class="fa fa-check-circle" aria-hidden="true"></i></a>
									</div>
                        {/if}
									
								  </div>
								</div>
							</span>
								<a class="header-wishlist"></a>
								<a class="header-wishlist" href="{$USR}dashboard">
									<i class="fa fa-wrench" aria-hidden="true"></i>
								</a>
								<div class="dropdown wd-compare-btn">
								  <button class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<div class="header-wishlist">
									<i class="fa fa-user mob-size" aria-hidden="true"></i>
								</div>
                                 </button>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
									  	<div class="media med-fix">
										  <div class="media-body text-center">
										      <span>
										          <img src="{$UPD}images/avatar.svg" width="40" height="40" alt="{$username}">
										          <span class="username-profile">{$username}</span>
										      </span>
										      <div class="empty-h"></div>
										  </div>
										</div>
								  	<div class="media med-fix text-center">
										<a href="{$USR}dashboard" class="btn btn-primary go-compare-page"><i class="fa fa-wrench" aria-hidden="true" style="font-size: 16px;"></i> {$_DASHBOARD} </a>
									</div>
								  </div>
								</div>
								<div class="dropdown wd-compare-btn">
								  <button class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<div class="header-wishlist">
									<i class="fa fa-bank mob-size" aria-hidden="true"></i>
								</div>
                                 </button>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
									  	<div class="media med-fix">
										  <div class="media-body text-center">
										          <h5> {strtoupper($_BALANCE)}</h5>
                                            <hr>
                                            <div class="balance-display" style="font-size: 25px;font-weight: 700;font-style: normal;color: #559a38;font-family: Roboto;">{$balance}</div>
										  </div>
										</div>
								  	<div class="media med-fix text-center">
										<a href="{$USR}deposit" class="btn btn-primary go-compare-page"><i class="fa fa-arrow-down" aria-hidden="true" style="font-size: 16px;"></i> {$_DEPOSIT} 
										</a>
									</div>
								  </div>
								</div>								
								<div class="dropdown wd-compare-btn">
								  <button onClick = "ReadAll()" class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								      <div class="header-wishlist">
								          <i class="fa fa-bell" aria-hidden="true"></i>
								      </div>
								  </button>
								  <span class="count" id="read-notidications">{$notifications_num}</span>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                        {if !$notifications}
									 <div class="media">
										  <div class="media-body text-center">
										      <h5> <i class="fa fa-times icon-big"></i> {$_NO_NOTIFICATIONS}</h5><hr>
										  </div>
									 </div>
						{else}
									 <div class="media med-fix">
										  <div class="media-body med-title text-center">
										      <h5>{$_NOTIFICATIONS}</h5><hr>
										  </div>
									 </div>
								  	<div class="wd-item-list text-center">
                            {foreach from=$notifications item=foo}
									  	<div class="media">
									  	    <span class="d-flex notification-icon n-icon">
									  	        {if $foo['type'] == 'order'}
									  	           <i class="fa fa-shopping-cart mob-size"></i>
									  	        {elseif $foo['type'] == 'deposit'}
									  	           <i class="fa fa-bank mob-size"></i>
									  	        {elseif $foo['type'] == 'support'}
									  	           <i class="fa fa-envelope mob-size"></i>
									  	        {/if}
									  	    </span>
											<div class="media-body">
										{if $foo['type'] == 'order'}
                                           <h6 class="mt-0 list-group-title"> {$_ORDER_PURCHASED}</h6>
                                        {elseif $foo['type'] == 'deposit'}
                                           <h6 class="mt-0 list-group-title">{$foo['amount']} {$_WAS_CREDITED}</h6>
                                        {elseif $foo['type'] == 'support'}
                                           <h6 class="mt-0 list-group-title"> {$_NEW_REPLY}</h6>
                                        {/if}
												
											</div>
										</div>
                            {/foreach}

									</div>
								  	<div class="media med-fix text-center">
										<a href="{$USR}statement" class="btn btn-primary go-compare-page">{$_ALL_ACTIVITES}
										<i class="fa fa-arrow-right" aria-hidden="true"></i></a>
									</div>
						{/if}
								  </div>
								</div>
								<a class="header-wishlist"></a>
								<a class="header-wishlist" href="{$HOST}signout">
									<i class="fa fa-sign-out" aria-hidden="true" data-toggle="tooltip" data-placement="left" title="{$_SIGN_OUT}"></i>
								</a>
							</div>
              {/if}
				    </div>
                </div>
			</div>
		</div>
	    </section>
	</div>
    <div class="on-phone">
        <section id="wd-header-2" class="wd-header-nav sticker-nav mob-sticky bg-orange">
		<div class="container-fluid custom-width">
			<div class="row">
                <div class="col-md-8 col-2 col-sm-6 col-md-4 d-block">
                    <div class="accordion-wrapper hide-sm-up">
                        <span class="mobile-open white-color"><i class="fa fa-bars"></i></span>
                        <!--Mobile Menu start-->
                        <ul id="mobilemenu" class="accordion">
                            <li><a class="closeme black-color" href="#"><i class="fa fa-times"></i></a></li>
                            <li><div class="link"><a href="{$HOST}">{strtoupper($_HOME)}</a></div></li>
                            <li><div class="link"><a href="{$HOST}contact">{strtoupper($_CONTACT)}</a></div></li>
                            {foreach from=$categories item=foo}
                                        <li class="out-link"><a href="{$CAT}{$foo['link']}" class="">
                                            {$foo['name']}</a>
                                        </li>
                            {/foreach}
                        </ul>
                        <!--Mobile Menu end-->
                    </div>
                </div><!--Mobile menu end-->
                <div class="col-md-8 col-10">
              {if !$logged}
							<div class="header-cart">
								<a class="header-wishlist" href="{$HOST}signin">
									<i class="fa fa-sign-in mob-size" aria-hidden="true" data-toggle="tooltip" data-placement="left" title="{$_SIGN_IN}"></i>
								</a>
								<span class="header-wishlist">|</span>
								<a class="header-wishlist" href="{$HOST}signup">
									<i class="fa fa-user-plus mob-size" aria-hidden="true" data-toggle="tooltip" data-placement="left" title="{$_SIGN_UP}"></i>
								</a>
								<span class="header-wishlist">|</span>
							    <span id="cart-list-mobile">
								  <div class="dropdown wd-compare-btn">
								  <button class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								      <div class="header-wishlist">
								          <i class="fa fa-shopping-cart mob-size" aria-hidden="true"></i>
								      </div>
								  </button>
								  <span class="count">{count($smarty.session.cart)}</span>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2" x-placement="top-end" style="position: absolute; transform: translate3d(-203px, -91px, 0px); top: 0px; left: 0px; will-change: transform;">
                        {if !isset($smarty.session.cart)}
									 <div class="media med-fix">
										  <div class="media-body text-center">
										      <h5> <i class="fa fa-times icon-big"></i> {$_EMPTY_CART}</h5><hr>
										  </div>
									 </div>
						{else}
									 <div class="media med-fix">
										  <div class="media-body med-title text-center">
										      <h5>
										          {strtoupper($_TOTAL)} : {do_amount($smarty.session.cart_total)}
										           <button onclick="EmptyCart()" class="fa fa-trash-o icon-big" data-toggle="tooltip" data-placement="right" title="{$_EMPTY_CART}"></button>
										      </h5><hr>
										  </div>
									 </div>
								  	<div class="wd-item-list">

						  {foreach from=$smarty.session.cart item=foo}
							<div class="media med-fix">
							    <img class="d-flex mr-3 cart-icon" src="{$foo['icon_img']}" alt="cart-img" height="50" width="50">
							    <div class="media-body">
							        <h6 class="mt-0 list-group-title">{$foo['name']}</h6>
							        <div class="red-color"><small> {$foo['qty']} x {do_amount($foo['price_per_unit'])}<b class="black-color"> | {do_amount($foo['total'])}</b></small>
									</div>
							    </div>
							 </div>
                         {/foreach}

									</div>
								  	<div class="media med-fix text-center">
										<a href="{$HOST}checkout" class="btn btn-primary go-compare-page">{$_CHECKOUT}
										<i class="fa fa-check-circle" aria-hidden="true"></i></a>
									</div>
                        {/if}
									
								  </div>
								</div>
							    </span>
							</div>
              {else}
							<div class="header-cart">
								<a class="header-wishlist" href="{$USR}dashboard">
									<i class="fa fa-wrench mob-size" aria-hidden="true"></i>
								</a>
							    <span id="cart-list-mobile">
								  <div class="dropdown wd-compare-btn">
								  <button class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								      <div class="header-wishlist">
								          <i class="fa fa-shopping-cart mob-size" aria-hidden="true"></i>
								      </div>
								  </button>
								  <span class="count">{count($smarty.session.cart)}</span>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2" x-placement="top-end" style="position: absolute; transform: translate3d(-203px, -91px, 0px); top: 0px; left: 0px; will-change: transform;">
                        {if !isset($smarty.session.cart)}
									 <div class="media med-fix">
										  <div class="media-body text-center">
										      <h5> <i class="fa fa-times icon-big"></i> {$_EMPTY_CART}</h5><hr>
										  </div>
									 </div>
						{else}
									 <div class="media med-fix">
										  <div class="media-body med-title text-center">
										      <h5>
										           {strtoupper($_TOTAL)} : {do_amount($smarty.session.cart_total)}
										           <button onclick="EmptyCart()" class="fa fa-trash-o icon-big" data-toggle="tooltip" data-placement="right" title="{$_EMPTY_CART}"></button>
										      </h5><hr>
										  </div>
									 </div>
								  	<div class="wd-item-list">

						  {foreach from=$smarty.session.cart item=foo}
							<div class="media med-fix">
							    <img class="d-flex mr-3 cart-icon" src="{$foo['icon_img']}" alt="cart-img" height="50" width="50">
							    <div class="media-body">
							        <h6 class="mt-0 list-group-title">{$foo['name']}</h6>
							        <div class="red-color"><small> {$foo['qty']} x {do_amount($foo['price_per_unit'])}<b class="black-color"> | {do_amount($foo['total'])}</b></small>
									</div>
							    </div>
							 </div>
                         {/foreach}

									</div>
								  	<div class="media med-fix text-center">
										<a href="{$HOST}checkout" class="btn btn-primary go-compare-page">{$_CHECKOUT}
										<i class="fa fa-check-circle" aria-hidden="true"></i></a>
									</div>
                        {/if}
									
								  </div>
								</div>
							    </span>
								<a class="header-wishlist"></a>
								<div class="dropdown wd-compare-btn">
								  <button class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<div class="header-wishlist">
									<i class="fa fa-user mob-size" aria-hidden="true"></i>
								</div>
                                 </button>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
									  	<div class="media med-fix">
										  <div class="media-body text-center">
										      <span>
										          <img src="{$UPD}images/avatar.svg" width="40" height="40" alt="{$username}">
										          <span class="username-profile">{$username}</span>
										      </span>
										      <div class="empty-h"></div>
										  </div>
										</div>
								  	<div class="media med-fix text-center">
										<a href="{$USR}dashboard" class="btn btn-primary go-compare-page"><i class="fa fa-wrench" aria-hidden="true" style="font-size: 16px;"></i> {$_DASHBOARD} </a>
									</div>
								  </div>
								</div>
								<div class="dropdown wd-compare-btn">
								  <button class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<div class="header-wishlist">
									<i class="fa fa-bank mob-size" aria-hidden="true"></i>
								</div>
                                 </button>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
									  	<div class="media med-fix">
										  <div class="media-body text-center">
										          <h5> {strtoupper($_BALANCE)}</h5>
                                            <hr>
                                            <div style="font-size: 25px;font-weight: 700;font-style: normal;color: #559a38;font-family: Roboto;">{$balance}</div>
										  </div>
										</div>
								  	<div class="media med-fix text-center">
										<a href="{$USR}deposit" class="btn btn-primary go-compare-page"><i class="fa fa-arrow-down" aria-hidden="true" style="font-size: 16px;"></i> {$_DEPOSIT} 
										</a>
									</div>
								  </div>
								</div>
								<div class="dropdown wd-compare-btn">
								  <button onClick = "ReadAll()" class="btn btn-secondary dropdown-toggle compare-btn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								      <div class="header-wishlist">
								          <i class="fa fa-bell mob-size" aria-hidden="true"></i>
								      </div>
								  </button>
								  <span class="count" id="read-notidications">{$notifications_num}</span>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                        {if !$notifications}
									 <div class="media">
										  <div class="media-body text-center">
										      <h5> <i class="fa fa-times icon-big"></i> {$_NO_NOTIFICATIONS}</h5><hr>
										  </div>
									 </div>
						{else}
									 <div class="media med-fix">
										  <div class="media-body med-title text-center">
										      <h5>{$_NOTIFICATIONS}</h5><hr>
										  </div>
									 </div>
								  	<div class="wd-item-list text-center">
                            {foreach from=$notifications item=foo}
									  	<div class="media">
									  	    <span class="d-flex notification-icon n-icon">
									  	        {if $foo['type'] == 'order'}
									  	           <i class="fa fa-shopping-cart mob-size"></i>
									  	        {elseif $foo['type'] == 'deposit'}
									  	           <i class="fa fa-bank mob-size"></i>
									  	        {elseif $foo['type'] == 'support'}
									  	           <i class="fa fa-envelope mob-size"></i>
									  	        {/if}
									  	    </span>
											<div class="media-body">
										{if $foo['type'] == 'order'}
                                           <h6 class="mt-0 list-group-title"> {$_ORDER_PURCHASED}</h6>
                                        {elseif $foo['type'] == 'deposit'}
                                           <h6 class="mt-0 list-group-title">{$foo['amount']} {$_WAS_CREDITED}</h6>
                                        {elseif $foo['type'] == 'support'}
                                           <h6 class="mt-0 list-group-title"> {$_NEW_REPLY}</h6>
                                        {/if}
												
											</div>
										</div>
                            {/foreach}

									</div>
								  	<div class="media med-fix text-center">
										<a href="{$USR}statement" class="btn btn-primary go-compare-page">{$_ALL_ACTIVITES}
										<i class="fa fa-arrow-right" aria-hidden="true"></i></a>
									</div>
						{/if}
								  </div>
								</div>
								<a class="header-wishlist"></a>
								<a class="header-wishlist" href="{$HOST}signout">
									<i class="fa fa-sign-out mob-size" aria-hidden="true" data-toggle="tooltip" data-placement="left" title="{$_SIGN_OUT}"></i>
								</a>
							</div>

              {/if}
                </div>
                
			</div>
		</div>
	</section>
	</div>