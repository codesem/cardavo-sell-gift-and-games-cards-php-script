							<div class="product-details-gallery">
							   
							   <div id="added-alert" class="alert alert-warning" style="display: none;"><span id="alert-msg"></span></div>

						        <div class="card">
							      <div class="card-body">
								   <div class="list-group">
									<h4 class="list-group-item-heading product-title">
										{$title}
									</h4>
									<div class="media">
										<div class="media-left media-middle">
											<div class="rating">
						                        {str_repeat('<a href="#"><i class="fa fa-star star-active-color" aria-hidden="true"></i></a>',{$stars})}{str_repeat('<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>',{5 - $stars})}
											</div>
										</div>
										<div class="media-body">
											<p><span class="product-ratings-text">{$num_reviews} {$_RATINGS}</span></p>
										</div>
									</div>
								</div>
							      </div>
						        </div>
						        <div class="product-informations">
								   <div class="list-group content-list">
								    <div class="alert alert-success box-action" role="alert" itemscope="" itemtype="http://schema.org/Product">
								        <meta itemprop="name" content="{$title}">	 

								        <div class="btn-group text-left">
                                             <select name="amount" onChange="getStock(this.value);" class="btn btn-secondary dropdown-select-box btn-sm dropdown-toggle" required>
                                                 <div class="dropdown-menu">
                                                     <option class="dropdown-item" disabled selected="">{$_AMOUNT}</option>
	                                           {foreach from=$select_price item=foo}
                                                     <option class="dropdown-item" value="{$foo['amount']}|{$foo['prod_id']}">{$foo['amount']}{do_config(16)} ({$foo['price']}{do_config(16)})</option>
	                                           {/foreach}
                                                 </div>
                                             </select>
								        </div>
								        <hr class="on-phone">
								        <span class="price-box">
								            <i class="fa fa-lock"></i>
								        </span><hr>
								        <p><i class="fa fa-check-circle-o" aria-hidden="true"></i> {$_VERIFIED_PRODUCT}</p>
								        <p><i class="fa fa-check-circle-o" aria-hidden="true"></i> {$_LOWEST_PRICE_GUARANTEED}</p> 
								        <p><i class="fa fa-check-circle-o" aria-hidden="true"></i> {$_PRICE_BETWEEN} <b>({$price} {do_config(16)})</b></p><hr>
								        <center>
								            <span id="input-data">
								            <div class="btn-group text-left col-10 p0">
								                <select name="amount" id="qty" class="btn btn-secondary dropdown-select-box btn-sm dropdown-toggle" required="" style="padding-left: 50px;padding-right: 50px;">
								                    <option class="dropdown-item" disabled="" selected="">{$_QUANTITY}</option>
								                    <option class="dropdown-item">1</option>
								                </select>
								                <input type="hidden" id="amount" value="" />
								            </div>
								        </span>&nbsp;<h6 style="display: inline-block;"><i class="fa fa-spinner" id="loader" style="display: none;"></i></h6><hr>
								        </center>
								        <div class="text">
								            <div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
								                <meta itemprop="price" content="{$price}">
								                <meta itemprop="priceCurrency" content="USD">
										        <meta itemprop="availability" content="instock" />

								            <!-- Person -->
								            <div class="data-none" itemscope="" itemprop="seller" itemtype="http://schema.org/Person" style="display: none;">
								                <div itemprop="url">{$HOST}</div>
								                <div itemprop="name">{do_config(0)}</div>
								                <div itemprop="image">{do_config(0)}</div>
								            </div>
								          </div>
								        </div>
								        <div class="col-12 product-store-box on-desktop">
								        <div class="row">
									    <div class="col-8 store-border-img">
									        <img src="{$AST}custom/img/verified.svg" width="170" height="40" alt="verified" title="verified">	
								        </div>
										<div class="col-4 store-border-button">
											<button onClick = "AddCart('{$product_id}')"  class="btn btn-primary btn-btx wd-shop-btn pull-right">
												<i class="fa fa-shopping-cart"></i> {$_ADD_CART}
											</button><br>
										</div>
									</div>
								</div>
								        <div class="col-12 product-store-box on-phone">
								          <center>
									        <img src="{$AST}custom/img/verified.svg" width="170" height="40" alt="verified" title="verified">	
                                            <div class="empty-h"></div>
											<button onClick = "AddCart('{$product_id}')"  class="btn btn-primary btn-btx wd-shop-btn">
												<i class="fa fa-shopping-cart"></i> {$_ADD_CART}
											</button>
										  </center>
										</div>

								</div>
							</div>

							       </div>
						        </div>
						        <div class="product-informations">
						            <ul class="list-group wd-info-section">
									<li class="list-group-item d-flex justify-content-between align-items-center p0">
										<div class="col-12 col-md-6 info-section">
											<p>{$_CREATED}</p>
										</div>
										<div class="col-12 col-md-5 info-section">
											<p>{$created}</p>
										</div>
										<div class="col-1"></div>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center p0">
										<div class="col-12 col-md-6 info-section">
											<p>{$_CATEGORY}</p>
										</div>
										<div class="col-12 col-md-5 info-section">
											<p>{$category}</p>
										</div>
										<div class="col-1"></div>
									</li>
								</ul>
						        </div>
						        <div class="card">
							      <div class="card-body">
								   <div class="list-group">
                                   <p class="tags-block">{$tags}</p>
								</div>
							      </div>
						        </div>