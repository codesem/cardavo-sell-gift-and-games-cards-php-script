{include file="$TMP/Layout/header.tpl"}

    <!-- =========================
        Slider Section
    ============================== -->
    <section id="main-slider-section" class="review-slider-section coupon-bc">
		<div class="container">
			<div class="review-search-slider-section row justify-content-center">
                <div class="col-12 col-lg-12">
                    <h1 class="review-slider-title">{do_config(1)}</h1>
                    <p class="review-slider-subtitle"> 
                          | {foreach from=$categories item=foo}
                                 {$foo['name']} |
                            {/foreach}
                    </p>
                </div>
                <div class="col-12 col-lg-12 col-xl-12 slider-search-section sliderhome-search on-desktop">
                  <form action="{$HOST}search" method="GET">
                   <div class="input-group wd-btn-group header-search-option">
                        <input type="text" name="term" class="form-control" placeholder="{$_SEARCH_FOR_PRODUCTS}" aria-label="{$_SEARCH_FOR_PRODUCTS}">
                        <span class="input-group-btn">
                            <button type="submit" class="btn btn-secondary wd-btn-search">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </form>
                </div>
                <div class="col-12 col-lg-12 col-xl-12 on-phone">
                  <form action="{$HOST}search" method="GET">
                   <div class="input-group wd-btn-group header-search-option">
                        <input type="text" name="term" class="form-control" placeholder="{$_SEARCH_FOR_PRODUCTS}" aria-label="{$_SEARCH_FOR_PRODUCTS}">
                        <span class="input-group-btn">
                            <button type="submit" class="btn btn-secondary wd-btn-search">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </form>
                </div>
			</div>
		</div>
    </section>

    <!-- =========================
        Details Section
    ============================== -->
    <div class="on-desktop">
    <section id="details">
    	<div class="container-fluid custom-width">
    		<div class="row wow fadeInLeft animated justify-content-center" data-wow-delay="600ms">
    			<div class="col-10 col-sm-8 col-lg-3 details-box">
    				<div class="row">
    					<div class="col-sm-3 p0 text-center">
    						<div class="details-img">
    							<img class="img-fluid main-hover-icon-compare" src="{$AST}custom/img/details-img/pick-icon.png" alt="pick-icon">
    							<img class="img-fluid hover-icon-compare" src="{$AST}custom/img/details-img/pick-icon.png" alt="pick-icon">
    						</div>
    					</div>
    					<div class="col-sm-9 p0 details-description">
	    					<h6 class="details-title">{$_PICK_PRODUCT}</h6>
	    					<p>{$__PICK_PRODUCT}</p>
    					</div>
    				</div>
					<div class="arow">
						<img src="{$AST}custom/img/details-img/angle2.png" alt="k">
					</div>
    			</div>
    			<div class="col-10 col-sm-8 col-lg-3 details-box">
    				<div class="row">
    					<div class="col-sm-3 p0 text-center">
    						<div class="details-img">
    							<img class="img-fluid main-hover-icon-compare" src="{$AST}custom/img/details-img/qty-icon.png" alt="qty-icon">
    							<img class="img-fluid hover-icon-compare" src="{$AST}custom/img/details-img/qty-icon.png" alt="qty-icon">
	    					</div>
    					</div>
    					<div class="col-sm-9 p0 details-description">
	    					<h6 class="details-title">{$_CHOOSE_AMOUNT}</h6>
	    					<p>{$__CHOOSE_AMOUNT}</p>
    					</div>
    				</div>
					<div class="arow">
						<img src="{$AST}custom/img/details-img/angle2.png" alt="k">
					</div>
    			</div>
    			<div class="col-10 col-sm-8 col-lg-3 details-box">
    				<div class="row">
    					<div class="col-sm-3 p0 text-center">
    						<div class="details-img">
    							<img class="img-fluid main-hover-icon-vendor" src="{$AST}custom/img/details-img/checkout-icon.png" alt="checkout-icon">
    							<img class="img-fluid hover-icon-vendor" src="{$AST}custom/img/details-img/checkout-icon.png" alt="checkout-icon">
	    					</div>
    					</div>
    					<div class="col-sm-9 p0 details-description">
	    					<h6 class="details-title">{$_CHECKOUT}</h6>
	    					<p>{$__CHECKOUT}</p>
    					</div>
    				</div>
					<div class="arow">
						<img src="{$AST}custom/img/details-img/angle2.png" width="50" alt="j">
					</div>
					<div class="arow">
						<img src="{$AST}custom/img/details-img/angle2.png" width="35" alt="j">
					</div>
    			</div>
    			<div class="col-10 col-sm-8 col-lg-3 details-box details-active">
    				<div class="text-center">
    					<img class="img-fluid" src="{$AST}custom/img/details-img/gift-icon.png" alt="gift-icon">
    					<h3 class="details-active-title">{$_ENJOY_PRODUCT}!</h3>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
    </div>

    <!-- =========================
        Trending Section
    ============================== -->
    <section id="trending">
    	<div class="container-fluid custom-width">
    		<div class="row">
    			<div class="col-md-12">
    				<div class="section-title-center text-left">
    					<h2 class="title"><i class="fa fa-fire"></i> {$_HOT_PRODUCTS}</h2>
    				</div>
    			</div>
				<div id="product-trending-two" class="owl-carousel owl-theme">
                  {foreach from=$hot_products item=foo}
	    			<div class="col-md-9">
						<figure class="figure product-box">
							<div class="product-box-img">
                                <a href="{$foo['link']}">
                                    <img src="{$foo['icon_img']}"  class="figure-img img-fluid" alt="{$foo['name']}">
                                </a>
							</div>
							<div class="quick-view-btn">
								<div class="compare-btn">
									<button type="button" class="btn btn-primary btn-action btn-sm" data-toggle="modal" data-target=".bd-example-modal-lg-product-1{$foo['id']}"><i class="fa fa-eye" aria-hidden="true"></i> Quick view</button>
								</div>
							</div>
							<figcaption class="figure-caption text-center">
								<div class="price-start">
									<p><strong class="active-color">{$foo['price']}</strong></p>
								</div>
								<div class="content-excerpt">
									<p>{$foo['name']}</p>
								</div>
								<div class="rating">
                                    {str_repeat('<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>',{5 - $foo['stars']})}{str_repeat('<a href="#"><i class="fa fa-star star-active-color" aria-hidden="true"></i></a>',{$foo['stars']})}
								</div>
							</figcaption>
						</figure>
	    			</div>
	    		  {/foreach}
				</div>
    		</div>
    	</div>
    </section>

  {foreach from=$hot_products item=foo}
	<div class="product-view-modal modal fade bd-example-modal-lg-product-1{$foo['id']}" tabindex="-1{$foo['id']}" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">

		    <!-- ====================================
		        Product Details Gallery Section
		    ========================================= -->
			<div class="row">
			    <div class="product-gallery col-12 col-md-12 col-lg-6">
			        <!-- ====================================
				        Single Product Gallery Section
				    ========================================= -->
				    <div class="row">
				        <div class="col-md-12 product-slier-details">
				            <div id="product-view" class="product-view owl-carousel owl-theme">
				                <div class="item">
							    	<img src="{$foo['icon_img']}" class="img-fluid" alt="{$foo['name']}">
							    </div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-6 col-12 col-md-12 col-lg-6">
					<div class="product-details-gallery">
						<div class="list-group">
							<h4 class="list-group-item-heading product-title">
								{$foo['name']}
							</h4>
							<div class="media">
								<div class="media-left media-middle">
									<div class="rating">
                                    {str_repeat('<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>',{5 - $foo['stars']})}{str_repeat('<a href="#"><i class="fa fa-star star-active-color" aria-hidden="true"></i></a>',{$foo['stars']})}
									</div>
								</div>
								<div class="media-body">
									<p><span class="product-ratings-text">{$foo['rating']} {$_RATINGS}</span></p>
								</div>
							</div>
						</div>
						<div class="list-group content-list">
							<p><i class="fa fa-check-circle-o" aria-hidden="true"></i> {$_VERIFIED_PRODUCT}</p>
							<p><i class="fa fa-check-circle-o" aria-hidden="true"></i> {$_LOWEST_PRICE_GUARANTEED}</p> 
							<p><i class="fa fa-check-circle-o" aria-hidden="true"></i> {$_PRICE_BETWEEN} {$foo['price']}</p> 
						</div>
					</div>
					<div class="product-store row">
					    <div class="col-12 product-store-box">
					        <div class="row">
					            <div class="col-8 store-border-img">
					                <img src="{$AST}custom/img/verified.svg" width="170" height="40" alt="verified" title="verified">	
					            </div>
								<div class="col-4 store-border-button">
								    <a href="{$foo['link']}" class="btn btn-primary wd-shop-btn pull-right">
								        {$_BUY_NOW}
								    </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
  {/foreach}


  {foreach from=$new_products item=foo}
	<div class="product-view-modal modal fade bd-example-modal-lg-product-2{$foo['id']}" tabindex="-2{$foo['id']}" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">

		    <!-- ====================================
		        Product Details Gallery Section
		    ========================================= -->
			<div class="row">
				<div class="product-gallery col-12 col-md-12 col-lg-6">
				    <!-- ====================================
				        Single Product Gallery Section
				    ========================================= -->
				    <div class="row">
						<div class="col-md-12 product-slier-details">
							<div id="product-view" class="product-view owl-carousel owl-theme">
							    <div class="item">
							    	<img src="{$foo['icon_img']}" class="img-fluid" alt="{$foo['name']}">
							    </div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-6 col-12 col-md-12 col-lg-6">
					<div class="product-details-gallery">
						<div class="list-group">
							<h4 class="list-group-item-heading product-title">
								{$foo['name']}
							</h4>
							<div class="media">
								<div class="media-left media-middle">
									<div class="rating">
                                    {str_repeat('<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>',{5 - $foo['stars']})}{str_repeat('<a href="#"><i class="fa fa-star star-active-color" aria-hidden="true"></i></a>',{$foo['stars']})}
									</div>
								</div>
								<div class="media-body">
									<p><span class="product-ratings-text">{$foo['rating']} {$_RATINGS}</span></p>
								</div>
							</div>
						</div>
						<div class="list-group content-list">
							<p><i class="fa fa-check-circle-o" aria-hidden="true"></i> {$_VERIFIED_PRODUCT}</p>
							<p><i class="fa fa-check-circle-o" aria-hidden="true"></i> {$_LOWEST_PRICE_GUARANTEED}</p> 
							<p><i class="fa fa-check-circle-o" aria-hidden="true"></i> {$_PRICE_BETWEEN} {$foo['price']}</p> 
						</div>
					</div>
					<div class="product-store row">
						<div class="col-12 product-store-box">
							<div class="row">
								<div class="col-8 store-border-img">
					                <img src="{$AST}custom/img/verified.svg" width="170" height="40" alt="verified" title="verified">	
								</div>
								<div class="col-4 store-border-button">
									<a href="{$foo['link']}" class="btn btn-primary wd-shop-btn pull-right">
										{$_BUY_NOW}
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
  {/foreach}

    <!-- =========================
        Extra Product Section
    ============================== -->
    <section id="product-amazon">
    	<div class="container">
    		<div class="row">

    			<div class="col-md-12">
    				<div class="section-title-center text-left">
    					<h2 class="title pl-0"><i class="fa fa-plus"></i> {$_NEW_PRODUCTS}</h2>
    				</div>
    			</div>
				<div id="product-slider-exta" class="owl-carousel owl-theme">
                  {foreach from=$new_products item=foo}
	    			<div class="col-md-9">
						<figure class="figure product-box wow fadeIn animated" data-wow-delay="0ms">
							<div class="product-box-img">
								<a href="{$foo['link']}">
									<img src="{$foo['icon_img']}" class="figure-img img-fluid" alt="{$foo['name']}">
								</a>
							</div>
							<div class="quick-view-btn">
								<div class="compare-btn">
									<button type="button" class="btn btn-primary btn-action btn-sm" data-toggle="modal" data-target=".bd-example-modal-lg-product-2{$foo['id']}"><i class="fa fa-eye" aria-hidden="true"></i> Quick view</button>
								</div>
							</div>
							<figcaption class="figure-caption text-center">
								<div class="price-start">
									<p><strong class="active-color">{$foo['price']}</strong></p>
								</div>
								<div class="content-excerpt">
									<p><a href="{$foo['link']}">{$foo['name']}</a></p>
								</div>
								<div class="rating">
                                    {str_repeat('<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>',{5 - $foo['stars']})}{str_repeat('<a href="#"><i class="fa fa-star star-active-color" aria-hidden="true"></i></a>',{$foo['stars']})}
								</div>
							</figcaption>
						</figure>
	    			</div>
	    		  {/foreach}
				</div>
    		</div>
    	</div>
    </section>
 
{include file="$TMP/Layout/footer.tpl"}