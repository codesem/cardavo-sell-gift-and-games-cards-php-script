{include file="$TMP/Layout/header.tpl"}

    <!-- =========================
        RECAPTCHA JS TAG
    ============================== -->
    <script src='https://www.google.com/recaptcha/api.js'></script>
                        
    <!-- =========================
        Product Details Section
    ============================== -->
    <section class="product-details wishlist-table">
    	<div class="container">
			<div class="row">
				<div class="col-12">
				<div class="wd-tab-section">
					<div class="bd-example bd-example-tabs">
                        {include file="$TMP/User/Layout/menu.tpl"}
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade active show " role="tabpanel" aria-expanded="true">
								<div class="product-tab-content">
						{if $ticket_status == 'closed'}
								    <div class="alert alert-warning"><i class="fa fa-lightbulb-o icon-big"></i> {$_TICKET_CLOSED_NOTE}</div>
                        {/if}

                                {if $sent}<div class="alert alert-{$_TICKETREPLY}">{$__TICKETREPLY}</div>{/if}
                                {if $recaptcha}<div class="alert alert-{$_RECAPTCHA}">{$__RECAPTCHA}</div>{/if}
                                {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
								       <div class="card">
								           <div class="card-header box-grey">
								               <h5 class="title"><i class="fa fa-user"></i> {$full_name} [{$_TICKET} #{$ticket_id}] <small>({$ago})</small></h5>
								           </div>
								           <div class="card-body">
								               {$message}
								           </div>
							      	   </div>
								       <br>
						{foreach from=$sub_support item=foo}
								       <div class="card">
								           <div class="card-header box-grey">
								               <h5 class="title"><i class="fa fa-user"></i> {$foo['full_name']} <small>({$foo['ago']})</small></h5>
								           </div>
								           <div class="card-body">
								               {$foo['message']}
								           </div>
							      	   </div>
						{/foreach}
								       <br>
								       <div class="card">
								           <div class="card-header">
								               <h5 class="title"><i class="fa fa-comment"></i> <small>{$_REPLY}</small></h5>
								           </div>
								           <div class="card-body">
											<div class="review-comment-section">
												<div class="row">
													<div class="col-12 col-md-12 col-lg-12 col-xl-8">
										    
														<form  method="POST">
															<div class="row">
                                                                <input type="hidden" name="reply" value="reply" />
                                                                <input type="hidden" name="csrf" value="{$csrfToken}" />

																<div class="col-md-12">
																	<div class="form-group">
																		<label for="reply" class="color-black"><i class="fa fa-envelope"></i> {$_YOUR_MESSAGE}</label>
																		<textarea name="message" class="form-control col-12" id="reply"></textarea>
																	</div>
																</div>
																<div class="col-md-12">
																	<div class="form-group">
																		<label for="recaptcha" class="color-black"><i class="fa fa-refresh"></i> {$_PROVE_YOUR_HUMAN}</label>
																		<div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{do_config(4)}"></div>
																	</div>
																</div>
																<div class="col-md-12">
																	<button type="submit" class="btn btn-primary btn-btx wd-shop-btn"><i class="fa fa-comment" aria-hidden="true"></i>  {$_REPLY}</button>
																</div>
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
        </div>
    </section>

{include file="$TMP/Layout/footer.tpl"}