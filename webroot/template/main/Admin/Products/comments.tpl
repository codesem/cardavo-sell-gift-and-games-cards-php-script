 {include file='../Layout/header.tpl'}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
     {if $deactivated}<div class='alert alert-success'>Comment Deactivated Successfully</div>{/if}
     {if $activated}<div class='alert alert-success'>Comment Activated Successfully</div>{/if}
     {if $deleted}<div class="alert alert-success">Comment Deleted Successfully</div>{/if}
     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
     {include file='../Products/menu.tpl'}
     <form class="form-vertical" method="GET">
           <div class="form-group">
             <div class="col-sm-3">
             <select name="search" class="form-control">
               <option value="id" {if $search == "id"}selected{/if}>Comment ID</option>
               <option value="prod_id" {if $search == "prod_id"}selected{/if}>Product ID</option>
               <option value="user_id" {if $search == "user_id"}selected{/if}>User ID</option>
             </select>
             </div>
           </div>
	       <div class="form-group">
	         <div class="col-md-3">
	          <input type="text" name="data" class="form-control" placeholder="Search..." value="{$data}">
	         </div>
	       </div>
           <button type="submit" class="btn btn-primary waves-effect w-md m-b-5"><i class=" fa fa-search"></i> Search</button>
	       </form>
	                                 <hr>
                                     <div class="table-responsive">
                                                    <table class="table m-0">
                                                        
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-user"></i> User</th>
                                                                <th><i class="fa fa-comment"></i> Comment</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-bug"></i>  Reported</th>
                                                                <th><i class="fa fa-link"></i>  Link</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$comments item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td><a href="{$ADM}users/view/{$foo['user_id']}/">
                                                                   <button class="btn btn-info btn-xs"><i class="fa fa-user"></i> {$foo['username']}</button>
                                                                   </a></td>
                                                                <td title="{$foo['fullcomment']}">{$foo['comment']}</td>
                                                                                                                                <td>
                                               {if $foo['status'] == 'on'}
                                                               <span class="badge badge-success">Active</span>
                                               {elseif $foo['status'] == 'off'}
                                                               <span class="badge badge-danger">Inactive</span>

                                               {/if}</td>
                                                                <td><span class="badge badge-danger">{$foo['reported']}</span></td>
                                                                <td><a href="{$foo['link']}/comments" target="_blank">
                                                                   <button class="btn btn-info btn-xs"><i class="fa fa-eye"></i></button>
                                                                   </a>
                                                                 </td>
                   <td>
                    {if $foo['status'] == 'on'}
                    <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="deactivate" value="deactivate" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Deactivate</button>
                    </form>
                    {elseif $foo['status'] == 'off'}
                    <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate">Activate</button>
                    </form>
                    {/if}
                    </td>
                   <td>
                     <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-warning btn-xs" type="submit" name="delete" value="Delete" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Delete</button>
                     </form> 
                    </td>

                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$comments}
                                               <div class="text-center">
                                                   <span class="badge badge-danger" style="margin-top: 30px;">{$_NO_RECORDS_WERE_FOUND}</span>
                                               </div>
                                               {/if}
                               </div>
                            </div>
                        </div>
                        <!-- end row -->
                        <div class="row" style="text-align: center"> 
                           {if $comments}
                             <ul class="pagination">
                                       {$paging} 
                             </ul>
                           {/if}
                        </div>
                        <!-- end pagination -->
                       </div>
                
{include file='../Layout/footer.tpl'}