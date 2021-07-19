{include file='../Layout/header.tpl'}


                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}

                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
                                                <input type="hidden" name="prod_id" value="{$r_prod_id}"/>
	                                            <div class="form-group">
                                                    <label for="Amount" class="col-sm-10">
                                                        Amount
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="text"class="form-control" value="{$r_amount}" disabled="disabled">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="Price" class="col-sm-10">
                                                        Price *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="text" name="price" class="form-control" value="{$r_price}">
	                                                </div>
	                                            </div>
                                                <div class="form-group">
                                                    <label for="Status" class="col-sm-10">
                                                         Status
                                                    </label>
                                                    <div class="col-sm-10">
                                                    <select name="status" class="form-control">
                                                      <option value="on" {if $r_status == 'on'}selected="selected"{/if} >Active</option>
                                                      <option value="off" {if $r_status == 'off'} selected="selected"{/if} >Inactive</option>
                                                    </select>
                                                    </div>
                                                </div>

                                               <button type="submit" name="up-prices" value="up-prices" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-check-circle"></i> Save</button>
	                                        </form>
	                                        {include file='../Layout/back.tpl'}
                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                        
{include file='../Layout/footer.tpl'}