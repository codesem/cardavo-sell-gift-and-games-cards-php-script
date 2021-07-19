{include file='../Layout/header.tpl'}

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">
                                    <div class="form-vertical">
                                        <div class="form-group">
                                            <div class="col-md-3">
                                                <input type="text" class="form-control" disabled="disabled" value="Your version: {$APPversion}">
                                            </div>
                                        </div>
                                        <button onclick="CheckUpdate('{$APPversion}')" id="check-btn" class="btn btn-primary waves-effect w-md m-b-5"><i class="fa fa-refresh"></i> Check for Update</button>
                                    </div>
                                    <h6 style="display: inline-block;"><i class="fa fa-spinner" id="loader-version" style="display: none;"></i></h6>
                                    <span id="update-msg"></span><hr>
                                    <div id="update-form" style="display: none;">
                                        <div class="text-center">
                                            <h3>Update Your Version</h3>
                                            <p>Click the update button to start.</p>
                                        </div>
                                        <div class="text-center">
                                            <div id="update-data">
                                                <button onclick="DoUpdate('{$APPversion}')" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-refresh"></i> Update</button>
                                            </div>
                                        </div>
	                                </div>
	                           </div> <!-- end card -->
                            </div>
                            <!-- end col -->
                        </div>
                        <!-- end row -->

{include file='../Layout/footer.tpl'}