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
			                {if $confirm}<div class="alert alert-{$_PASS_NOTMATCH}">{$__PASS_NOTMATCH}</div>{/if}
			                {if $required}<div class="alert alert-danger">{$__REQUIRED}</div>{/if}
			                <div class="card">
                                <div class="card-header box-grey">
                                    <span class="title"><i class="fa fa-refresh"></i> {$_RESET_PASSWORD}</span>
                                </div>
                                <div class="card-body">
                                    <div class="col-12">
                                        <form method="POST">

                                            <input type="hidden" name="reset" value="reset" />
                                            <input type="hidden" name="csrf" value="{$csrfToken}" />
                                            <input type="hidden" name="username" value="{$reset_username}" />

                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_NEW_PASSWORD} *</label>
                                                    <input type="password" name="newpass" required="" placeholder="{$_NEW_PASSWORD}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_RETYPE_NEW_PASSWORD} *</label>
                                                    <input type="password" name="confnewpass" required="" placeholder="{$_RETYPE_NEW_PASSWORD}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-primary btn-btx wd-shop-btn"><i class="fa fa-refresh" aria-hidden="true"></i>  {$_SUBMIT}</button>
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