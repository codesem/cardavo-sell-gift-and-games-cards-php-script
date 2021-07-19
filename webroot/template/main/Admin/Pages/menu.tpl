
    <div class="tab">
      <a href="{$ADM}pages/index"><button {if isset($pages)} class="tablinks active"{/if}><div class="fa fa-files-o"></div> Pages</button></a>
      <a href="{$ADM}pages/add"><button {if !isset($pages)} class="tablinks active"{/if}><div class="fa fa-plus-circle"></div> Add Page</button></a>
    </div>
    <hr>