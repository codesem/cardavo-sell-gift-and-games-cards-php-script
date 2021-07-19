{include file='../Layout/header.tpl'}


                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
{if $answered}<div class='alert alert-success'>Ticket Answered Successfully</div>{/if}
{if $updated}<div class='alert alert-success'>Ticket Updated Successfully</div>{/if}
{if $required}<div class='alert alert-danger'>Error: Something Wrong, Please try again.</div>{/if}
     <form class="form-vertical" method="GET">
           <div class="form-group">
             <div class="col-sm-3">
             <select name="search" class="form-control">
               <option value="id" {if $search == "id"}selected{/if}>Ticket ID</option>
               <option value="user_id" {if $search == "user_id"}selected{/if}>User ID</option>
               <option value="email" {if $search == "email"}selected{/if}>E-mail</option>
               <option value="status" {if $search == "status"}selected{/if}> Status(open, answered, closed)</option>
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
                                                                <th><i class="fa fa-bars"></i> Subject/Issue</th>
                                                                <th><i class="fa fa-unsorted"></i> Status</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            
                                                            
	                                           {foreach from=$tickets item=foo}
                                                            <tr>
                                               <td>{$foo['id']} </td>
                                               <td> 
                                               <a href="{$ADM}users/view/{$foo['user_id']}/">
                                               <button class="btn btn-info btn-xs"><i class="fa fa-user"></i> {if $foo['user_id']==0}[NaN]{else}{$foo['username']}{/if}</button>
                                               </a>
                                               </td>
                                               <td>{$foo['subject']}</td>
                                               <td>
                                               {if $foo['status'] == 'open'}
                                                               <span class="badge badge-success">Open</span>
                                               {elseif $foo['status'] == 'closed'}
                                                               <span class="badge badge-danger">Closed</span>
                                               {elseif $foo['status'] == 'answered'}
                                                               <span class="badge badge-info">Answered</span>
                                               {/if}</td>
                                                                <td>{$foo['ago']}</td>
                                                                
                                                                                                                                
                {if $foo['status']== 'open' || $foo['status']== 'answered'}
                    <td>
                    <form method="POST">
                      <input type="hidden" name="csrf" value="{$csrfToken}">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-danger btn-xs" type="submit" name="sform" value="closed">Closed</button>
                    </form>
                    </td>
               {elseif $foo['status']== 'closed'}
                   <td>
                   <form method="POST">
                      <input type="hidden" name="csrf" value="{$csrfToken}">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-success btn-xs" type="submit" name="sform" value="open">Open</button>
                   </form>
                   </td>
              {/if}
                    <td>
                        <div class="col-sm-8 col-sm-offset-3">
                         <div class="form-group">
                              <a href="{$ADM}ticket/{$foo['id']}/" class="btn btn-warning btn-xs">Ticket</a>
                            </div>
                        </div>
                    </td>
                                                            </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$tickets}
                                               <div class="text-center">
                                                   <span class="badge badge-danger" style="margin-top: 30px;">{$_NO_RECORDS_WERE_FOUND}</span>
                                               </div>
                                               {/if}
                               </div>
                            </div>
                        </div>
                        <!-- end row -->
                        <div class="row" style="text-align: center"> 
                           {if $tickets}
                             <ul class="pagination">
                                       {$paging} 
                             </ul>
                           {/if}
                        </div>
                        <!-- end pagination -->
                       </div>

{include file='../Layout/footer.tpl'}