{include file='../Layout/header.tpl'}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                     {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                     {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}

                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>

	                                            <div class="form-group">
                                                    <label for="Title" class="col-sm-10">
                                                        Title
                                                    </label>
	                                                <div class="col-md-10">
                                                     <input name="title" class="form-control" type="text" value="{$r_title}"/>	                                           
                                                    </div>
	                                            </div>
	                                            <div class="form-group">
                                                    <label for="Content" class="col-sm-10">
                                                        Content
                                                    </label>
	                                                <div class="col-md-10">
                                                      <script src="{$AST}ckeditor/ckeditor.js"></script>
                                                      <textarea type="text" name="content" class="form-control" id="editor1" rows="10" cols="90">{$r_content}</textarea>
                                                      <script>
                                                      // Replace the <textarea id="editor1"> with a CKEditor
                                                      // instance, using default configuration.
                                                      CKEDITOR.replace( 'editor1' );
                                                      </script>
	                                                </div>
	                                            </div>

                                               <button type="submit" name="up-page" value="up-page" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-check-circle"></i>  Save</button>
	                                        </form>
	                                        {include file='../Layout/back.tpl'}

                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->

{include file='../Layout/footer.tpl'}