{include file='../Layout/header.tpl'}


                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}

                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
                                                    <label for="Name" class="col-sm-10">
                                                        Name *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="text" name="name" class="form-control" value="{$r_name}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="Description" class="col-sm-10">
                                                        Description
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <textarea type="text" name="description" class="form-control" >{$r_description}</textarea>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="API" class="col-sm-10">
                                                        API *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="text" name="api" class="form-control" value="{$r_api}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="Url" class="col-sm-10">
                                                        Url *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="url" name="url" class="form-control" value="{$r_url}">
                                        <em class="font-600 forhelp">ex: https://domain.com/</em>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                   <label for="Credit" class="col-sm-10">
                                                        Credit *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="text" name="credit" class="form-control" placeholder="Credit" value="{$r_credit}">
                                                        <em class="font-600 forhelp">How much user should get (Default Currency: {do_config(16)} ).</em>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                   <label for="Position" class="col-sm-10">
                                                        Position *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="number" name="position" class="form-control" placeholder="Position" value="{$r_position}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="IPCount" class="col-sm-10">
                                                        IP Count *
                                                    </label>
	                                                <div class="col-md-10">
	                                                    <input type="number" name="count_ip" class="form-control" value="{$r_count_ip}">
	                                                </div>
	                                            </div>
                                                <div class="form-group">
                                                    <label for="Status" class="col-sm-10">
                                                         Status
                                                    </label>
                                                    <div class="col-sm-10">
                                                    <select name="status" class="form-control">
                                                      <option value="1" {if $r_status == '1'}selected="selected"{/if} >Active</option>
                                                      <option value="2" {if $r_status == '2'} selected="selected"{/if} >Inactive</option>
                                                    </select>
                                                    </div>
                                                </div>

                                               <button type="submit" name="up-short" value="up-short" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Save</button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                        
{include file='../Layout/footer.tpl'}