{include file="$TMP/Layout/header.tpl"}

    <!-- =========================
        Product Details Section
    ============================== -->
    <section class="product-details wishlist-table">
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
			                {if $sent}<div class="alert alert-{$_CONTACT_SENT}">{$__CONTACT_SENT}</div>{/if}
						    {if !$support_tickets}
								    <div class="alert alert-warning"><i class="fa fa-warning"></i> {$_NO_RECORDS_WERE_FOUND}</div>
						    {else}
								    <table class="table">
								       <thead class="thead-dark-hard">
								           <tr>
								              <th scope="col" class="on-desktop">#</th>
								              <th scope="col"> {$_SUBJECT}</th>
								              <th scope="col"> {$_STATUS}</th>
								              <th scope="col" class="on-desktop"> {$_DATE}</th>
								              <th scope="col"> {$_ACTIONS}</th>
								           </tr>
								      </thead>
								      <tbody>
							{/if}
	                        {foreach from=$support_tickets item=foo}
								        <tr>
                                          <th scope="row" class="black-color on-desktop">{$foo['id']}</th>
                                          <td class="black-color">{$foo['subject']}</td>
                                          <td>
                            {if $foo['status'] == 'open'}
			        					  <div class="green-color"><i class="fa fa-history" aria-hidden="true"></i> {$_OPEN}</div>
                            {elseif $foo['status'] == 'answered'}
			        					  <div class="blue-color"><i class="fa fa-check-circle" aria-hidden="true"></i> {$_ANSWERED}</div>
                            {elseif $foo['status'] == 'closed'}
			        					  <div class="red-color"><i class="fa fa-times" aria-hidden="true"></i> {$_CLOSED}</div>
                            {/if}
			        				      </td>
                                          <td class="on-desktop">{$foo['created']}</td>
                                          <td>
                                              <a href="{$USR}ticket/{$foo['id']}/" class="btn btn-primary select-market-btn">
											    {$_VIEW} <i class="fa fa-arrow-right" aria-hidden="true"></i>
											</a>
										  </td>
                                        </tr>
                            {/foreach}
                                      </tbody>
                                    </table>
                            {if $paging && $support_tickets}
                                    <nav aria-label="navigation">
                                       <ul class="pagination justify-content-center">{$paging}</ul>
                                    </nav>
                            {/if}
                                       </div>
                                        <div class="col-12 col-md-4 col-lg-3 ">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5 class="title"><i class="fa fa-support"></i> {$_HELP}</h5>
                                                </div>
                                                <div class="card-body">
                                                    <div class="text-center">
                                                        <i class="fa fa-flag icon-big"></i> {$__SUPPORT}
                                                        <hr class="empty-h">
                                                        <a class="active-color" href="{$HOST}contact">[{$_OPEN_NEW_TICKET}]</a>.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="empty-h"></div>
                                            {include file="$TMP/User/Layout/sidebar.tpl"}
                                            <div class="empty-h"></div>
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