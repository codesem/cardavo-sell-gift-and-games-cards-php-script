                        <div class="empty-h on-phone"></div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="title"><i class="fa fa-bars"></i> {$_LINKS}</h5>
                            </div>
                            
                            <div class="list-group">
                                <a href="{$HOST}signin" class="list-group-item list-group-item-action {if $signin}active{/if}"><i class="fa fa-sign-in" aria-hidden="true"></i> {$_SIGN_IN}</a>
                                <a href="{$HOST}signup" class="list-group-item list-group-item-action {if $signup}active{/if}"><i class="fa fa-user-plus" aria-hidden="true"></i> {$_SIGN_UP}</a>
                                <a href="{$HOST}forgot-password" class="list-group-item list-group-item-action {if $forgot_password}active{/if}"><i class="fa fa-refresh" aria-hidden="true"></i> {$_FORGOT_PASSWORD}</a>
                            </div>
                        </div>
                        <div class="empty-h"></div>
                        
                        <!-- =========================
                             RECAPTCHA JS TAG
                        ============================== -->
                        <script src='https://www.google.com/recaptcha/api.js'></script>
