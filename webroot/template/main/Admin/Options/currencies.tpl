{include file="../Layout/header.tpl"}
                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
             {include file='../Options/main.tpl'}
                                     <div class="table-responsive">
                                                    <table class="table m-0">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>#</th>
                                                                <th><i class="fa fa-bank"></i> Method</th>
                                                                <th><i class="fa fa-money"></i> Symbol</th>
                                                                <th><i class="fa fa-calendar"></i> Date</th>
                                                                <th><i class="fa fa-mail-reply-all"></i> Actions</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                           {foreach from=$currencies item=foo}
                                                            <tr>
                                                                <th scope="row">{$foo['id']}</th>
                                                                <td>{$foo['name']}</td>
                                                                <td>{$foo['symbol']}</td>
                                                                <td>{$foo['created']}</td>
                   <td>
                     <form method="POST">
                      <input type="hidden" name="id" value="{$foo['id']}"> 
                      <button class="btn btn-warning btn-xs" type="submit" name="delete" value="Delete" onclick="if (confirm(&quot;Are you sure?&quot;)) { document.post_5a529c86cb181240954732.submit(); } event.returnValue = false; return false;">Delete</button>
                     </form> 
                    </td>
                   <td>
                   <form action="{$ADM}options/edit/{$foo['id']}/" method="POST">
                    <button class="btn btn-success btn-xs">Edit</button>
                   </form>
                   </td>
                    </tr>
                                               {/foreach}
                                                        </tbody>
                                                    </table>
                                                </div>
                                               {if !$currencies}<span class="badge badge-danger elem-center" style="margin-left: 200px;">No currencies was Found..</span>{/if}
                                 </div>
                            </div>
                        </div>
{include file="../Layout/footer.tpl"}