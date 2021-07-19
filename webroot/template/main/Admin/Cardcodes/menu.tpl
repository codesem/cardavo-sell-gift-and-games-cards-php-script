
    <div class="tab">
      <a href="{$ADM}cardcodes/index"><button {if isset($cardcodes)} class="tablinks active"{/if}><div class="fa fa-credit-card"></div> Card Codes</button></a>
      <a href="{$ADM}cardcodes/add"><button {if !isset($cardcodes)} class="tablinks active"{/if}><div class="fa fa-plus-circle"></div> Add Codes</button></a>
    </div>
    <hr>