{include file="$TMP/Layout/header.tpl"}

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
							<div class="tab-pane fade active show">
								<div class="product-tab-content">
								        <section class="product-shop-page">
								            <div class="container">
								                <div class="row">
								                    <div class="col-12 col-md-8 col-lg-9">
								                        <div class="row">
								                              <div class="col-sm-12">
								                                      <div class="card">
								                                            <div class="card-header box-grey">
								                                                <h5 class="title"><i class="fa fa-credit-card"></i> {$_BILLING}</h5>
								                                            </div>
								                                            <div class="card-body">
								                                                <div class="col-12">
								                                                    <!-- =================================
								                                                         Billing Section
								                                                         =================================-->
								                                                         <div class="review-comment-section">
								                                                             <div class="col-12 col-md-12 col-lg-12 col-xl-8">
								                                                                 {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
								                                                                 
								                                                                 <form  method="POST" id="payment-form">
								                                                                     <div class="row">
								                                                               
								                                                                         <input type="hidden" name="billing" value="billing" />
								                                                                         <input type="hidden" name="csrf" value="{$csrfToken}" />
								                                                                         <div class="col-md-12">
								                                                                             <div class="form-group">
								                                                                                 <label for="first" class="color-black">{$_FIRST_NAME} *</label>
								                                                                                 <input type="text" name="first_name" class="form-control" required="">
								                                                                            </div>
								                                                                        </div>
								                                                                        <div class="col-md-12">
								                                                                            <div class="form-group">
								                                                                                <label for="first" class="color-black">{$_LAST_NAME} *</label>
								                                                                                <input type="text" name="last_name" class="form-control" required="">
								                                                                            </div>
								                                                                        </div>
								                                                                        <div class="col-md-12">
								                                                                            <div class="form-group">
								                                                                                <label for="card-element" class="color-black">{$_CARD_NUMBER} *</label>
								                                                                                <div id="card-element" class="form-control"></div>
								                                                                                
								                                                                                <!-- Used to display form errors. -->
								                                                                                <div id="card-errors"></div>
								                                                                                {if do_config(42) == 1}
								                                                                                <br><strong class="red-color text-uppercase">use this card number for test (4242424242424242)</strong>
								                                                                                {/if}
								                                                                            </div>
								                                                                        </div>
								                                                                        <div class="col-md-12">
								                                                                            <button type="submit" class="btn btn-primary btn-btx wd-shop-btn"><i class="fa fa-arrow-right" aria-hidden="true"></i>  {$_SUBMIT}</button>
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
                                                    <div class="col-12 col-md-4 col-lg-3 ">
                                                        <!-- =========================
                                                             Sidbar Section
                                                             ============================== -->
                                                             <div class="card">
                                                                 <div class="card-header">
                                                                     <h5 class="title"><i class="fa fa-bank"></i> Current Balance</h5>
                                                                 </div>
                                                                 <div class="card-body">
                                                                     <h5 class="text-center">{$balance}</h5>
                                                                     <div class="text-center">
                                                                         <i class="fa fa-history"></i> <a class="active-color" href="{$USR}payments-history">View Payments History</a>
                                                                     </div>
                                                                </div>
                                                            </div>
                                                    </div>
                                            </div>
                                        </section>
		                         </div>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
        </div>
    </section>
    <!-- =========================
    	STRIPE CALLS
    ============================== -->
    {include file="$TMP/Ajax/stripe.js.tpl"}

{include file="$TMP/Layout/footer.tpl"}