{include file='../Layout/header.tpl'}

<style>
.remove-file {
  cursor: pointer;
}
.green-color {
  color: green;
}
.black-color {
  color: #333;
}
.upload-list {
    display: none;
    clear: both;
    background: #f0f0f0;
    border: 1px solid #bbb;
    padding: 10px;
    margin-bottom: 30px;
    border-radius: 3px;
}
</style>
                        <div class="row">
                            <div class="col-md-12">
                                {if $thumbnail}<div class="alert alert-danger">Error: Icon size isn't correct, Must be in (200x200)</div>{/if}
                                {if $previewImage}<div class="alert alert-danger">Error: Preview size isn't correct, Must be in (480x240)</div>{/if}
                                {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                                {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                                {include file='../Products/menu.tpl'}
                     
                                <form id="upload_form" class="form-horizontal" method="POST" enctype="multipart/form-data">
                                          <div class="card-box">
                                                <input type="hidden" name="add-product" value="add-product"/>
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
								               <h4>Product Details</h4><hr>
                                                <div class="form-group">
                                                    <div class="col-sm-10">
                                                     <select name="category" class="form-control">
                    {foreach from=$categories item=foo}
                                                      <option value="{$foo['id']}">{$foo['name']}</option>
                    {/foreach}
                                                     </select>
                                                    </div>
                                                 </div>
	                                            <div class="form-group">
	                                                <div class="col-md-7">
	                                                    <input type="text" name="name" class="form-control" placeholder="Product Name">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
                                                        <script src="{$AST}ckeditor/ckeditor.js"></script>
	                                                    <textarea type="text" name="description" id="editor1" rows="10" cols="90" class="form-control" placeholder="Product Description"></textarea>
	                   <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace( 'editor1' );
                        </script>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-7">
	                                                    <input type="text" name="tags" class="form-control" data-role="tagsinput" placeholder="Add tags"/>
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-7">
	                                                    <input type="text" name="amounts" class="form-control" data-role="tagsinput" placeholder="Add Amounts"/>
	                                                    <em class="font-600 forhelp"> Ex: 5, 10, 15, 20</em>
	                                                </div>
	                                            </div>
	                                        </div>
	                                      <div class="card-box">
	                                        <h4>Product Images</h4><hr>
								            <div class="form-group text-center">
                                            <div class="col-md-6">
                                                <label for="Icon">IMAGE FILE (JPG/PNG/JPEG)</label>
                                                    <div id="upload-files" class="upload-file">
                                                        <label for="file-input">
                                                            <i class="fa fa-cloud-upload up-icon"></i>
                                                        </label>
                                                        <input id="file-input" type="file" name="files" onchange="UploaderFiles()"/>
                                                    </div>
                                                    <div id="progress" class="progress" style="display: none;">
                                                        <div class="progress-bar progress-bar-striped bg-success" role="progressbar"
                                                        aria-valuemin="0" aria-valuemax="100" style="width:0%">0%
                                                        </div>
                                                    </div>
                                                    <div class="card-box">
                                                        <div id="uploaded-files">
                                                        {foreach from=$selected_files item=foo}
                                                        <div class="text-left" id="hide-{trim($foo['id'])}" style="display: block;">
                                                            <span onclick="RemoveFile('{$foo['id']}')" class="remove-file pull-right badge badge-danger">remove</span>
                                                            <div class="black-color">
                                                                <span class="badge badge-success"><i class="fa fa-check-circle-o"></i> {$foo['name']}</span>
                                                            </div>
                                                            <hr>
                                                        </div>
		                                                {/foreach}
                                                        </div>
                                                    </div>
                                            </div>
	                                    </div>
                                                <div class="form-group">
                                                    <div class="col-sm-7">
	                                                 <label for="Icon">Icon</label>
                                                     <select id="uploaded-thumbnail" required="" name="icon_img" class="form-control">
                                                  {foreach from=$selected_files item=foo}
                                                            <option value="{$foo['id']}">{$foo['name']}</option>
		                                          {/foreach}
                                                     </select>
	                                                    <em class="font-600 forhelp">200x200</em>
                                                    </div>
                                                 </div>
                                                <div class="form-group">
                                                    <div class="col-sm-7">
	                                                 <label for="Icon">Preview</label>
                                                     <select id="uploaded-previewImage" required="" name="preview_img" class="form-control">
                                                  {foreach from=$selected_files item=foo}
                                                            <option value="{$foo['id']}">{$foo['name']}</option>
		                                          {/foreach}
                                                     </select>
	                                                    <em class="font-600 forhelp">480x240</em>
                                                    </div>
                                                 </div>
	                                            <div class="form-group">
	                                                <div class="col-md-7">
	                                                    <label for="switch">Product Status</label>
	                                                    <input type="checkbox" name="status" switch="primary" checked="" data-plugin="switchery" data-color="#039cfd">
	                                                </div>
	                                            </div>
                                               <button type="submit" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-plus-circle"></i> New Product</button>
	                                        </div>
	                                        </form>

                                </div> <!-- end card -->


                        </div>
                        <!-- end row -->
{include file='../Layout/footer.tpl'}