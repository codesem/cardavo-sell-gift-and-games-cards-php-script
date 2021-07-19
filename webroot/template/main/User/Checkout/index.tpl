{include file="$TMP/Layout/header.tpl"}

    <!-- =========================
        Checkout Section
    ============================== -->
    <section class="product-shop-page">
		<div class="container">
		    <div class="empty-h"></div>
    		<div class="row">
				<div class="col-12">
					<div class="page-location">
							<div class="title-page">
							    <span><i class="fa fa-lock"></i> {$site_title}</span>
							</div>
					</div>
				</div>
    		</div>
			<div class="row">
			    <div class="col-12 col-md-8 col-lg-9">
			        <div class="row">
			            <div class="col-sm-12">
			                    {if $error}<div class="alert alert-danger">{$checkout_msg}</div>{/if}
                                {if $small}<div class="alert alert-{$_AMOUNT_D_SMALL}">{$__AMOUNT_D_SMALL}</div>{/if}
                                {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
                                {if $do_error}<div class="alert alert-{$_SOME_WRONG}">{$__SOME_WRONG}</div>{/if}
			                <div class="card">
                                <div class="card-header box-grey">
                                    <span class="title"><i class="fa fa-shopping-cart"></i> {$_SHOPPING_CART}</span>
                                </div>
                    {if !isset($smarty.session.cart)}
                                <div class="card-body">
                                    <div class="col-12">
                                        <div class="alert alert-warning"><i class="fa fa-times icon-big"></i> {$_EMPTY_CART}</div>
                                    </div>
                                </div>
                    {else}
                                <div class="on-desktop">
					      {foreach from=$smarty.session.cart item=foo}
                                        <ul class="list-group wd-info-section">
                                            <li class="list-group-item d-flex justify-content-between align-items-center p0">
                                                <div class="col-12 col-md-6 info-section">
                                                    <a href="" class="username-profile black-color"><img class="" src="{$foo['icon_img']}" alt="cart-img" height="30" width="30"/> {$foo['name']}</a>
                                                </div>
                                                <div class="col-12 col-md-4 info-section">
                                                    <div class="rating">
                                                        {str_repeat('<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>',{5 - $foo['stars']})}{str_repeat('<a href="#"><i class="fa fa-star active-color" aria-hidden="true"></i></a>',{$foo['stars']})}
                                                    </div>
                                                    <small class="black-color"><b>({$foo['qty']} x {do_amount($foo['price_per_unit'])})</b></small>
                                                </div>
                                                <div class="col-12 col-md-3 info-section">
                                                    <h6 class="green-color">{do_amount($foo['total'])}</h6>
                                                </div>
                                                <div class="col-1"></div>
                                            </li>
                                        </ul>
                          {/foreach}
                                </div>
                                <div class="on-phone">
                                    <div class="card-body">
                                        <table>
					      {foreach from=$smarty.session.cart item=foo}
                                            <tr>
                                                <td class="username-profile black-color"><img class="" src="{$foo['icon_img']}" alt="cart-img" height="30" width="30"/> {$foo['name']}</td>
                                                <td><h6 class="green-color">{do_amount($foo['total'])}</h6></td>
                                            </tr>
                          {/foreach}
                                        </table>
                                    </div>
                                </div>
                    {/if}
                           </div>
                            <div class="empty-h"></div>
                    {if isset($smarty.session.cart)}
			                <div class="card">
                                <div class="card-header box-grey">
                                    <span class="title"><i class="fa fa-bank"></i> {$_PAYMENT_METHOD}</span>
                                </div>
                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <a onclick="getTax('{$smarty.session.cart_total}','balance')" class="nav-link nav-checkout active" id="balance-tab" data-toggle="tab" href="#balance" role="tab" aria-controls="balance" aria-selected="true">
                                                    <img class="img-fluid" src="{$UPD}images/balance-checkout.svg" width="90" height="90" alt="u" />
                                                </a>
                                            </li>
								{foreach from=$dmethods item=foo}
                                            <li class="nav-item" role="presentation">
                                                <a onclick="getTax('{$smarty.session.cart_total}','{$foo['methods']}')" class="nav-link nav-checkout" id="{$foo['methods']}-tab" data-toggle="tab" href="#{$foo['methods']}" role="tab" aria-controls="{$foo['methods']}" aria-selected="true">
                                                    <img class="img-fluid" src="{$UPD}images/{$foo['methods']}-checkout.svg" width="90" height="90" alt="u" />
                                                </a>
                                            </li>
                                {/foreach}
                                        </ul>
                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane fade show active" id="balance" role="tabpanel" aria-labelledby="balance-tab">
                                                <div class="card-body">
                                                    <div class="col-12">
                                                        <div class="col-12 product-store-box">
                                                        <p>{$__BALANCE}</p>
                                                        <div class="row">
                                                            <div class="col-8 store-border-img"></div>
                                                        </div>
									                     <hr>
									                     <div class="row">
									                         <div class="col-12">
									                             <form action="{$HOST}checkout" method="POST">
									                                 <input type="hidden" name="checkout" value="checkout" />
									                                 <input type="hidden" name="csrf" value="{$csrfToken}" />
									                                 <input type="hidden" name="method" value="balance" />
									                                 
									                                 <button type="submit" class="btn btn-primary btn-btx wd-shop-btn pull-right">
									                                     <i class="fa fa-arrow-right"></i> {$_PURCHASE}
									                                 </button>
									                             </form>
									                         </div>
									                     </div>
								</div>
                                                    </div>
                                                </div>
								            </div>
								{foreach from=$dmethods item=foo}
                                            <div class="tab-pane fade" id="{$foo['methods']}" role="tabpanel" aria-labelledby="{$foo['methods']}-tab">
                                                <div class="card-body">
                                                    <div class="col-12">
                                                        <div class="col-12 product-store-box">
                                                        <p>{$_MAKE_YOUR_PAYMENT} {$foo['name']}{$__MAKE_YOUR_PAYMENT}</p>
                                                        <div class="row">
                                                            <div class="col-8 store-border-img">
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
                                                        </div>
									                     <hr>
									                     <div class="row">
									                         <div class="col-12">
									                             <form action="{$HOST}checkout" method="POST">
									                                 <input type="hidden" name="checkout" value="checkout" />
									                                 <input type="hidden" name="csrf" value="{$csrfToken}" />
									                                 <input type="hidden" name="method" value="{$foo['methods']}" />
									                                 
									                                 <button type="submit" class="btn btn-primary btn-btx wd-shop-btn pull-right">
									                                     <i class="fa fa-refresh"></i> {$_CHECKOUT}
									                                 </button>
									                             </form>
									                         </div>
									                     </div>
								</div>
                                                    </div>
                                                </div>
								            </div>
                                {/foreach}
								        </div>
                           </div>
                            <br>
                    {/if}
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-lg-3">
                    <!-- =========================
                        Sidbar Section
                        ============================== -->
                        <div class="card">
                            <div class="card-header">
                                      <h5 class="title"><i class="fa fa-dollar"></i> {$_ORDER_SUMMARY}</h5>
                            </div>
                    {if isset($smarty.session.cart)}
                            <ul class="list-group wd-info-section">
								{foreach from=$smarty.session.cart item=foo}
                                            <li class="list-group-item d-flex justify-content-between align-items-center p0">
                                                <div class="col-6 col-md-6 info-section">
                                                    <h6><small class="black-color"><b>{$foo['qty']} x {do_amount($foo['price_per_unit'])}</b></small></h6>
                                                </div>
                                                <div class="col-6 col-md-7 info-section">
                                                   <span class="green-color"> <b>{do_amount($foo['total'])}</b></span>
                                                </div>
                                                <div class="col-1"></div>
                                            </li>
								{/foreach}
                                            <li class="list-group-item d-flex justify-content-between align-items-center p0">
                                                <div class="col-6 col-md-6 info-section">
                                                    <h6><small class="black-color"><b>{$_TAX}</b></small></h6>
                                                </div>
                                                <div class="col-6 col-md-5 info-section">
                                                   <span class="green-color"> <b>{do_config(2)}<span id="tax-tag">{do_amount(0,false)}</span></b> <i class="fa fa-spinner" id="loader-tax" style="display: none;"></i></span>
                                                </div>
                                                <div class="col-1"></div>
                                            </li>
                            </ul>
                            <div class="card-body">
                                      <h5 class="text-center">{strtoupper($_TOTAL)}: <span id="total">{do_amount($smarty.session.cart_total)} </span><i class="fa fa-spinner" id="loader-total" style="display: none;"></i></h5>
                            </div>
                    {else}
                            <div class="card-body">
                                      <h5 class="text-center">{strtoupper($_TOTAL)}: {do_amount(0)}</h5>
                            </div>
                    {/if}
                        

                        </div>
                        <div class="empty-h"></div>
                        <div class="text-center">
                            <p class="checkout-badge" style="font-size: 16px;color: #666;"><i class="fa fa-lock"></i> {$_SECURE_CHECKOUT}</p>
                        </div>
                </div>
            </div>
        </div>
    </section>
                
{include file="$TMP/Layout/footer.tpl"}