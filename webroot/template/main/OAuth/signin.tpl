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
			                {if $blocked_ip}<div class="alert alert-{$_IP_BLOCKED}">{$__IP_BLOCKED}</div>{/if}
			                {if $recaptcha}<div class="alert alert-{$_RECAPTCHA}">{$__RECAPTCHA}</div>{/if}
			                {if $pending}<div class="alert alert-{$_PENDING}">{$__PENDING}</div>{/if}
			                {if $banned}<div class="alert alert-{$_BANNED}">{$__BANNED}</div>{/if}
			                {if $invalid}<div class="alert alert-{$_INVALID}">{$__INVALID}</div>{/if}
			                {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
			                {if $express_login}<div class="alert alert-{$_EXPRESS}">{$__EXPRESS}</div>{/if}
			                <div class="card">
                                <div class="card-header box-grey">
                                    <span class="title"><i class="fa fa-sign-in"></i> {$_SIGN_IN}</span>
                                </div>
                                <div class="card-body">
                                    <div class="col-12">
                                        <form class="form-horizontal" method="POST">

                                            <input type="hidden" name="login" value="login" />
                                            <input type="hidden" name="csrf" value="{$csrfToken}" />
                                            
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_USERNAME} *</label>
                                                    <input type="text" name="username" required="" placeholder="{$_USERNAME}" class="form-control" autocomplete="disabled">
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_PASSWORD} *</label>
                                                    <input type="password" name="password" required="" placeholder="{$_PASSWORD}" class="form-control" autocomplete>
                                                </div>
                                            </div>
                                     {if do_config(27) == 1}
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_PROVE_YOUR_HUMAN} *</label>
                                                    <div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{do_config(4)}"></div>
                                                </div>
                                            </div>
                                     {/if}
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                   <label class="checkbox-container"><small>{$_REMEMBER_ME}</small>
                                                    <input type="checkbox" name="remember_me" value="on" checked>
                                                    <span class="checkmark"></span>
                                                   </label>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-primary btn-btx wd-shop-btn"><i class="fa fa-arrow-right" aria-hidden="true"></i>  {$_SIGN_IN}</button>
                                            </div><hr>
                                            <div class="wd-policy">
                                                <p>{$_NO_ACCOUNT} <a href="{$HOST}signup" class="black-color"><strong><u>{$_SIGN_UP}</u></strong></a> | <a href="{$HOST}forgot-password" class="black-color"><strong><u>{$_FORGOT_PASSWORD}</u></strong></a></p>
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