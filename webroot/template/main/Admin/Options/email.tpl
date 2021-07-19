{include file="../Layout/header.tpl"}
                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
                                   {if $do_demo}<div class="alert alert-danger">Error: You can't do this action on demo mode.</div>{/if}
                                   {if $mailer}<div class='alert alert-success'>Email settings saved with success</div>{/if}
                                   {if $do_error}<div class='alert alert-danger'>Error: Somthing Wrong! Please Try again.</div>{/if}
                                   {include file='../Options/main.tpl'}
                                   
                                   <form class="form-horizontal" method="POST">
                                       
                                       <input type="hidden" name="up-email" value="up-email" />
                                       <div class="form-group">
                                           <label for="Type" class="col-md-10">
                                               Type
                                           </label>
                                           <div class="col-md-6">
                                               <select id="select_role" name="option" class="form-control">
                                                   <option value="smtp" {if do_config(35)=='smtp'}selected="selected"{/if}>SMTP</option>
                                                   <option value="php_mail" {if do_config(35)=='php_mail'}selected="selected"{/if}>PHP Mail</option>
                                               </select>
                                          </div>
                                       </div>
                                       <script>
                                           document.getElementById('select_role').addEventListener('change', function () {
                                               var style = this.value == 'php_mail' ? 'block' : 'yes';
                                               document.getElementById('hidden_div').style.display = style;
                                               var style = this.value == 'smtp' ? 'block' : 'none';
                                               document.getElementById('hidden_div').style.display = style;
                                           });
                                       </script>
                                       <div class="form-group">
                                           <label for="Supportemail" class="col-md-10"> Support email </label>
                                           <div class="col-md-6">
                                               <input type="text" name="support_email" class="form-control" value="{do_config(12)}"/>
                                           </div>
                                       </div>
                                       <div id="hidden_div" {if do_config(35) == 'smtp'} style="display: yes;" {else} style="display: none;" {/if}>
                                            <div class="form-group">
                                               <label for="Username" class="col-md-10"> Username</label>
                                               <div class="col-sm-6">
                                                   <input type="text" name="username" class="form-control" value="{do_config(36)}"/>
                                               </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Port" class="col-md-10"> Port </label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="port" class="form-control" value="{do_config(38)}"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Host" class="col-md-10"> Host </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="host" class="form-control" value="{do_config(37)}"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Using" class="col-md-10">Using</label>
                                                <div class="col-md-6">
                                                    <select name="ssl" class="form-control">
                                                        <option value="ssl" {if do_config(39) == 'ssl'} selected="selected" {/if}>SSL</option>
                                                        <option value="tls" {if do_config(39) == 'tls'} selected="selected" {/if} >TLS</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Password" class="col-md-10"> Password</label>
                                                <div class="col-md-6">
                                                    <input type="password" name="pass" class="form-control" value="{do_config(40)}"/>
                                                </div>
                                            </div>
                                        </div>
                                            <button type="submit" class="btn btn-black waves-effect w-md m-b-5"><i class="fa fa-check-circle"></i> {$_SAVE}</button>
                                   </form>
                               </div>
                            </div>
                        </div>
{include file="../Layout/footer.tpl"}