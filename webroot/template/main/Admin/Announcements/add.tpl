{include file='../Layout/header.tpl'}

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">
                                    {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                                    {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
                                    {include file='../Announcements/menu.tpl'}

                        					<form class="form-horizontal" method="POST">
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" name="title" class="form-control" placeholder="Title">
	                                                </div>
	                                            </div>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
                                                        <script src="{$AST}ckeditor/ckeditor.js"></script>
	                                                    <textarea type="text" name="content" id="editor1" rows="10" cols="90" class="form-control" placeholder="content"></textarea>
	                   <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace( 'editor1' );
                        </script>
	                                                </div>
	                                            </div>
                                                <button type="submit" name="add-announcement" value="add-announcement" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-plus-circle"></i>  Add</button>
	                                        </form>
                                </div> <!-- end card -->
                            </div>
                            <!-- end col -->
                        </div>
                        <!-- end row -->

{include file='../Layout/footer.tpl'}