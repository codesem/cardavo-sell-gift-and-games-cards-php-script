{include file='../Layout/header.tpl'}
                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                                            <h6>You need to complete this step (Updating Database)</h6>
                        					<form class="form-horizontal" method="POST">
                                              
                                                <input type="hidden" name="csrf" value="{$csrfToken}"/>

                                               <button type="submit" name="complete" value="complete" class="btn btn-primary btn-bordered waves-effect w-md m-b-5"> Complete</button>
	                                        </form>
                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->
                        
{include file='../Layout/footer.tpl'}