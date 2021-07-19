{include file='../Layout/header.tpl'}

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">
                                    {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                                    {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                                    {include file='../Cardcodes/menu.tpl'}

                        					<form class="form-horizontal" method="POST">
                                                <input type="hidden" name="add-cardcodes" value="add-cardcodes"/>
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
                                                <div class="form-group">
                                                    <div class="col-sm-10">
	                                                    <label for="Product">Product</label>
                                                     <select name="prod_id" onChange="fetchAmounts(this.value);" class="form-control">
                                                      <option disabled selected>Select Product</option>
                                                {foreach from=$products item=foo}
                                                      <option value="{$foo['id']}">{$foo['name']}</option>
                                                {/foreach}
                                                     </select>
                                                    </div>
                                                 </div>
                                                 <div id="select-data">
                                                    <div class="form-group">
                                                        <div class="col-sm-10">
	                                                    <label for="Amount">Amount</label>
                                                         <select name="amount" class="form-control">
                                                         <option disabled selected>Select Amount</option>
                                                        </select>
                                                        </div>
                                                    </div>
                                                 </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="codes" class="form-control" data-role="tagsinput" placeholder="Add Codes"/>
	                                                    <em class="font-600 forhelp"> Possible to add multiple codes.</em>
	                                                </div>
	                                            </div>

                                               <button type="submit" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-plus-circle"></i> Add</button>
	                                        </form>
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->
                        </div>
                        <!-- end row -->

{include file='../Layout/footer.tpl'}