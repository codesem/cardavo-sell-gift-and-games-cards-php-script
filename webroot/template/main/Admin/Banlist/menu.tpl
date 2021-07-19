
    <div class="tab">
      <a href="{$ADM}banlist/index"><button {if isset($banlist)} class="tablinks active"{/if}><div class="fa fa-ban"></div> Detected IP(s)</button></a>
      <a href="{$ADM}banlist/add"><button {if !isset($banlist)} class="tablinks active"{/if}><div class="fa fa-plus-circle"></div> Add IP(s)</button></a>
    </div>
    <hr>