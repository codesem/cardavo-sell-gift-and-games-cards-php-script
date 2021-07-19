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
						    {if !$invoices}
								    <div class="alert alert-warning"><i class="fa fa-warning"></i> {$_NO_RECORDS_WERE_FOUND}</div>
						    {else}
								    <table class="table">
								       <thead class="thead-dark-hard">
								           <tr>
								              <th scope="col">#</th>
								              <th scope="col">{$_AMOUNT}</th>
								              <th scope="col"> {$_METHOD}</th>
								              <th scope="col" class="on-desktop"> {$_DATE}</th>
								              <th scope="col"> {$_STATUS}</th>
								              <th scope="col" class="on-desktop"> {$_ACTIONS}</th>
								           </tr>
								      </thead>
								      <tbody>
							{/if}
	                        {foreach from=$invoices item=foo}
								        <tr>
                                          <th scope="row" class="black-color">{$foo['id']}</th>
                                          <td class="green-color">{$foo['amount']}</td>
                                          <td>
                                              <span class="badge badge-info text-uppercase">{$foo['method']}</span>
                                          </td>
                                          <td class="on-desktop">{$foo['created']}</td>
                                          <td>
                            {if $foo['status'] == 'on'}
			        					  <div class="green-color"><i class="fa fa-check" aria-hidden="true"></i> {$_PAID}</div>
                            {elseif $foo['status'] == 'off'}
			        					  <div class="red-color"><i class="fa fa-times" aria-hidden="true"></i> {$_UNPAID}</div>
                            {/if}
			        				      </td>
                            {if $foo['status'] == 'off'}
                                          <td class="on-desktop">
                                              <a href="{$USR}deposit" class="btn btn-primary select-market-btn">
											    {$_PAY} <i class="fa fa-arrow-right" aria-hidden="true"></i>
											  </a>
										  </td>
							 {/if}
                                        </tr>
                            {/foreach}
                                      </tbody>
                                    </table>
                            {if $paging && $invoices}
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