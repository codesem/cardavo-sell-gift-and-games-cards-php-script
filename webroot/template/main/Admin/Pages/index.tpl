 {include file='../Layout/header.tpl'}
                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
     {if $updated}<div class="alert alert-success">Page Updated Successfully</div>{/if}
     {if $deactivated}<div class='alert alert-success'>Page Deactivated Successfully</div>{/if}
     {if $activated}<div class='alert alert-success'>Page Activated Successfully</div>{/if}
     {if $deleted}<div class="alert alert-success">Page Deleted Successfully</div>{/if}
     {if $added}<div class="alert alert-success">Page Added Successfully</div>{/if}
     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
     {include file='../Pages/menu.tpl'}
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-pencil"></i> Title</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-eye"></i> View</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$pages item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>{$foo['title']}</td>
                                                                <td>
                                               {if $foo['status'] == 'on'}
                                                               <span class="badge badge-success">Active</span>
                                               {elseif $foo['status'] == 'off'}
                                                               <span class="badge badge-danger">Inactive</span>
                                               {/if}</td>
                                                                <td>{$foo['created']}</td>
                                                                <td>
                                                                    <a href="{$foo['link']}" target="_blank" class="badge badge-info">
                                                                        <i class="fa fa-eye"></i>
                                                                    </a>
                                                                </td>
                                                                <td>
                {if $foo['status']== 'on'}
                    <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="deactivate" value="deactivate" {if $foo['protect']=='1'}disabled="disabled"{/if} onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Deactivate</button>
                    </form>
               {elseif $foo['status']== 'off'}
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
                  <td>
                   <form action="{$ADM}pages/edit/{$foo['id']}/" method="POST">
                    <button class="btn btn-success btn-xs">Edit</button>
                   </form>
                  </td>
                    
                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$pages}
                                               <div class="text-center">
                                                   <span class="badge badge-danger" style="margin-top: 30px;">{$_NO_RECORDS_WERE_FOUND}</span>
                                               </div>
                                               {/if}
                               </div>
                            </div>
                        </div>
                        <!-- end row -->
                        <div class="row" style="text-align: center"> 
                           {if $pages}
                             <ul class="pagination">
                                       {$paging} 
                             </ul>
                           {/if}
                        </div>
                        <!-- end pagination -->
                       </div>
                
{include file='../Layout/footer.tpl'}