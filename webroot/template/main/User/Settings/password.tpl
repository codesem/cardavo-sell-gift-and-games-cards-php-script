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
								                                                <h5 class="title"><i class="fa fa-lock"></i> {$_CHANGE_YOUR_PASSWORD}</h5>
								                                            </div>
								                                            <div class="card-body">
								                                                <div class="col-12">
								                                              <div class="row">
								                                                  <!-- =================================
								                                                       Account Section
								                                                       ================================= -->
								                                                       <div class="review-comment-section">
								                                                           <div class="row">
								                                                               <div class="col-12 col-md-12 col-lg-12 col-xl-8">
								                                                                   {if $do_demo}<div class="alert alert-danger">Error: You can't do this action on demo mode.</div>{/if}
								                                                                   {if $pass}<div class="alert alert-{$_PASS_CHANGED}">{$__PASS_CHANGED}</div>{/if}
								                                                                   {if $confirm}<div class="alert alert-{$_PASS_NOTMATCH}">{$__PASS_NOTMATCH}</div>{/if}
								                                                                   {if $unchange}<div class="alert alert-{$_PASS_UNCHANGE}">{$__PASS_UNCHANGE}</div>{/if}
								                                                                   {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
								                                                                   
								                                                                   <form  method="POST">
								                                                                       <div class="row">
								                                                                           
								                                                                           <input type="hidden" name="pass" value="pass" />
								                                                                           <input type="hidden" name="csrf" value="{$csrfToken}" />
								                                                                           
								                                                                           <div class="col-md-12">
								                                                                               <div class="form-group">
								                                                                                   <label for="last" class="color-black">{$_CURRENT_PASSWORD} *</label>
								                                                                                   <input type="password" name="prepass" class="form-control" placeholder="{$_CURRENT_PASSWORD}" autocomplete="disabled">
								                                                                               </div>
								                                                                           </div>
								                                                                           <div class="col-md-12">
								                                                                               <div class="form-group">
								                                                                                   <label for="first" class="color-black">{$_NEW_PASSWORD} *</label>
								                                                                                   <input type="password" name="newpassword" class="form-control" placeholder="{$_NEW_PASSWORD}" autocomplete="disabled">
								                                                                               </div>
								                                                                           </div>
								                                                                           <div class="col-md-12">
								                                                                               <div class="form-group">
								                                                                                   <label for="first" class="color-black">{$_RETYPE_NEW_PASSWORD} *</label>
								                                                                                   <input type="password" name="confnewpassword" class="form-control" placeholder="{$_RETYPE_NEW_PASSWORD}" autocomplete="disabled">
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
						</div>
					</div>
				</div>
				</div>
			</div>
        </div>
    </section>
                
{include file="$TMP/Layout/footer.tpl"}