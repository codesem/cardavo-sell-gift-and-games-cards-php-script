{include file="../Layout/header.tpl"}

                        <div class="row">
                            <div class="col-md-12">
                               <div class="card-box">
                                   {if $do_demo}<div class="alert alert-danger">Error: You can't do this action on demo mode.</div>{/if}
                                   {if $updated}<div class='alert alert-success'>Payment Settings Updated Successfully!</div>{/if}
                                   {if $do_error}<div class='alert alert-danger'>Error: Somthing wrong! Please Try again.</div>{/if}
                                   {include file='../Options/main.tpl'}

                                   <form class="form-horizontal" method="POST">
                                       <input type="hidden" name="up-payments" value="up-payments"/>
                                       <h4>Payment Settings</h4><hr>
                                       <div class="form-group">
                                           <div class="col-md-7">
                                               <label for="CurrencyCode" class="col-md-7">Currency Code</label>
                                               <select name="currency" class="form-control">
                                            {foreach from=$currencies item=foo}
                                                    <option value="{$foo['name']}"{if do_config(16) == $foo['name']} selected="selected"{/if}>{$foo['name']} ({$foo['symbol']})</option>
                                            {/foreach}
                                                </select>
                                            </div>
                                       </div>
                                       <div class="form-group">
                                           <div class="col-md-7">
                                               <label for="Minimum" class="col-md-10">Minimum deposit</label>
                                               <input type="number" name="min_deposit" class="form-control" value="{do_config(3)}">
                                            </div>
                                       </div><hr>
	                                            
                            {foreach from=$dmethods item=foo}
                                       <h4>{$foo['name']} Settings</h4><hr>
                                {if $foo['methods'] == 'paypal'}
	                                   <div class="form-group">
	                                       <div class="col-md-7">
	                                           <small>Please Go to <a href="{$HOST}pages/paypal-setup">PayPal Setup Page</a>, So you can make it working.</small>
	                                       </div>
	                                   </div>
                                       <div class="form-group">
                                           <div class="col-md-7">
                                               <label for="CurrencyCode" class="col-md-7">Status</label>
                                               <select name="status_{$foo['methods']}" class="form-control">
                                                    <option value="on"{if $foo['status'] == 'on'} selected="selected"{/if}>Enable</option>
                                                    <option value="off"{if $foo['status'] == 'off'} selected="selected"{/if}>Disable</option>
                                                </select>
                                            </div>
                                       </div>
	                                   <div class="form-group">
	                                       <div class="col-md-7">
	                                           <label for="PayPalEmail" class="col-md-10">{$foo['name']} Email</label>
	                                           <input type="text" name="account_{$foo['methods']}" class="form-control" value="{$foo['account']}">
	                                       </div>
	                                   </div>
                                {elseif $foo['methods'] == 'coinbase'}
	                                   <div class="form-group">
	                                       <div class="col-md-7">
	                                           <small>Please Go to <a href="{$HOST}pages/coinbase-setup">Coinbase Setup Page</a>, So you can make it working.</small>
	                                       </div>
	                                   </div>
                                       <div class="form-group">
                                           <div class="col-md-7">
                                               <label for="CurrencyCode" class="col-md-7">Status</label>
                                               <select name="status_{$foo['methods']}" class="form-control">
                                                    <option value="on"{if $foo['status'] == 'on'} selected="selected"{/if}>Enable</option>
                                                    <option value="off"{if $foo['status'] == 'off'} selected="selected"{/if}>Disable</option>
                                                </select>
                                            </div>
                                       </div>
	                                   <div class="form-group">
	                                       <div class="col-md-7">
	                                           <label for="APIKey" class="col-md-10">{$foo['name']} API Key</label>
	                                           <input type="password" name="public_key_{$foo['methods']}" class="form-control" value="{$foo['public_key']}">
	                                       </div>
	                                   </div>
	                                   <div class="form-group">
	                                       <div class="col-md-7">
	                                           <label for="SharedSecret" class="col-md-10">{$foo['name']} Shared Secret</label>
	                                           <input type="password" name="secret_key_{$foo['methods']}" class="form-control" value="{$foo['secret_key']}">
	                                       </div>
	                                   </div>
                                {elseif $foo['methods'] == 'stripe'}
                                       <div class="form-group">
                                           <div class="col-md-7">
                                               <label for="CurrencyCode" class="col-md-7">Status</label>
                                               <select name="status_{$foo['methods']}" class="form-control">
                                                    <option value="on"{if $foo['status'] == 'on'} selected="selected"{/if}>Enable</option>
                                                    <option value="off"{if $foo['status'] == 'off'} selected="selected"{/if}>Disable</option>
                                                </select>
                                            </div>
                                       </div>
	                                   <div class="form-group">
	                                       <div class="col-md-7">
	                                           <label for="PublicKey" class="col-md-10">{$foo['name']} Public Key</label>
	                                           <input type="password" name="public_key_{$foo['methods']}" class="form-control" value="{$foo['public_key']}">
	                                       </div>
	                                   </div>
	                                   <div class="form-group">
	                                       <div class="col-md-7">
	                                           <label for="SecretKey" class="col-md-10">{$foo['name']} Secret Key</label>
	                                           <input type="password" name="secret_key_{$foo['methods']}" class="form-control" value="{$foo['secret_key']}">
	                                       </div>
	                                   </div>
                                {/if}
	                                   <div class="form-group">
	                                       <div class="col-md-7">
	                                           <label for="TAXPercent" class="col-md-10">TAX Percent</label>
	                                           <input type="text" name="tax_percent_{$foo['methods']}" class="form-control" value="{$foo['tax_percent']}">
	                                       </div>
	                                   </div>
                                {if $foo['methods'] != 'stripe'}
	                                   <div class="form-group">
	                                       <div class="col-md-7">
	                                           <label for="IPNUrl" class="col-md-10">IPN Url</label>
	                                           <input type="text" class="form-control" value="{$HOST}{$foo['ip_url']}" disabled>
	                                       </div>
	                                   </div>
                                {/if}
                                     <hr>
                            {/foreach}
                                       <button type="submit" class="btn btn-black waves-effect w-md m-b-5" 
                                       {if !$prmcode} data-toggle="tooltip" data-placement="top" title="" data-original-title="Go Premium To Unlock This Feature" {/if}>
                                           <i class="fa fa-check-circle"></i> Save
                                       </button>
	                                        
	                               </form>


                                 </div>
                            </div>
                        </div>
{include file="../Layout/footer.tpl"}