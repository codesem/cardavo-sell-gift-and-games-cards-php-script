{include file="$TMP/Layout/header.tpl"}

    <!-- =========================
        Slider Section
    ============================== -->
    <section id="main-slider-section" class="review-slider-section coupon-bc">
		<div class="container">
			<div class="review-search-slider-section row justify-content-center">
                <div class="col-12 col-lg-12">
                    <h1 class="review-slider-title"> {$title}</h1>
                </div>
                <div class="col-12 col-lg-12 col-xl-12 slider-search-section sliderhome-search on-desktop">
                  <form action="{$HOST}search" method="GET">
                   <div class="input-group wd-btn-group header-search-option">
                        <input type="text" name="term" class="form-control" placeholder="{$_SEARCH_FOR_PRODUCTS}" aria-label="{$_SEARCH_FOR_PRODUCTS}">
                        <span class="input-group-btn">
                            <button type="submit" class="btn btn-secondary wd-btn-search">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </form>
                </div>
                <div class="col-12 col-lg-12 col-xl-12 on-phone">
                  <form action="{$HOST}search" method="GET">
                   <div class="input-group wd-btn-group header-search-option">
                        <input type="text" name="term" class="form-control" placeholder="{$_SEARCH_FOR_PRODUCTS}" aria-label="{$_SEARCH_FOR_PRODUCTS}">
                        <span class="input-group-btn">
                            <button type="submit" class="btn btn-secondary wd-btn-search">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </form>
                </div>
			</div>
		</div>
    </section>
    <br><br>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
				    <div class="card col-sm-12">
				          <div class="card-body">
				              {$content}
				          </div>
				    </div>
				</div>
			</div>
		</div>
	</section>
	<br><br>
          
{include file="$TMP/Layout/footer.tpl"}