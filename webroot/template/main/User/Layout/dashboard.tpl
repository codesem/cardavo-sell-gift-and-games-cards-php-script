{include file="$TMP/Layout/header.tpl"}

    <!-- =========================
        Product Details Section
    ============================== -->
    <section class="product-details">
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
								            <div class="card">
								                <div class="card-header box-grey">
								                    <h5 class="title"><i class="fa fa-area-chart"></i> {$_STATISTICS}</h5>
								                </div>
								                <div class="row">
								                    <div class="col-md-12">
								                        <div class="text-center">
								                            <div class="card pull-left col-lg-6">
								                                <div class="card-body">
								                                    <p class="username-profile"><i class="fa fa-dollar"></i> {$_BALANCE} <small>({$_TOTAL})</small></p>
								                                    <div class="empty-h"></div>
								                                    <p class="card-text"><h6 class="green-color">{$balance}</h6></p>
								                                    </div>
								                            </div>
                                                            <div class="card pull-right col-lg-6">
                                                                <div class="card-body">
                                                                    <p class="username-profile"><i class="fa fa-arrow-down"></i> {$_DEPOSIT} <small>({$_MONTH})</small></p>
                                                                    <div class="empty-h"></div>
                                                                    <p class="card-text"><h6 class="green-color">{$userdeposit}</h6></p>
                                                                </div>
                                                            </div>
                                                            <div class="card pull-left col-lg-6">
                                                                <div class="card-body">
                                                                    <p class="username-profile"><i class="fa fa-download"></i> {$_ORDERS} <small>({$_MONTH})</small></p>
                                                                    <div class="empty-h"></div>
                                                                    <p class="card-text"><h6 class="green-color">{$userorders}</h6></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
				                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4 col-lg-3 ">
                                            {include file="$TMP/User/Layout/sidebar.tpl"}
                                        </div>
                                    </div>
                                    </div>
								</div>
							
						</div>
					</div>
				</div>
				</div>
			</div>
        </div>
    </section>
{include file="$TMP/Layout/footer.tpl"}