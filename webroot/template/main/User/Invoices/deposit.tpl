{include file="$TMP/Layout/header.tpl"}
      
  {foreach from=$dmethods item=foo}
    <div class="product-view-modal modal fade bd-example-modal-lg-product-{$foo['methods']}" tabindex="-{$foo['methods']}" aria-hidden="true">
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
                                        <img src="{$UPD}images/{$foo['methods']}-icon.svg" class="img-fluid" alt="{$foo['methods']}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				<div class="col-6 col-12 col-md-12 col-lg-6">
					<div class="product-details-gallery">
						<div class="list-group">
							<h4 class="list-group-item-heading product-title">
								<i class="fa fa-lock"></i> {$foo['name']}
							</h4>
							<div class="media">
								<div class="media-left media-middle"></div>
								<div class="media-body"></div>
							</div>
						</div>
						<div class="list-group content-list">
						  <form action="{$USR}deposit" method="POST">
						      
							<input type="hidden" name="deposit" value="deposit" />
							<input type="hidden" name="csrf" value="{$csrfToken}" />
							<input type="hidden" name="method" value="{$foo['methods']}" />
						    <div class="alert alert-success box-action" role="alert">
								        <div class="btn-group text-left">
								            
								    {if $foo['methods'] == 'paypal'}
                                             <select onChange="getTaxPayPal(this.value);" name="amount" class="btn btn-secondary dropdown-select-box btn-sm dropdown-toggle">
								    {elseif $foo['methods'] == 'coinbase'}
                                             <select onChange="getTaxCoinbase(this.value);" name="amount" class="btn btn-secondary dropdown-select-box btn-sm dropdown-toggle">
								    {elseif $foo['methods'] == 'stripe'}
                                             <select onChange="getTaxStripe(this.value);" name="amount" class="btn btn-secondary dropdown-select-box btn-sm dropdown-toggle">
								    {/if}

                                                 <div class="dropdown-menu">
                                                  <option class="dropdown-item" disabled selected> {$_AMOUNT}</option>
	                                            {foreach from=$amounts item=am}
                                                  <option class="dropdown-item" value="{$am['amount']}">{$am['amount']} {do_config(16)}</option>
                                                {/foreach}
                                                 </div>
                                             </select>
								        </div>
								        <span class="price-box text-right">
								            <i class="fa fa-lock"></i>
								        </span>
								        <hr>
								        <p><i class="fa fa-check-circle" aria-hidden="true"></i> {$_MINIMUM}: <b>{do_amount(do_config(58))}</b></p>
								        <p><i class="fa fa-check-circle" aria-hidden="true"></i> {$_TAX}: <b id="tax-tag-{$foo['methods']}">{do_amount($foo['tax'])}</b> <i class="fa fa-spinner" id="loader-tax-{$foo['methods']}" style="display: none;"></i></p>
								        <p><i class="fa fa-check-circle" aria-hidden="true"></i> {$_TOTAL}: <b id="total-{$foo['methods']}">{do_amount($foo['total'])} </b><i class="fa fa-spinner" id="loader-total-{$foo['methods']}" style="display: none;"></i></p>
								        <hr>

								        <div class="product-store row">
								            <div class="col-12 product-store-box">
							<div class="row">
								<div class="col-9 store-border-img">
								    {if $foo['methods'] == 'paypal' || $foo['methods'] == 'stripe'}
										<img src="{$UPD}images/visa.png" width="40" height="25" alt="visa" title="visa">	
										<img src="{$UPD}images/mastercard.png" width="40" height="25" alt="mastercard" title="mastercard">	
										<img src="{$UPD}images/amex.png" width="40" height="25" alt="amex" title="amex">	
										<img src="{$UPD}images/discover.png" width="40" height="25" alt="discover" title="discover">
								    {elseif $foo['methods'] == 'coinbase'}
										<img src="{$UPD}images/bitcoin.png" width="40" height="40" alt="bitcoin" title="bitcoin">	
										<img src="{$UPD}images/ethereum.png" width="40" height="40" alt="ethereum" title="ethereum">	
										<img src="{$UPD}images/litecoin.png" width="40" height="40" alt="litecoin" title="litecoin">	
										<img src="{$UPD}images/bitcoin-cash.png" width="40" height="40" alt="bitcoin-cash" title="bitcoin-cash">
								    {/if}
								</div>
								<div class="col-3 store-border-button">
									<button class="btn btn-primary btn-btx wd-shop-btn pull-right">
										{$_DEPOSIT}
									</button>
								</div>
							</div>
						</div>
						                    <div class="col-12 product-store-box">
							<div class="row">
								<div class="col-12 store-border-img text-center">
                                      <small><b><i class="fa fa-refresh"></i> {$__CHECKOUT}</b></small>
								</div>
							</div>
						</div>
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
  {/foreach}

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
								<div class="product-tab-content">
								    <div class="container">
								        <div class="row">
								            <div class="col-12 col-md-8 col-lg-9">
								                {if $credited}<div class="alert alert-{$_CREDITED}">{$__CREDITED}</div>{/if}
								                {if $error}<div class="alert alert-danger">{$checkout_msg}</div>{/if}
								                {if $small}<div class="alert alert-{$_AMOUNT_D_SMALL}">{$__AMOUNT_D_SMALL}</div>{/if}
								                {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
								                {if $do_error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}
								                <div class="card">
								                    <div class="card-header box-grey">
								                        <h5 class="title"><i class="fa fa-arrow-down"></i> {$_DEPOSIT}</h5>
								                    </div>
								                    <div class="card-body">
								                        <p class="card-text">{$__DEPOSIT}</p>
								                        <hr>
								                            <div class="row">
								                {foreach from=$dmethods item=foo}
								                                <div class="col-9 col-md-6 col-lg-4">
								                                    <figure class="figure product-box row">
								                                        <div class="col-12 col-md-12 col-lg-12 col-xl-12 p0">
								                                            <div class="product-box-img">
								                                                <a href="" data-toggle="modal" data-target=".bd-example-modal-lg-product-{$foo['methods']}">
								                                                    <img src="{$UPD}images/{$foo['methods']}-deposit.svg" class="figure-img img-fluid" alt="{$foo['methods']}-deposit">
								                                                </a>
								                                            </div>
								                                            <div class="quick-view-btn">
								                                                <div class="compare-btn">
								                                                    <button type="button" class="btn btn-primary btn-action btn-sm" data-toggle="modal" data-target=".bd-example-modal-lg-product-{$foo['methods']}"><i class="fa fa-arrow-down" aria-hidden="true"></i> {$_DEPOSIT}</button>
								                                                </div>
								                                            </div>
								                                        </div>
								                                        <div class="col-12 col-md-12 col-lg-12 col-xl-12 p0"></div>
								                                    </figure>
								                                </div>
								                {/foreach}
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
                                      <h5 class="title"><i class="fa fa-bank"></i> {$_CURRENT_BALANCE}</h5>
                            </div>
                            <div class="card-body">
                                      <h5 class="text-center">{$balance}</h5>
                                      <div class="text-center">
                                          <i class="fa fa-history"></i> <a class="active-color" href="{$USR}invoices">{$_VIEW_PAYMENTS_HISTORY}</a>
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