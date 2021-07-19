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
						                    <div class="col-md-12">
						              {if $rated}
						                        <div class="alert alert-{$_RATED}">{$__RATED}</div>
						              {/if}
						              {if $required}
						                        <div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>
						              {/if}
				                      {if !$reviews}
				                                <div class="alert alert-warning"><i class="fa fa-warning"></i> {$_NO_REVIEWS}</div>
				                      {/if}
				                      {foreach from=$reviews item=foo}
						                        <div class="card card-white post">
						                            <div class="post-heading">
						                                <div class="float-left image">
						                                    <h2><i class="fa fa-user"></i></h2>
						                                </div>
						                                <div class="float-left meta">
						                                    <div class="comment-name">
						                                        <b>{$foo['username']}</b>
						                                    </div>
						                                    <div class="rating">
						                                        <span class="text-muted time">{$foo['ago']}</span> |
						                                        {str_repeat('<a href="#"><i class="fa fa-star star-active-color" aria-hidden="true"></i></a>',{$foo['stars']})}{str_repeat('<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>',{5 - $foo['stars']})}
						                                     </div>
						                                </div>
						                            </div> 
						                            <div class="post-description"> 
						                                <p>{$foo['review']}</p>
						                            </div>
						                        </div>
						                        <br>
						              {/foreach}
						              {if $paging && $reviews}
						                    <nav aria-label="navigation">
						                        <ul class="pagination justify-content-center">{$paging}</ul>
						                    </nav><br>
						              {/if}
						              {if $logged && $reviewed == '2'}
						                    <div class="card">
								           <div class="card-header">
								               <h5 class="title"><i class="fa fa-star"></i> <small>{$_REVIEW}</small></h5>
								           </div>
								           <div class="card-body">
											<div class="review-comment-section">
												<div class="row">
													<div class="col-12 col-md-12 col-lg-12 col-xl-8">
										    
														<form  method="POST">
															<div class="row">
                                                                <input type="hidden" name="rate" value="rate" />
                                                                <input type="hidden" name="csrf" value="{$csrfToken}" />

																<div class="col-md-12">
																	<div class="form-group">
																		<label for="Review" class="color-black"><i class="fa fa-star"></i> {$_YOUR_RATING}</label>
																		<fieldset class="rating-star">
																		    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5"></label>
																		    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4"></label>
																		    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3"></label>
																		    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2"></label>
																		    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1"></label>
																		</fieldset>

																	</div>
																</div>
																<div class="col-md-12">
																	<div class="form-group">
																		<label for="Review" class="color-black"><i class="fa fa-comment"></i> {$_YOUR_REVIEW}</label>
																		<textarea name="review_txt" class="form-control"></textarea>
																	</div>
																</div>
																<div class="col-md-12">
																	<button type="submit" class="btn btn-primary btn-btx wd-shop-btn"><i class="fa fa-star" aria-hidden="true"></i> {$_REVIEW}</button>
																</div>
															</div>
														</form>
													</div>

												</div>
											</div>

								           </div>
								      </div>
						              {/if}
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