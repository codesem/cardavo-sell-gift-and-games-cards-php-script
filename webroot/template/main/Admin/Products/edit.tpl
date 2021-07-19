{include file='../Layout/header.tpl'}
                        <div class="row">
                            <div class="col-md-12">
                                {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                                {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                     
                                <form class="form-horizontal" method="POST">
                                          <div class="card-box">
                                                <input type="hidden" name="up-product" value="up-product"/>
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
								               <h4>Product Details</h4><hr>
	                                            <div class="form-group">
	                                                <div class="col-md-7">
	                                                    <label for="switch">Product Link</label>
	                                                    <input type="text" name="link" class="form-control" placeholder="Link" value="{$r_link}">
	                                                </div>
	                                            </div>
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                     <select name="category" class="form-control">
                    {foreach from=$categories item=foo}
                                                      <option value="{$foo['id']}" {if $foo['id'] == $r_category} selected {/if}>{$foo['name']}</option>
                    {/foreach}
                                                     </select>
                                                    </div>
                                                 </div>
	                                            <div class="form-group">
	                                                <div class="col-md-7">
	                                                    <input type="text" name="name" class="form-control" placeholder="Product Name" value="{$r_name}">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
                                                        <script src="{$AST}ckeditor/ckeditor.js"></script>
	                                                    <textarea type="text" name="description" id="editor1" rows="10" cols="90" class="form-control" placeholder="Product Description">{$r_description}</textarea>
	                   <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace( 'editor1' );
                        </script>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-7">
	                                                    <input type="text" name="tags" class="form-control" data-role="tagsinput" placeholder="Add tags" value="{$r_tags}"/>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-7">
	                                                    <label for="switch">Product Status</label>
	                                                    <input type="checkbox" name="status" switch="primary" {if $r_status == 'on'} checked="" {/if} data-plugin="switchery" data-color="#039cfd">
	                                                </div>
	                                            </div>
	                                        </div>
                                            <button type="submit" class="btn btn-black waves-effect w-md m-b-5"
                                            {if !$prmcode} data-toggle="tooltip" data-placement="top" title="" data-original-title="Go Premium To Unlock This Feature" {/if} >
                                                   <i class="fa fa-pencil"></i> Update Product
                                            </button>
	                                        </form>

                                </div> <!-- end card -->


                        </div>
                        <!-- end row -->
{include file='../Layout/footer.tpl'}