		<div class="on-desktop">
					  <ul class="nav nav-pills mb-3 wd-tab-menu col-5" id="pills-tab" role="tablist">
					    <li class="nav-item col-6 col-md">
					      <a href="{$item_link}" class="nav-link {if $detail}active{/if}" aria-expanded="true"><i class="fa fa-file-text"></i> {$_DESCRIPTION}</a>
					    </li>
					    <li class="nav-item col-6 col-md">
					      <a href="{$item_link}comments" class="nav-link {if $comment}active{/if}"  aria-expanded="false"><i class="fa fa-comment"></i> {$_COMMENTS} <span class="badge badge-secondary">{$num_comments}</span></a>
					    </li>
					    <li class="nav-item col-6 col-md">
					      <a href="{$item_link}reviews" class="nav-link {if $review}active{/if}" aria-expanded="false"><i class="fa fa-star"></i> {$_REVIEWS} <span class="badge badge-secondary">{$num_reviews}</span></a>
					    </li>
					  </ul>
	    </div>
		<div class="on-phone">
		    <div class="card col-12">
		        <div class="card-body">
		            <select class="form-control" onchange="document.location.href=this.options[this.selectedIndex].value;">
		                <option value="{$item_link}" {if $detail}selected{/if}>{$_DESCRIPTION}</option>
		                <option value="{$item_link}comments" {if $comment}selected{/if}>{$_COMMENTS} ({$num_comments})</option>
		                <option value="{$item_link}reviews" {if $review}selected{/if}>{$_REVIEWS} ({$num_reviews})</option>
		            </select>
		        </div>
		    </div>
		    <div class="empty-h"></div>
	    </div>