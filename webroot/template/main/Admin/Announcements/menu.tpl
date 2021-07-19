
    <div class="tab">
      <a href="{$ADM}announcements/index"><button {if isset($announcements)} class="tablinks active"{/if}><div class="fa fa-bullhorn"></div> Announcements</button></a>
      <a href="{$ADM}announcements/add"><button {if !isset($announcements)} class="tablinks active"{/if}><div class="fa fa-plus-circle"></div> Add Announcement</button></a>
    </div>
    <hr>