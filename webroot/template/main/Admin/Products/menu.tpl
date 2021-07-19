    <div class="tab">
      <a href="{$ADM}products/index"><button {if isset($products)} class="tablinks active"{/if}><i class="fa fa-bars"></i> Products</button></a>
      <a href="{$ADM}products/add"><button {if !isset($products) && !isset($prices)} class="tablinks active"{/if}><i class="fa fa-plus-circle"></i> Add Product</button></a>
      <a href="{$ADM}products/comments"><button {if isset($comments)} class="tablinks active"{/if}><div class="fa fa-comment"></div> Comments</button></a>
      <a href="{$ADM}products/reviews"><button {if isset($reviews)} class="tablinks active"{/if}><div class="fa fa-star"></div> Reviews</button></a>
    </div>
    <hr>