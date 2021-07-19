{include file='../Layout/header.tpl'}

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">
                                    {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                                    {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                                    {include file='../Categories/menu.tpl'}
                        					<form class="form-horizontal" method="POST">
                        					    
                                                <input type="hidden" name="add-category" value="add-category"/>
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="name" class="form-control" placeholder="Name">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <textarea type="text" name="description" class="form-control" placeholder="Description"></textarea>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="link" class="form-control" placeholder="Link">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-7">
	                                                    
	                                                    <label for="switch"> Status</label>
	                                                    <input type="checkbox" name="status" switch="primary" checked="" data-plugin="switchery" data-color="#039cfd">
	                                                </div>
	                                            </div>

                                            <button type="submit" class="btn btn-black waves-effect w-md m-b-5"
                                            {if !$prmcode} data-toggle="tooltip" data-placement="top" title="" data-original-title="Go Premium To Unlock This Feature" {/if}>
                                                   <i class="fa fa-plus-circle"></i>  Add
                                            </button>
	                                        </form>
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->
                        </div>
                        <!-- end row -->
{include file='../Layout/footer.tpl'}