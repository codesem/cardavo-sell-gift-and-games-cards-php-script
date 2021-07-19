    
    <div class="tab">
      <a href="{$ADM}categories/index"><button {if isset($categories)} class="tablinks active"{/if}><i class="fa fa-sitemap"></i> Categories</button></a>
      <a href="{$ADM}categories/add"><button {if !isset($categories)} class="tablinks active"{/if}><i class="fa fa-plus-circle"></i> Add Category</button></a>
    </div>
    <hr>