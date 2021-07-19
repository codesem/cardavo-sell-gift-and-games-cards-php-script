{include file='../Layout/header.tpl'}

                        <div class="row">

                            <div class="col-md-12">
                                <div class="card-box">
                                    <h4>Go Premium</h4>
                                    <div class="text-center">
                                        <div id="premium-data"></div><br>
                                    </div>

                                    <div class="form-horizontal" id="activation-form" 
                                    {if $prmcode} style="display:none;" {/if}>
	                                            <div class="form-group">
	                                                <div class="col-md-10">
	                                                    <input type="text" id="code" class="form-control" placeholder="Purchase Code">
	                                                    <em>Get Your Purchase Code By Purchasing The 
	                                                       <a href="https://codsem.com/item/6681/cardavo-sell-gift-games-cards-php-script/" target="_blank">(Premium Version)</a>
	                                                    </em>
	                                                </div>
	                                            </div>
                                                <button onclick="DoPremium(code.value);" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-check-circle"></i>  Go Premium</button>
	                                </div>
                                    <div class="form-horizontal" id="premium-form" 
                                    {if !$prmcode} style="display:none;" {/if}>
                                        <div class="text-center">
                                            <h4>Congratulations You Have The Premium Version Now!</h4>
                                            <p>Now you can enjoy all amazing features that CARDAVO provide</p>
                                            <hr>
                                            <img src="{$UPD}images/script.svg" alt="cardavo" width="750" height="350">
                                        </div>
	                                </div>
                                </div> <!-- end card -->
                              
                            </div>
                            <!-- end col -->

                        </div>
                        <!-- end row -->

{include file='../Layout/footer.tpl'}