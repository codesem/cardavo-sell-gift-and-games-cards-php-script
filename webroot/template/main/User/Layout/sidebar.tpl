                        <!-- =========================
                           Sidbar Section
                        ============================== -->
                        <div class="empty-h on-phone"></div>
                        <div class="card category category-md">
                            <div class="card-header">
                                      <h5 class="title"><i class="fa fa-bullhorn"></i> {$_ANNOUNCEMENTS}</h5>
                            </div>
                            
                            <div class="list-group">
                              {if $announcements} 
                                {foreach from=$announcements item=foo}
                                <a href="{$foo['link']}" class="list-group-item list-group-item-action"><i class="fa fa-bullhorn"></i> {$foo['title']}</a>
                               {/foreach}
                              {/if}
                            </div>
                        </div>
                        <div class="empty-h"></div>