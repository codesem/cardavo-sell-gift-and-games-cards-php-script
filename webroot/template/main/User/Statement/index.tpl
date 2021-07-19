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
						    {if !$fnotifications}
								    <div class="alert alert-warning"><i class="fa fa-warning"></i> {$_NO_RECORDS_WERE_FOUND}</div>
						    {else}
								    <table class="table">
								       <thead class="thead-dark-hard">
								           <tr>
								              <th scope="col">#</th>
								              <th scope="col" class="on-desktop"> {$_DATE}</th>
								              <th scope="col"> {$_TITLE}</th>
								              <th scope="col"> {$_TYPE}</th>
								              <th scope="col" class="on-desktop"> {$_DETAIL}</th>
								           </tr>
								      </thead>
								      <tbody>
							{/if}
	                        {foreach from=$fnotifications item=foo}
								        <tr>
                                          <th scope="row" class="black-color">{$foo['id']}</th>
                                          <td class="on-desktop">{$foo['created']}</td>
                                          <td>
                                        {if $foo['type'] == 'deposit'}
                                            <p>{$__WAS_CREDITED}</p>
                                        {elseif $foo['type'] == 'order'}
                                            <p>{$__ORDER_PURCHASED}</p>
                                        {elseif $foo['type'] == 'support'}
                                            <p>{$__NEW_REPLY}</p>
                                        {/if}
                                          </td>
                                          <td>
                                              <span class="badge badge-info text-uppercase">{$foo['type']}</span>
                                          </td>
                                          <td class="on-desktop">
                                        {if $foo['type'] == 'deposit'}
                                            <p>{$_DEPOSIT} {$foo['amount']} </p>
                                        {elseif $foo['type'] == 'order'}
                                            <p>{$_ORDER} {$foo['amount']}</p>
                                        {elseif $foo['type'] == 'support'}
                                            <p>{$_YOUR_TICKET_ANSWERED}</p>
                                        {/if}
                                          </td>
                                        </tr>
                            {/foreach}
                                      </tbody>
                                    </table>
                            {if $paging && $fnotifications}
                                    <nav aria-label="navigation">
                                       <ul class="pagination justify-content-center">{$paging}</ul>
                                    </nav>
                            {/if}
                                       </div>
                                                <div class="col-12 col-md-4 col-lg-3 ">
                                                    {include file="$TMP/User/Layout/sidebar.tpl"}
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