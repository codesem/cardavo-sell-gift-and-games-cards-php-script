{include file="$TMP/Layout/header.tpl"}

    <!-- =========================
        OAuth Section
    ============================== -->
    <section class="product-shop-page">
		<div class="container"><br>
			<div class="row">
			    <div class="col-12 col-md-8 col-lg-9">
			        <div class="row">
			            <div class="col-sm-12">
			                {if $whitespace}<div class="alert alert-{$_WHITESPACE}">{$__WHITESPACE}</div>{/if}
			                {if $blocked_ip}<div class="alert alert-{$_IP_BLOCKED}">{$__IP_BLOCKED}</div>{/if}
			                {if $rep_username}<div class="alert alert-{$_REPEAT}">{$__REPEAT}</div>{/if}
			                {if $passwords}<div class="alert alert-{$_PASSWORDS}">{$__PASSWORDS}</div>{/if}
			                {if $rep_email}<div class="alert alert-{$_EXIST}">{$__EXIST}</div>{/if}
			                {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
			                {if $recaptcha}<div class="alert alert-{$_RECAPTCHA}">{$__RECAPTCHA}</div>{/if}
			                <div class="card">
                                <div class="card-header box-grey">
                                    <span class="title"><i class="fa fa-user-plus"></i> {$_SIGN_UP}</span>
                                </div>
                                <div class="card-body">
                                    <div class="col-12">
                                        <form method="POST">
                                          <div class="row">
                                            <input type="hidden" name="register" value="register" />
                                            <input type="hidden" name="csrf" value="{$csrfToken}" />
                                          
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_USERNAME} *</label>
                                                    <input type="text" name="username" required="" placeholder="{$_USERNAME}" class="form-control" id="username" onBlur="checkAvailability()" autocomplete="disabled">
                                                    <h6 style="display: inline-block;"><i class="fa fa-spinner" id="loader-availability" style="display: none;"></i></h6>
                                                    <span id="user-availability-status"></span> 
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_EMAIL_ADDRESS} *</label>
                                                    <input  type="email" name="email" required="" placeholder="{$_EMAIL_ADDRESS}" class="form-control" autocomplete="disabled">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_FIRST_NAME} *</label>
                                                    <input type="text" name="first_name"  required="" placeholder="{$_FIRST_NAME}" class="form-control" autocomplete="disabled">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_LAST_NAME} *</label>
                                                    <input type="text" name="last_name" required="" placeholder="{$_LAST_NAME}" class="form-control" autocomplete="disabled">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_PASSWORD} *</label>
                                                    <input type="password" name="password"  required="" placeholder="{$_PASSWORD}" class="form-control" autocomplete>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_CONFIRM_PASSWORD} *</label>
                                                    <input type="password" name="passwordcheck" required="" placeholder="{$_CONFIRM_PASSWORD}" class="form-control" autocomplete>
                                                </div>
                                            </div>
                                     {if do_config(26) == 1}
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_PROVE_YOUR_HUMAN} *</label>
                                                    <div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{do_config(4)}"></div>
                                                </div>
                                            </div>
                                     {/if}
                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-primary btn-btx wd-shop-btn"><i class="fa fa-user-plus" aria-hidden="true"></i>  {$_SIGN_UP}</button>
                                            </div>
                                         </div><hr>
                                            <div class="wd-policy">
                                                <p>{$_ALREADY_HAVE_AN_ACCOUNT} <a href="{$HOST}signin" class="black-color"><strong><u>{$_SIGN_IN}</u></strong></a></p>
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