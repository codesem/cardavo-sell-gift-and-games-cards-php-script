 {include file='../Layout/header.tpl'}
                
                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
                                   {if $activated}<div class='alert alert-success'>Invoice Marked As Paid!</div>{/if}
                                   {if $deleted}<div class="alert alert-success">Invoice Deleted Successfully</div>{/if}
                                   {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
                                   {include file='../Invoices/menu.tpl'}
                                   <form class="form-vertical" method="GET">
                                       <div class="form-group">
                                           <div class="col-sm-3">
                                               <select name="search" class="form-control">
                                                   <option value="user_id" {if $search == "user_id"}selected{/if}>User ID</option>
                                                   <option value="status" {if $search == "status"}selected{/if}>Status (1=Paid, 2=Unpaid)</option>
                                                   <option value="method" {if $search == "method"}selected{/if}>Method</option>
                                               </select>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                           <div class="col-md-3">
                                               <input type="text" name="data" class="form-control" placeholder="Search..." value="{$data}">
                                           </div>
                                      </div>
                                      <button type="submit" class="btn btn-primary waves-effect w-md m-b-5"><i class=" fa fa-search"></i>  Search</button>
                                </form><hr>
                                     <div class="table-responsive">
                                                    <table class="table m-0">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-user"></i> User</th>
                                                                <th><i class="fa fa-money"></i> Amount</th>
                                                                <th><i class="fa fa-bank"></i> Method</th>
                                                                <th><i class="fa fa-question-circle"></i> Response</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$invoices item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>
                                                                    <a href="{$ADM}users/view/{$foo['user_id']}/" class="badge badge-info">
                                                                        <i class="fa fa-user"></i> {$foo['username']}
                                                                    </a>
                                                                </td>
                                                                <td>{$foo['amount']}</td>
                                                                <td>{$foo['method']}</td>
                                                                <td>{$foo['status_text']}</td>
                                                                <td>
                                               {if $foo['status'] == 'on'}
                                                               <span class="badge badge-success">Paid</span>
                                               {elseif $foo['status'] == 'off'}
                                                               <span class="badge badge-danger">Unpaid</span>
                                               {/if}</td>
                                                                <td>{$foo['created']}</td>
                                                                <td>
               {if $foo['status']=='off'}
                   <form method="POST">
                     <input type="hidden" name="id" value="{$foo['id']}"> 
                     <button class="btn btn-success btn-xs" type="submit" name="activate" value="activate"
                     {if !$prmcode} data-toggle="tooltip" data-placement="top" title="" data-original-title="Go Premium To Unlock This Feature" {/if}>
                         Mark As Paid
                     </button>
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
                                               {if !$invoices}
                                               <div class="text-center">
                                                   <span class="badge badge-danger" style="margin-top: 30px;">{$_NO_RECORDS_WERE_FOUND}</span>
                                               </div>
                                               {/if}
                               </div>
                            </div>
                        </div>
                        <!-- end row -->
                        <div class="row" style="text-align: center"> 
                           {if $invoices}
                             <ul class="pagination">
                                       {$paging} 
                             </ul>
                           {/if}
                        </div>
                        <!-- end pagination -->
                       </div>
                
{include file='../Layout/footer.tpl'}