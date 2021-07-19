{include file='../Layout/header.tpl'}
              
                {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try Again.</div>{/if}
       <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                           aria-expanded="true" aria-controls="collapseOne">
                            <i class="fa fa-user"></i> {$full_name} [Ticket #{$ticket_id}] - {$ago}</a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                           <tr>
                             <td>{$message}</td>
                           </tr>
                        </table>   
                    </div>
                </div>
           </div>
	   {foreach from=$replies item=foo}
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="{$foo['id']}">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapse{$foo['id']}" aria-expanded="true" aria-controls="collapse{$foo['id']}">
                            <i class="fa fa-user"></i> {$foo['full_name']} - {$foo['ago']}</a>
                    </h4>
                </div>
                <div id="collapse{$foo['id']}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="{$foo['id']}">
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td>{$foo['message']}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
       {/foreach}
                            <hr>
                            <div class="col-md-12">
                                <div class="card-box">
                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>
                                                <input type="hidden" name="id" value="{$ticket_id}"/>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
                                                        <script src="{$AST}ckeditor/ckeditor.js"></script>
	                                                    <textarea type="text" name="message" id="editor1" rows="10" cols="90" class="form-control" placeholder="Your reply"></textarea>
	                   <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace( 'editor1' );
                        </script>
	                                                </div>
	                                            </div>

                                                <button type="submit" name="reply" value="reply" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-comment"></i>  Reply</button>
	                                        </form>
	                                        {include file='../Layout/back.tpl'}
                            </div>
                                 </div>
        </div>
       
 {include file='../Layout/footer.tpl'}