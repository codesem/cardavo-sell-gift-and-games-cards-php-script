{include file='../Layout/header.tpl'}

                        <div class="row">
                        <div class="col-md-12">
                                <div class="card-box">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="text-center">
                                            {if !$prmcode}
                                                <div class="badge badge-danger"><i class="fa fa-star"></i> Go Premium To Unlock All Features <a class="blue-color" href="{$ADM}activation">(activation page)</a>
                                                </div>
                                            {else}
                                                <div class="badge badge-danger"><i class="fa fa-refresh"></i> TIP: Always check new updates on the <a class="blue-color" href="{$ADM}updates/index">(update page)</a>
                                                </div>
                                            {/if}
                                            </div>
                                             <hr>
                                              <div class="col-xl-2 col-md-4">
                                                 <div class="card-box widget-box-two widget-two-success">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Users Deposit">Users Deposit  <small>(Today)</small></p>
                                                      <h2><i class="fa fa-money"></i> <span>{$users_deposit}</span></h2>
                                                    </div>
                                                  </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-primary">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Orders Today">Orders <small>(Today)</small></p>
                                                     <h2><i class="fa fa-database"></i> <span data-plugin="counterup">{$users_orders}</span> <small>({$users_orders_amount})</small></h2>
                                                      </div>
                                                     </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                               <div class="card-box widget-box-two widget-two-danger">
                                                 <div class="wigdet-two-content">
                                                  <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Products">Products <small >(TOTAL)</small></p>
                                                  <h2><i class="fa fa-shopping-cart"></i> <span data-plugin="counterup">{$admin_products}</span></h2>
                                                  </div>
                                                 </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                <div class="card-box widget-box-two widget-two-pink">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Users">Users <small>(Total)</small></p>
                                                     <h2><i class="fa fa-users"></i> <span data-plugin="counterup">{$users}</span></h2>
                                                      </div>
                                                     </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                                 <div class="card-box widget-box-two widget-two-warning">
                                                   <div class="wigdet-two-content">
                                                     <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Codes">Codes <small>(Total)</small></p>
                                                      <h2><i class="fa fa-lock"></i> <span data-plugin="counterup">{$admin_codes}</span></h2>
                                                    </div>
                                                  </div>
                                                </div>
                                              <div class="col-xl-2 col-md-4">
                                               <div class="card-box widget-box-two widget-two-purple">
                                                 <div class="wigdet-two-content">
                                                  <p class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Categories">Categories <small >(Total)</small></p>
                                                  <h2><i class="fa fa-sitemap"></i> <span data-plugin="counterup">{$admin_categories}</span></h2>
                                                  </div>
                                                 </div>
                                                </div>
                                        </div><!-- end col -->
                                         <hr>
                                              <div class="text-center">
                                                  <a href="{$ADM}users/index" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-users"></i> Users</a>
                                                  <a href="{$ADM}orders/index" class="btn btn-info waves-effect w-md m-b-5"><i class="fa fa-database"></i> Orders</a>
                                                  <a href="{$ADM}invoices/index" class="btn btn-danger waves-effect w-md m-b-5"><i class="fa fa-bank"></i> Invoices</a>
                                                  <a href="{$ADM}categories/index" class="btn btn-primary waves-effect w-md m-b-5"><i class="fa fa-sitemap"></i> Categories</a>
                                              </div>
                                    </div><!-- end row -->

                                                </div> <!-- end card -->
                                        
                            
                            </div>

                            <!-- end col -->
                        </div>
                        <!-- end row -->

 

{include file='../Layout/footer.tpl'}