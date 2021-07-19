{include file="$TMP/Layout/header.tpl"}

    <!-- =========================
        Product Details Section
    ============================== -->
    <section class="product-details">
    	<div class="container">
    		<div class="row">
				<div class="col-12">
					<div class="page-location">
							<div class="title-page">
							    <i class="fa fa-chevron-circle-right"></i> {$title}
							</div>
					</div>
				</div>
    		</div>
			<div class="row">
				<div class="col-12">
				<div class="wd-tab-section">
					<div class="bd-example bd-example-tabs">
                        {include file="$TMP/User/Product/menu.tpl"}
						<div class="tab-content" id="pills-tabContent">
						    <div class="col-12 product-details-section">
						        <!-- ====================================
						           Product Details Gallery Section
						        ========================================= -->
						        <div class="row">
						            <div class="product-gallery col-12 col-md-12 col-lg-6">
						                <!-- ====================================
						                   Single Product Gallery Section
						                ========================================= -->
						                <div class="row">
						                    <div class="col-md-12 product-slier-details p0">
						                        <div class="card">
								      <div class="card-body">
								          <ul id="lightSlider">
								              <li data-thumb="{$preview_img}">
								                  <img class="figure-img img-fluid" src="{$preview_img}" alt="{$title}" />
								              </li>
								         </ul>
								      </div>
								     </div>
								                <div class="preview-social">	
										<span class="wb-social-media share-border"><i class="fa fa-share"></i> {$_SHARE}
										        <a href="https://www.facebook.com/sharer/sharer.php?u={$item_link}" class="fb" target="_blank" onclick="return !window.open(this.href, 'Facebook', 'width=560,height=300')">
										            <i class="fa fa-facebook"></i>
										        </a>
										        <a href="https://twitter.com/intent/tweet?url={$item_link}&text={$title}" class="tr" target="_blank" onclick="return !window.open(this.href, 'Twitter', 'width=560,height=300')">
										            <i class="fa fa-twitter"></i>
										        </a>
										        <a href="https://pinterest.com/pin/create/button/?url={$item_link}&media=&description={$title}" class="yt" target="_blank" onclick="return !window.open(this.href, 'Pinterest', 'width=560,height=300')">
										            <i class="fa fa-pinterest"></i>
										        </a>
										</span>
								    </div>
								                <div class="card">
								      <div class="card-body">
								          <p>{$content}</p>
								      </div>
								     </div>
								            </div>
								        </div>
						            </div>
						            <div class="col-6 col-12 col-md-12 col-lg-6">
						                <!-- ====================================
						                   Sidebar Section
						                ========================================= -->
						                {include file="$TMP/User/Product/sidebar.tpl"}
						            </div>
					           </div>
                            </div>
				        </div>
				    </div>
				    {include file="$TMP/User/Product/related.tpl"}

			    </div>
    	        </div>
    	    </div>
    	</div>
    </section>

{include file="$TMP/Layout/footer.tpl"}