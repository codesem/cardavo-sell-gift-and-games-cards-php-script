{include file='../Layout/header.tpl'}
            

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
    {if $do_exist}<div class="alert alert-danger">Error: Username/Email Already Exist! Please Try again.</div>{/if}
    {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
    {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}   
    {include file='../Users/menu.tpl'}

                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                     <select name="role" class="form-control">
                                                      <option value="admin">Admin</option>
                                                      <option value="user">User</option>
                                                     </select>
                                                    </div>
                                                 </div>
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                    <select name="status" class="form-control">
                                                     <option value="1">Active</option>
                                                     <option value="2">Pending</option>
                                                     <option value="3">Inactive</option>
                                                    </select>
                                                   </div>
                                                </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="username" class="form-control" placeholder="Username">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="email" name="email" class="form-control" placeholder="Email"/>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="password" name="password" class="form-control" placeholder="Password">
	                                                </div>
	                                            </div>

                                               <button type="submit" name="add-user" value="add-user" class="btn btn-black waves-effect w-md m-b-5" {if !$prmcode} data-toggle="tooltip" data-placement="top" title="" data-original-title="Go Premium To Unlock This Feature" {/if}>
                                                   <i class="fa fa-plus-circle"></i>  Add
                                               </button>
	                                        </form>

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->


{include file='../Layout/footer.tpl'}