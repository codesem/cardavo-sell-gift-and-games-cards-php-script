{include file="$TMP/Layout/header.tpl"}
               
 {foreach from=$orders item=foo}
          <div class="product-view-modal modal fade bd-example-modal-lg-product-{$foo['id']}" tabindex="-{$foo['id']}" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-12">
								    <table class="table">
								       <thead class="thead-dark-hard">
								           <tr>
								              <th scope="col"> {$_PRODUCT}</th>
								              <th scope="col"> {$_AMOUNT}</th>
								              <th scope="col"> {$_CODE}</th>
								           </tr>
								      </thead>
								      <tbody>
                        {foreach from=$foo['code_orders'] item=coo}
								        <tr>
                                          <td>{$coo['name']}</td>
                                          <td class="green-color">{$coo['amount']}</td>
                                          <td class="black-color">{$coo['code']}</td>
                                        </tr>
                        {/foreach}
                                      </tbody>
                                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
 {/foreach}
               
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
						    {if !$orders}
								    <div class="alert alert-warning"><i class="fa fa-warning"></i> {$_NO_RECORDS_WERE_FOUND}</div>
						    {else}
								    <table class="table">
								       <thead class="thead-dark-hard">
								           <tr>
								              <th scope="col">#</th>
								              <th scope="col"> {$_AMOUNT}</th>
								              <th scope="col"> {$_DATE}</th>
								              <th scope="col"> {$_ACTIONS}</th>
								           </tr>
								      </thead>
								      <tbody>
							{/if}
	                       {foreach from=$orders item=foo}
								        <tr>
                                          <th scope="row" class="black-color">{$foo['id']}</th>
                                          <td class="green-color">{$foo['amount']}</td>
                                          <td>{$foo['created']}</td>
                                          <td>
                                              <a href="#!" data-toggle="modal" data-target=".bd-example-modal-lg-product-{$foo['id']}" class="btn btn-primary select-market-btn">
											    {$_CODES} <i class="fa fa-arrow-right" aria-hidden="true"></i>
											</a>
										  </td>
                                        </tr>
                           {/foreach}
                                      </tbody>
                                    </table>
                        {if $paging && $orders}
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