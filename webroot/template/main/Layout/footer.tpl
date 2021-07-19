    <!-- =========================
        Footer Section
    ============================== -->
    <footer class="footer footer-2 wow fadeInUp animated" data-wow-delay="900ms">
    	<div class="container-fluid custom-width">
    		<div class="row">
    			<div class="col-md-12 col-lg-3">
    				<!-- ===========================
    						Footer About
    					 =========================== -->
    				<div class="footer-about">
    					<a href="{$HOST}" class="footer-about-logo">
    						<img src="{do_config(21)}" alt="{do_config(0)}">
    					</a>
	    				<div class="footer-description">
	    					<p>{do_config(8)}</p>
	    				</div>
	    				<div class="wb-social-media">
                        {if !empty(do_config(17))}
                            <a href="{do_config(17)}" class="fb" target="_blank">
                                <i class="fa fa-facebook"></i>
                            </a>
                        {/if}
                        {if !empty(do_config(19))}
                            <a href="{do_config(19)}" class="tr" target="_blank">
                                <i class="fa fa-twitter"></i>
                            </a>
                        {/if}
                        {if !empty(do_config(18))}
                            <a href="{do_config(18)}" class="yt" target="_blank">
                                <i class="fa fa-pinterest"></i>
                            </a>
                        {/if}
					</div>
    				</div>
    			</div>
    			<div class="col-6 col-md-3 col-lg-2 footer-nav">
    				<!-- ===========================
    						Festival Deals
    					 =========================== -->
    				<h6 class="footer-subtitle">{$_PAGES}</h6>
    				<ul>
    					<li><a href="{$HOST}">{$_HOME}</a></li>
    					<li><a href="{$HOST}signup">{$_SIGN_UP}</a></li>
    					<li><a href="{$HOST}signin">{$_SIGN_IN}</a></li>
    				</ul>
    			</div>
    			<div class="col-6 col-md-3 col-lg-3 footer-nav">
    				<!-- ===========================
    						Categories
    					 =========================== -->
    				<div class="stores-list">
	    				<h6 class="footer-subtitle">{$_CATEGORIES}</h6>
	    				<ul>
                    {foreach from=$categories item=foo}
                            <li><a href="{$CAT}{$foo['link']}">{$foo['name']}</a></li>
                    {/foreach}
	    				</ul>
    				</div>
    			</div>
    			<div class="col-6 col-md-3 col-lg-2 footer-nav">
    				<!-- ===========================
    						Need Help ?
    					 =========================== -->
    				<h6 class="footer-subtitle">{$__SUPPORT}</h6>
    				<ul>
    					<li><a href="{$HOST}page/about-us/">{$_ABOUT_US}</a></li>
    					<li><a href="{$HOST}page/faqs/">{$_FAQS}</a></li>
    					<li><a href="{$HOST}contact">{$_CONTACT}</a></li>
    				</ul>
    			</div>
    			<div class="col-6 col-md-3 col-lg-2 footer-nav">
    				<!-- ===========================
    						About
    					 =========================== -->
    				<h6 class="footer-subtitle">{$_ABOUT}</h6>
	    				<ul>
	    				    <li><a href="{$HOST}page/privacy-policy/">{$_PRIVACY_POLICY}</a></li>
	    				    <li><a href="{$HOST}page/terms-conditions/">{$_TERMS_CONDITIONS}</a></li>
	    				    <li><a href="{$HOST}page/order-return/">{$_ORDER_RETURN}</a></li>
	    				</ul>
    			</div>
    		</div>
    	</div>
    </footer>
    <!-- =========================
        Copyright Section
    ============================== -->
    <section class="copyright wow fadeInUp animated" data-wow-delay="900ms">
	    <div class="container">
	    	<div class="row">
	    		<div class="col-md-6">
	    			<div class="copyright-text">
	    				<p class="text-uppercase">{$_COPYRIGHT} &copy; {$date} <a class="active-color" href="{$HOST}"><b>{do_config(0)}</b></a></p>
	    			</div>
	    		</div>
	    		<div class="col-md-6">
	    			<div class="brand-logo d-flex justify-content-start">
		    				<img src="{$AST}custom/img/social-media-img/paypal-brand.png" class="img-fluid" width="56" height="35" alt="Brand Logo">
		    				<img src="{$AST}custom/img/social-media-img/coinbase-brand.png" class="img-fluid" width="56" height="35" alt="Brand Logo">
		    				<img src="{$AST}custom/img/social-media-img/visa-brand.png" class="img-fluid" width="56" height="35" alt="Brand Logo">
		    				<img src="{$AST}custom/img/social-media-img/mastercard-brand.png" class="img-fluid" width="56" height="35" alt="Brand Logo">
	    			</div>
	    		</div>
	    	</div>
	    </div>
	</section>

    <!-- =========================
    	AJAX CALLS
    ============================== -->
    {include file="$TMP/Ajax/index.js.tpl"}

    <!-- =========================
    	Main Loding JS Script
    ============================== -->
    <script src="{$AST}custom/js/jquery.min.js"></script>
    <script src="{$AST}custom/js/jquery-ui.js"></script>
    <script src="{$AST}custom/js/popper.js"></script>
    <script src="{$AST}custom/js/bootstrap.min.js"></script>
    <script src="{$AST}custom/js/jquery.counterup.min.js"></script>
    <script src="{$AST}custom/js/jquery.nav.js"></script>
    <script src="{$AST}custom/js/jquery.nicescroll.js"></script>
    <script src="{$AST}custom/js/jquery.rateyo.js"></script>
    <script src="{$AST}custom/js/jquery.scrollUp.min.js"></script>
    <script src="{$AST}custom/js/jquery.sticky.js"></script>
    <script src="{$AST}custom/js/mobile.js"></script>
    <script src="{$AST}custom/js/lightslider.min.js"></script>
    <script src="{$AST}custom/js/owl.carousel.min.js"></script>
    <script src="{$AST}custom/js/circle-progress.min.js"></script>
    <script src="{$AST}custom/js/waypoints.min.js"></script>
    <script src="{$AST}custom/js/simplePlayer.js"></script>
    <script src="{$AST}custom/js/main.js"></script>
  </body>
</html>