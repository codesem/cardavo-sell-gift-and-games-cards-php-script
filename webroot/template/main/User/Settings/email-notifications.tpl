{include file="$TMP/Layout/header.tpl"}
    
    <!-- =========================
        Product Details Section
    ============================== -->
    <section class="product-details">
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
								                        <div class="row">
								                              <div class="col-sm-12">
								                                      <div class="card">
								                                            <div class="card-header box-grey">
								                                                <h5 class="title"><i class="fa fa-bell"></i> {$_EMAIL_NOTIFICATIONS}</h5>
								                                            </div>
								                                            <div class="card-body">
								                                                <div class="col-12">
								                                                    <div class="row">
								                                                        <!-- =================================
								                                                             EMAIL NOTIFICATIONS
								                                                             =================================-->
								                                                             <div class="review-comment-section">
								                                                                 <div class="row">
								                                                                     <div class="col-12 col-md-12 col-lg-12 col-xl-8">
								                                                                         {if $updated}<div class="alert alert-{$_NOTIFICATIONS_UPDATED}">{$__NOTIFICATIONS_UPDATED}</div>{/if}
								                                                                         {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
								                                                                         
								                                                                         <form  method="POST">
								                                                                             <div class="row">
								                                                                                 
								                                                                                 <input type="hidden" name="notifications" value="notifications" />
								                                                                                 <input type="hidden" name="csrf" value="{$csrfToken}" />
								                                                                                 
								                                                                                 <div class="col-md-8">
								                                                                                     <label class="checkbox-container">{$_ORDER_NOTIFICATION}
								                                                                                     <input type="checkbox" name="order" value="on" {if $order_notification == 'on'}checked="checked"{/if}>
								                                                                                     <span class="checkmark"></span>
								                                                                                     </label>
								                                                                                  </div>
								                                                                                  <div class="col-md-8">
								                                                                                      <label class="checkbox-container">{$_DEPOSIT_NOTIFICATIONS}
								                                                                                         <input type="checkbox" name="deposit" value="on" {if $deposit_notification == 'on'}checked="checked"{/if}>
								                                                                                         <span class="checkmark"></span>
								                                                                                      </label>
								                                                                                  </div>
								                                                                                  <div class="col-md-8">
								                                                                                      <label class="checkbox-container">{$_SUPPORT_NOTIFICATIONS}
								                                                                                         <input type="checkbox" name="support" value="on" {if $support_notification == 'on'}checked="checked"{/if}>
								                                                                                         <span class="checkmark"></span>
								                                                                                      </label>
								                                                                                  </div>
								                                                                                  <div class="col-md-12">
								                                                                                      <button type="submit" class="btn btn-primary btn-btx wd-shop-btn"><i class="fa fa-floppy-o" aria-hidden="true"></i>  {$_SAVE}</button>
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
                                                    <div class="col-12 col-md-4 col-lg-3 ">
                                                        {include file="$TMP/User/Settings/sidebar.tpl"}
                                                    </div>
                                                </div>
                                            </div>
								</div>
								<hr>
						</div>
					</div>
				</div>
				</div>
			</div>
        </div>
    </section>
{include file="$TMP/Layout/footer.tpl"}