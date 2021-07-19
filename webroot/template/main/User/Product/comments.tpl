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
						              {if $reported}
						                        <div class="alert alert-{$_REPORTED}"> {$__REPORTED}</div>
						              {/if}
						              {if $deleted}
						                        <div class="alert alert-{$_CDELETED}"> {$__CDELETED}</div>
						              {/if}
						              {if $added}
						                        <div class="alert alert-{$_CADDED}"> {$__CADDED}</div>
						              {/if}
						              {if $replied}
						                        <div class="alert alert-{$_CREPLY}"> {$__CREPLY}</div>
						              {/if}
						              {if $required}
						                        <div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>
						              {/if}
				                      {if !$comments}
				                                <div class="alert alert-warning"><i class="fa fa-warning"></i> {$_NO_SUPPORT_QUESTIONS_OR_COMMENTS}</div>
				                      {/if}
				                      {foreach from=$comments item=foo}
						                        <div class="card card-white post">
						                            <div class="post-heading">
						                                <div class="float-left image">
						                                    <h2><i class="fa fa-user"></i></h2>
						                                </div>
						                                <div class="float-left meta">
						                                    <div class="comment-name">
						                                        <b>{$foo['username']}</b>
						                                    </div>
						                                    <h6 class="text-muted time">{$foo['ago']}
						                          {if $logged}
						                             {if $foo['username'] != $username}
						                                    | <a href="{$HOST}report/{$product_id}/{$foo['id']}/" class="report-comment" data-toggle="tooltip" data-placement="right" title="" data-original-title="{$__REPORT}"><i class="fa fa-flag"></i> {$_REPORT}</a>
						                             {elseif $foo['username'] == $username}
						                                    | <a href="{$HOST}delete/{$foo['id']}/" class="report-comment" data-toggle="tooltip" data-placement="right" title="" data-original-title="{$__DELETE}"><i class="fa fa-times"></i> {$_DELETE}</a>
						                             {/if}
						                          {/if}
						                                    </h6>
						                                </div>
						                            </div> 
						                            <div class="post-description"> 
						                                <p>{$foo['comment']}</p>
						                            </div>
						              {foreach from=$foo['replies'] item=rep}
						                     {if $rep['parent_id'] == $foo['id']}
						                            <div class="post-replies">
						                                <div class="post-heading reply-comment">
						                                <div class="float-left image">
						                                    <h2><i class="fa fa-user"></i></h2>
						                                </div>
						                                <div class="float-left meta">
						                                    <div class="comment-name">
						                                        <b>{$rep['username']}</b>
						                                    </div>
						                                    <h6 class="text-muted time">{$rep['ago']}
						                          {if $logged}
						                             {if $rep['username'] != $username}
						                                    | <a href="{$HOST}report/{$product_id}/{$rep['id']}/" class="report-comment" data-toggle="tooltip" data-placement="right" title="" data-original-title="{$__REPORT}"><i class="fa fa-flag"></i> {$_REPORT}</a>
						                             {elseif $rep['username'] == $username}
						                                    | <a href="{$HOST}delete/{$rep['id']}/" class="report-comment" data-toggle="tooltip" data-placement="right" title="" data-original-title="{$__DELETE}"><i class="fa fa-times"></i> {$_DELETE}</a>
						                             {/if}
						                          {/if}
						                                    </h6>
						                                </div>
						                            </div>
						                                <div class="post-description reply-comment"> 
						                                <p>{$rep['comment']}</p>
						                            </div>
						                            </div>
						                            
						                     {/if}
						              {/foreach}
						              {if $logged}
						                        <form method="POST">
						                            <input type="hidden" name="reply" value="reply" />
						                            <input type="hidden" name="csrf" value="{$csrfToken}" />
						                            <input type="hidden" name="parent_id" value="{$foo['id']}" />
						                            <div class="col-md-12">
						                                <div class="form-group">
						                                    <label for="Reply" class="color-black"> {$_YOUR_REPLY}</label>
						                                    <textarea name="reply_txt" class="form-control"></textarea>
						                                </div>
						                                <div class="form-group">
														    <button type="submit" class="btn btn-primary btn-btx wd-shop-btn"><i class="fa fa-comments" aria-hidden="true"></i>  {$_REPLY}</button>
						                                </div>
												    </div>
						                        </form>
						              {/if}
						                        </div>
						                        <br>
						              {/foreach}
						              {if $paging && $comments}
						                    <nav aria-label="navigation">
						                        <ul class="pagination justify-content-center">{$paging}</ul>
						                    </nav><br>
						              {/if}
						              {if $logged}
						                    <div class="card">
								           <div class="card-header">
								               <h5 class="title"><i class="fa fa-comment"></i> <small>{$_COMMENT}</small></h5>
								           </div>
								           <div class="card-body">
											<div class="review-comment-section">
												<div class="row">
													<div class="col-12 col-md-12 col-lg-12 col-xl-8">
										    
														<form  method="POST">
															<div class="row">
                                                                <input type="hidden" name="comment" value="comment" />
                                                                <input type="hidden" name="csrf" value="{$csrfToken}" />

																<div class="col-12 col-md-12">
																	<div class="form-group">
																		<label for="Comment" class="color-black"><i class="fa fa-comment"></i> {$_YOUR_COMMENT}</label>
																		<textarea name="comment_txt" class="form-control"></textarea>
																	</div>
																</div>
																<div class="col-md-12">
																	<button type="submit" class="btn btn-primary btn-btx wd-shop-btn"><i class="fa fa-comment" aria-hidden="true"></i>  {$_COMMENT}</button>
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