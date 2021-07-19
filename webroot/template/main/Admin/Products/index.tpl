 {include file='../Layout/header.tpl'}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
     {if $added}<div class='alert alert-success'>Product Added Successfully</div>{/if}
     {if $updated}<div class='alert alert-success'>Product Updated Successfully</div>{/if}
     {if $deactivated}<div class='alert alert-success'>Product Deactivated Successfully</div>{/if}
     {if $activated}<div class='alert alert-success'>Product Activated Successfully</div>{/if}
     {if $deleted}<div class="alert alert-success">Product Deleted Successfully</div>{/if}
     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
     {include file='../Products/menu.tpl'}
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-bars"></i> Name</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-pencil"></i> Prices</th>
                                                                <th><i class="fa fa-eye"></i> View</th>
                                                                <th><i class="fa fa-pencil"></i> Modify</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$products item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>{$foo['name']}</td>
                                                                <td>
                                               {if $foo['status'] == 'on'}
                                                               <span class="badge badge-success">Active</span>
                                               {elseif $foo['status'] == 'off'}
                                                               <span class="badge badge-danger">Inactive</span>
                                               {/if}</td>
                                                                <td>{$foo['created']}</td>
                                                                <td>
                                                                    <a href="{$ADM}products/prices/{$foo['id']}/" class="badge badge-danger">
                                                                        <i class="fa fa-pencil"></i>
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <a href="{$foo['link']}" target="_blank" class="badge badge-info">
                                                                        <i class="fa fa-eye"></i>
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <a href="{$ADM}products/edit/{$foo['id']}/" class="badge badge-success">
                                                                        <i class="fa fa-pencil"></i> Edit
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <form method="POST">

                                                                        <input type="hidden" name="id" value="{$foo['id']}"> 
                                                                        <input type="hidden" name="user_id" value="{$foo['user_id']}"> 
                                                                        <input type="hidden" name="amount" value="{$foo['amount']}">
                                                {if $foo['status']== 'on'}
                                                                        <input type="hidden" name="deactivate" value="deactivate"> 
                                                                        <button class="btn btn-danger btn-xs" type="submit" value="Deactivate" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Deactivate</button>
                                                {elseif $foo['status']== 'off'}
                                                                        <input type="hidden" name="activate" value="activate"> 
                                                                        <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate">Activate</button>
                                                {/if}
                                                                    </form>
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
                                               {if !$products}
                                               <div class="text-center">
                                                   <span class="badge badge-danger" style="margin-top: 30px;">{$_NO_RECORDS_WERE_FOUND}</span>
                                               </div>
                                               {/if}
                               </div>
                            </div>
                        </div>
                        <!-- end row -->
                        <div class="row" style="text-align: center"> 
                           {if $products}
                             <ul class="pagination">
                                       {$paging} 
                             </ul>
                           {/if}
                        </div>
                        <!-- end pagination -->
                       </div>


                
{include file='../Layout/footer.tpl'}