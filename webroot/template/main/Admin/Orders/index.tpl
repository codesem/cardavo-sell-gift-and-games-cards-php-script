 {include file='../Layout/header.tpl'}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
                                   {if $updated}<div class='alert alert-success'>Order Updated Successfully</div>{/if}
                                   {if $deactivated}<div class='alert alert-success'>Order Deactivated Successfully</div>{/if}
                                   {if $activated}<div class='alert alert-success'>Order Activated Successfully</div>{/if}
                                   {if $deleted}<div class="alert alert-success">Order Deleted Successfully</div>{/if}
                                   {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
                                   {foreach from=$orders item=foo}
                                     <div id="modal-{$foo['id']}" class="modal fade" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
                                         <div class="modal-dialog">
                                             <div class="modal-content">
                                                 <div class="modal-header">
                                                     <h4 class="modal-title mt-0">Order #{$foo['id']}</h4>
                                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                         <span aria-hidden="true">×</span>
                                                     </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-bars"></i> Product</th>
                                                                <th><i class="fa fa-dollar"></i> Amount</th>
                                                                <th><i class="fa fa-lock"></i> Codes</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$foo['code_orders'] item=code}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>{$code['name']}</td>
                                                                <td>{$code['amount']}</td>
                                                                <td>{$code['code']}</td>
                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>

                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                     </div>
                                   {/foreach}
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-user"></i> User</th>
                                                                <th><i class="fa fa-dollar"></i> Amount</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-lock"></i> Codes</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$orders item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>
                                                                    <a href="{$ADM}users/view/{$foo['user_id']}/" class="badge badge-info">
                                                                        <i class="fa fa-user"></i> {$foo['username']}
                                                                    </a>
                                                                </td>
                                                                <td>{$foo['amount']}</td>
                                                                <td>
                                               {if $foo['status'] == 'on'}
                                                               <span class="badge badge-success">Active</span>
                                               {elseif $foo['status'] == 'off'}
                                                               <span class="badge badge-danger">Inactive</span>
                                               {/if}</td>
                                                                <td>{$foo['created']}</td>
                                                                <td>
                                                                    <a href=""class="badge badge-info" data-toggle="modal" data-target="#modal-{$foo['id']}">
                                                                        <i class="fa fa-lock"></i>
                                                                    </a>
                                                                </td>
                                                                                                                                <td>
                {if $foo['status']== 'on'}
                    <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <input type="hidden" name="user_id" value="{$foo['user_id']}"> 
                      <input type="hidden" name="amount" value="{$foo['amount']}"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="deactivate" value="Deactivate" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Deactivate</button>
                    </form>
               {elseif $foo['status']== 'off'}
                   <form method="POST">
                     <input type="hidden" name="id" value="{$foo['id']}"> 
                     <input type="hidden" name="user_id" value="{$foo['user_id']}"> 
                     <input type="hidden" name="amount" value="{$foo['amount']}"> 
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
                                               {if !$orders}
                                               <div class="text-center">
                                                   <span class="badge badge-danger" style="margin-top: 30px;">{$_NO_RECORDS_WERE_FOUND}</span>
                                               </div>
                                               {/if}
                               </div>
                            </div>
                        </div>
                        <!-- end row -->
                        <div class="row" style="text-align: center"> 
                           {if $orders}
                             <ul class="pagination">
                                       {$paging} 
                             </ul>
                           {/if}
                        </div>
                        <!-- end pagination -->
                       </div>


                
{include file='../Layout/footer.tpl'}