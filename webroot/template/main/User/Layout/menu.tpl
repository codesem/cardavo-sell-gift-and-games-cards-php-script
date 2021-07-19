       {if $isactivated == 2}
        <div class="alert alert-warning text-center">
            <p><i class="fa fa-warning"></i> {$_SENT_ACTIVATION} <b>{$email}</b>.</p>
            <p><i class="fa fa-flag"></i> {$__SENT_ACTIVATION}</p>
        </div>
       {/if}
		<div class="on-desktop">
					  <ul class="nav nav-pills mb-3 wd-tab-menu col-9" id="pills-tab" role="tablist">
					    <li class="nav-item col-6 col-md">
                          <a href="{$USR}dashboard" class="nav-link {if $dashboard}active{/if}" aria-controls="description-section" aria-expanded="true"><i class="fa fa-wrench"></i><span> {$_DASHBOARD} </span></a>
					    </li>
					    <li class="nav-item col-6 col-md">
                          <a href="{$USR}orders" class="nav-link {if $order}active{/if}" aria-controls="description-section" aria-expanded="true"><i class="fa fa-database"></i><span> {$_ORDERS} </span></a>
					    </li>
					    <li class="nav-item col-6 col-md">
                          <a href="{$USR}settings" class="nav-link {if $settings}active{/if}" aria-controls="description-section" aria-expanded="true"><i class="fa fa-cog"></i><span> {$_SETTINGS} </span></a>
					    </li>
					    <li class="nav-item col-6 col-md">
                          <a href="{$USR}deposit" class="nav-link {if $deposit}active{/if}" aria-controls="description-section" aria-expanded="true"><i class="fa fa-money"></i><span> {$_DEPOSIT} </span></a>
					    </li>
					    <li class="nav-item col-6 col-md">
                          <a href="{$USR}invoices" class="nav-link {if $invoice}active{/if}" aria-controls="description-section" aria-expanded="true"><i class="fa fa-bank"></i><span> {$_INVOICES} </span></a>
					    </li>
					    <li class="nav-item col-6 col-md">
                          <a href="{$USR}statement" class="nav-link {if $statement}active{/if}" aria-controls="description-section" aria-expanded="true"><i class="fa fa-book"></i><span> {$_STATEMENT} </span></a>
					    </li>
					    <li class="nav-item col-6 col-md">
                          <a href="{$USR}support" class="nav-link {if $support}active{/if}" aria-controls="description-section" aria-expanded="true"><i class="fa fa-comment"></i><span> {$_SUPPORT} </span></a>
					    </li>
					  </ul>
	    </div>
		<div class="on-phone">
		    <div class="card col-12">
		        <div class="card-body">
		            <select class="form-control" onchange="document.location.href=this.options[this.selectedIndex].value;">
		                <option value="{$USR}dashboard" {if $dashboard}selected{/if}>{$_DASHBOARD}</option>
		                <option value="{$USR}orders" {if $order}selected{/if}>{$_ORDERS}</option>
		                <option value="{$USR}settings" {if $settings}selected{/if}>{$_SETTINGS}</option>
		                <option value="{$USR}deposit" {if $deposit}selected{/if}>{$_DEPOSIT}</option>
		                <option value="{$USR}invoices" {if $invoice}selected{/if}>{$_INVOICES}</option>
		                <option value="{$USR}statement" {if $statement}selected{/if}>{$_STATEMENT}</option>
		                <option value="{$USR}support" {if $support}selected{/if}>{$_SUPPORT}</option>
		            </select>
		        </div>
		    </div>
		    <div class="empty-h"></div>
	    </div>