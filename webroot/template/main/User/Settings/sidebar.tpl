                    <!-- =========================
                        Sidbar Section
                        ============================== -->
                        
                        <div class="empty-h on-phone"></div>
                        <div class="list-group">
                            <a href="{$USR}settings" class="list-group-item list-group-item-action {if $personal}active{/if}"><i class="fa fa-user"></i> Personal Information</a>
                            <a href="{$USR}settings?r=password" class="list-group-item list-group-item-action {if $password}active{/if}"><i class="fa fa-lock"></i> Change Your Password</a>
                            <a href="{$USR}settings?r=notification" class="list-group-item list-group-item-action {if $notification}active{/if}"><i class="fa fa-bell"></i> E-mail Notifications</a>
                        </div>
                        <div class="empty-h"></div>