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
								                                                <h5 class="title"><i class="fa fa-user"></i> {$_PERSONAL_INFORMATION}</h5>
								                                            </div>
								                                            <div class="card-body">
								                                                <div class="col-12">
								                                              <div class="row">
								                                                  <!-- =================================
								                                                       PERSONAL INFORMATION
								                                                       ================================= -->
								                                                       <div class="review-comment-section">
								                                                           <div class="row">
								                                                               <div class="col-12 col-md-12 col-lg-12 col-xl-8">
								                                                                   {if $personal}<div class="alert alert-{$_PERSONAL}">{$__PERSONAL}</div>{/if}
								                                                                   {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
								                                                                   {if $email_exist}<div class="alert alert-{$_EXIST}">{$__EXIST}</div>{/if}
								                                                                   
								                                                                   <form  method="POST">
								                                                                       <div class="row">
								                                                                           
								                                                                           <input type="hidden" name="settings" value="settings" />
								                                                                           <input type="hidden" name="csrf" value="{$csrfToken}" />
								                                                                           
								                                                                           <div class="col-md-6">
								                                                                               <div class="form-group">
								                                                                                   <label for="last" class="color-black">{$_EMAIL_ADDRESS} *</label>
								                                                                                   <input type="email" name="email" class="form-control" value="{$email}" autocomplete="disabled">
								                                                                               </div>
								                                                                           </div>
								                                                                           <div class="col-md-6">
								                                                                               <div class="form-group">
								                                                                                   <label for="first" class="color-black">{$_FIRST_NAME} *</label>
								                                                                                   <input type="text" name="first_name" class="form-control" value="{$first_name}" autocomplete="disabled">
								                                                                               </div>
								                                                                           </div>
								                                                                           <div class="col-md-6">
								                                                                               <div class="form-group">
								                                                                                   <label for="first" class="color-black">{$_LAST_NAME} *</label>
								                                                                                   <input type="text" name="last_name" class="form-control" value="{$last_name}" autocomplete="disabled">
								                                                                               </div>
								                                                                           </div>
								                                                                           <div class="col-md-6">
								                                                                               <div class="form-group">
								                                                                                   <label for="country" class="color-black">{$_COUNTRY} *</label>
								                                                                                   <select name="country" class="form-control col-md-12">
								                                                                                {foreach from=$countries item=foo}
								                                                                                       <option value="{$foo}"{if $country == $foo} selected="selected"{/if}>{$foo}</option>
								                                                                                {/foreach}
								                                                                                    </select>
								                                                                                </div>
								                                                                            </div>
								                                                                            <div class="col-md-6">
								                                                                                <div class="form-group">
								                                                                                    <label for="AddressOne" class="color-black">{$_ADDRESS_LINE_ONE} </label>
								                                                                                    <textarea name="address_one" class="form-control">{$address_one}</textarea>
								                                                                                </div>
								                                                                            </div>
								                                                                            <div class="col-md-6">
								                                                                                <div class="form-group">
								                                                                                    <label for="AddressTwo" class="color-black">{$_ADDRESS_LINE_TWO}</label>
								                                                                                    <textarea name="address_two" class="form-control">{$address_two}</textarea>
								                                                                                </div>
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