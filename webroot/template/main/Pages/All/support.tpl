{include file="$TMP/Layout/header.tpl"}

    <!-- =========================
        RECAPTCHA JS TAG
    ============================== -->
    <script src='https://www.google.com/recaptcha/api.js'></script>
    
    <!-- =========================
        support Section
    ============================== -->
    <section class="product-shop-page">
		<div class="container"><br>
			<div class="row">
			    <div class="col-12 col-md-8 col-lg-9">
			        <div class="row">
			            <div class="col-sm-12">
			                {if $sent}<div class="alert alert-{$_CONTACT_SENT}">{$__CONTACT_SENT}</div>{/if}
			                {if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}
			                {if $recaptcha}<div class="alert alert-{$_RECAPTCHA}">{$__RECAPTCHA}</div>{/if}
                            <form method="POST">
                                <input type="hidden" name="csrf" value="{$csrfToken}" />
                                <input type="hidden" name="contact" value="contact" />
                                
                                <div class="card">
                                    <div class="card-header box-grey">
                                        <span class="title"><i class="fa fa-envelope"></i> {$_SUPPORT}</span>
                                    </div>
                                    <div class="card-body">
                                        <div class="col-12">
                                          <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="Name" class="color-black">{$_NAME} *</label>
                                                    <input type="text" name="name" {if $logged}value="{$f_name} {$l_name}"{/if} maxlength="100" required="" placeholder="Full Name" class="form-control" autocomplete="disabled">
											        <em><small>{$_YOUR_FULL_NAME}</small></em>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_EMAIL} *</label>
                                                    <input type="text" name="mail" {if $logged} value="{$email}"{/if} required="" placeholder="{$_EMAIL}" class="form-control" autocomplete="disabled">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_SUBJECT} *</label>
                                                    <input type="text" name="subject" required="" placeholder="{$_SUBJECT}" class="form-control" autocomplete="disabled">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_MESSAGE} *</label>
                                                    <textarea type="text" name="message" rows="8" required="" placeholder="{$_MESSAGE}" class="form-control rteditor" data-toolbar="minimal">{$js_description}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="last" class="color-black">{$_PROVE_YOUR_HUMAN} *</label>
                                                    <div id="recaptcha-widget" class="g-recaptcha" data-sitekey="{do_config(4)}"></div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <button type="submit" class="btn btn-primary btn-btx wd-shop-btn"><i class="fa fa-chevron-circle-right"></i> {$_SUBMIT}</button>
                                            </div>
                                         </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="empty-h"></div>
                           </from>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 col-lg-3">
                    <!-- =========================
                        Sidbar Section
                        ============================== -->
                        <div class="empty-h on-phone"></div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="title"><i class="fa fa-question-circle-o"></i> {$_ABOUT_US}</h5>
                            </div>
                            <div class="card-body">
								<p><i class="fa fa-map-marker"></i> <strong class="green-color">{do_config(32)}</strong></p>
								<div class="empty-h"></div>
								<p><i class="fa fa-envelope"></i> <strong><a class="green-color" href="mailto:{do_config(12)}">{do_config(12)}</a></strong></p>
                            </div>
                        </div>
                        <div class="empty-h"></div>
                </div>
            </div>
        </div>
    </section>

{include file="$TMP/Layout/footer.tpl"}