 {include file='../Layout/header.tpl'}
                       <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
                {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
                {include file='../Banlist/menu.tpl'}
                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="ip" class="form-control" placeholder="IP Number">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <textarea type="text" name="reason" class="form-control" placeholder="Reason"></textarea>
	                                                </div>
	                                            </div>
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                    <select name="status" class="form-control">
                                                     <option value="2" selected>Blacklist</option>
                                                     <option value="1">Whitelist</option>
                                                    </select>
                                                   </div>
                                                </div>

                                               <button type="submit" name="add-ip" value="add-ip" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-plus-circle"></i>  Add</button>
	                                        </form>

                               </div>
                            </div>
                        </div>
                       </div>
 {include file='../Layout/footer.tpl'}