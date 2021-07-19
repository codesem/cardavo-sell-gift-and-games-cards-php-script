{include file="$TMP/Layout/header.tpl"}

    <!-- =========================
        Product Section
        ============================== -->
	{foreach from=$search item=foo}
    <div class="product-view-modal modal fade bd-example-modal-lg-product-{$foo['id']}" tabindex="-{$foo['id']}" aria-hidden="true">
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
                                <div id="product-view-model" class="product-view owl-carousel owl-theme">
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
									<p><span class="product-ratings-text">0 {$_RATINGS}</span></p>
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
        Slider Section
    ============================== -->
    <section id="main-slider-section" class="review-slider-section coupon-bc">
		<div class="container">
			<div class="review-search-slider-section row justify-content-center">
                <div class="col-12 col-lg-12">
                    <h1 class="review-slider-title">{$term}</h1>
                    <p class="review-slider-subtitle"><span class="badge badge-secondary">{$n_search_items} {$_PRODUCTS}</span></p>
                </div>
                <div class="col-12 col-lg-12 col-xl-12 slider-search-section sliderhome-search on-desktop">
                  <form action="{$HOST}search" method="GET">
                   <div class="input-group wd-btn-group header-search-option">
                        <input type="text" name="term" class="form-control" placeholder="{$_SEARCH_FOR_PRODUCTS}" aria-label="{$_SEARCH_FOR_PRODUCTS}" value="{$term}">
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
                        <input type="text" name="term" class="form-control" placeholder="{$_SEARCH_FOR_PRODUCTS}" aria-label="{$_SEARCH_FOR_PRODUCTS}" value="{$term}">
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

    <section id="product-amazon" class="product-shop-page product-shop-full-grid">
        <div class="container">
            <div class="row">
                <div class=" col-12 col-md-8 col-lg-9 product-grid">
                    <div class="row">
                        <div class="col-12">
                            <div class="filter row">
                                <div class="col-8 col-md-3">
                                    <h6 class="result">{$_SHOWING_ALL} <span class="badge badge-secondary">{$n_search_items}</span> {$_RESULTS}</h6>
                                </div>
                                
                                <div class="col-6 col-md-6 filter-btn-area text-center"></div>
                                <div class="col-4 col-md-3 sorting text-right"></div>
                            </div>
                        </div>
                        <div class="tab-content col-12">
	        {if !$search}
	            <div class="alert alert-warning"><i class="fa fa-warning"></i> {$_NO_RECORDS_WERE_FOUND}</div>
	        {/if}
                            <div class="on-desktop">
                                <div class="row">
	        {foreach from=$search item=foo}
                                    <div class="col-9 col-md-6 col-lg-4">
                                        <figure class="figure product-box row">
                                            <div class="col-9 col-md-9 col-lg-9 col-xl-9 p0">
                                                <div class="product-box-img">
                                                    <a href="{$foo['link']}">
                <img src="{$foo['icon_img']}" class="figure-img img-fluid" alt="{$foo['name']}">
            </a>
                                                </div>
                                                <div class="quick-view-btn">
                                                    <div class="compare-btn">
                                                        <button type="button" class="btn btn-primary btn-action btn-sm" data-toggle="modal" data-target=".bd-example-modal-lg-product-{$foo['id']}"><i class="fa fa-eye" aria-hidden="true"></i> {$_QUICK_VIEW}</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-9 col-md-9 col-lg-9 col-xl-9 p0">
                                                <div class="figure-caption text-center">
                                                    <div class="price-start">
                                                        <p><strong class="active-color">{$foo['price']}</strong></p>
                                                    </div>
                                                    <div class="content-excerpt">
                                                        <p>{$foo['name']}</p>
                                                    </div>
                                                    <div class="rating">
                                                         {str_repeat('<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>',{5 - $foo['stars']})}{str_repeat('<a href="#"><i class="fa fa-star star-active-color" aria-hidden="true"></i></a>',{$foo['stars']})}
                                                    </div>
                                                </div>
                                            </div>
                                        </figure>
                                    </div>
	        {/foreach}
                                </div>
                            </div>
                            <div class="on-phone">
				<div id="product-slider-exta" class="owl-carousel owl-theme">
                  {foreach from=$search item=foo}
	    			<div class="col-md-9">
						<figure class="figure product-box wow fadeIn animated" data-wow-delay="0ms">
							<div class="product-box-img">
								<a href="{$foo['link']}">
									<img src="{$foo['icon_img']}" class="figure-img img-fluid" alt="{$foo['name']}">
								</a>
							</div>
							<div class="quick-view-btn">
								<div class="compare-btn">
									<button type="button" class="btn btn-primary btn-action btn-sm" data-toggle="modal" data-target=".bd-example-modal-lg-product-2{$foo['id']}"><i class="fa fa-eye" aria-hidden="true"></i> {$_QUICK_VIEW}</button>
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
                        <div class="col-12 text-center">
                    {if $paging && $search}
					    <nav aria-label="navigation">
					        <ul class="pagination justify-content-center">{$paging}</ul>
					    </nav><br>
					{/if}
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-lg-3 ">
                    
                    <!-- =========================
                        Category 
                        ============================== -->
                        <div class="card category category-md">
                            <div class="card-header">
                                      <h5 class="title"><i class="fa fa-sitemap"></i> {$_CATEGORIES}</h5>
                            </div>
                            <div class="list-group">
                    {foreach from=$categories item=foo}
                               <a href="{$CAT}{$foo['link']}" class="list-group-item list-group-item-action"><i class="fa fa-angle-double-right" aria-hidden="true"></i> {$foo['name']}</a>
                    {/foreach}
                            </div>
                        </div>
                        <div class="empty-h"></div>
                        
                </div>         
            </div>
        </div>
    </section>
    
{include file="$TMP/Layout/footer.tpl"}
