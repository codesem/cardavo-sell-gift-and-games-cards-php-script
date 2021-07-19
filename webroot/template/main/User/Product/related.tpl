            {if $related}
				<section id="product-amazon">
				    <div class="row product-amazon">
				        <div class="col-md-12">
				            <div class="section-title-center text-left">
				                <h2 class="title"><i class="fa fa-refresh"></i> {$_RELATED_PRODUCTS}</h2>
				            </div>
				        </div>
				        <div id="product-slider-exta" class="owl-carousel owl-theme">
				        {foreach from=$related item=foo}
				            <div class="col-md-9">
				                <figure class="figure product-box">
							<div class="product-box-img">
                                <a href="{$foo['link']}">
                                    <img src="{$foo['icon_img']}"  class="figure-img img-fluid" alt="{$foo['name']}">
                                </a>
							</div>
							<div class="quick-view-btn">
								<div class="compare-btn">
									<button type="button" class="btn btn-primary btn-action btn-sm" data-toggle="modal" data-target=".bd-example-modal-lg-product-1{$foo['id']}"><i class="fa fa-eye" aria-hidden="true"></i> {$_QUICK_VIEW}</button>
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
                                    {str_repeat('<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>',{5 - $foo['stars']})}{str_repeat('<a href="#"><i class="fa fa-star active-color" aria-hidden="true"></i></a>',{$foo['stars']})}
								</div>
							</figcaption>
						</figure>
						    </div>
						{/foreach}
					</div>
					</div>
				</section>
				
				{foreach from=$related item=foo}
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
                                    {str_repeat('<a href="#"><i class="fa fa-star active-color" aria-hidden="true"></i></a>',{$foo['stars']})}{str_repeat('<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>',{5 - $foo['stars']})}
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
	       {/if}