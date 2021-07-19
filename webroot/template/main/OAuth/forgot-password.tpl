{include file="$TMP/Layout/header.tpl"}

    <!-- =========================
        OAuth Section
    ============================== -->
    <section class="product-shop-page">
		<div class="container">
		    
		    <br>
			<div class="row">
			    <div class="col-12 col-md-8 col-lg-9">
			        <div class="row">
			            <div class="col-sm-12">
			                {if $sent}<div class="alert alert-{$_SENT}">{$__SENT}</div>{/if}
			                {if $recaptcha}<div class="alert alert-{$_RECAPTCHA}">{$__RECAPTCHA}</div>{/if}
			                {if $not_found}<div class="alert alert-{$_USRNOT_FOUND}">{$__USRNOT_FOUND}</div>{/if}
			                {if $recovered}<div class="alert alert-{$_RECOVERED}">{$__RECOVERED}</div>{/if}
			                {if $inrecover}<div class="alert alert-{$_INRECOVER}">{$__INRECOVER}</div>{/if}
			                {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
			                <div class="card">
                                <div class="card-header box-grey">
                                    <span class="title"><i class="fa fa-refresh"></i> {$_FORGOT_PASSWORD}</span>
                                </div>
                                <div class="card-body">
                                    <div class="col-12">
                                        <div class="alert alert-warning"><i class="fa fa-bell"></i> {$__FORGOT_PASSWORD}</div><hr>
                                        <form class="form-horizontal" method="POST">

                                            <input type="hidden" name="rec" value="rec" />
                                            <input type="hidden" name="csrf" value="{$csrfToken}" />
                                            
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_USERNAME} *</label>
                                                    <input type="text" name="username" required="" placeholder="{$_USERNAME}" class="form-control" autocomplete="disabled">
                                                </div>
                                            </div>
                                     {if do_config(28) == 1}
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_PROVE_YOUR_HUMAN} *</label>
                                                    <div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{do_config(4)}"></div>
                                                </div>
                                            </div>
                                     {/if}
                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-primary btn-btx wd-shop-btn"><i class="fa fa-refresh" aria-hidden="true"></i>  {$_RECOVER}</button>
                                            </div>
                                     
                                    </form>
                                    </div>
                                </div>
                           </div><br>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-lg-3">
                    <!-- =========================
                        Sidbar Section
                        ============================== -->
                        {include file="$TMP/OAuth/menu.tpl"}
                </div>
            </div>
        </div>
    </section>

{include file="$TMP/Layout/footer.tpl"}