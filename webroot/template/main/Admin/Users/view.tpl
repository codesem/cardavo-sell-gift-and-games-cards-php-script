{include file='../Layout/header.tpl'}
              
       <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                           aria-expanded="true" aria-controls="collapseOne">
                            Account Info</a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                           <tr>
                             <td>Id</td>
                             <td>#{$r_id}</td>
                           </tr>
                           <tr>
                            <td>Status</td>
                            
                          {if $r_status == '1'}
                            <td>Active</td>
                          {elseif $r_status == '2'}
                            <td>Pending</td>
                          {elseif $r_status == '3'}
                            <td>Inactive</td>
                          {/if}
                          
                            </tr>
                            <tr>
                             <td>Username</td>
                             <td>{$r_username}</td>
                            </tr>
                            <tr>
                              <td>Role</td>
                              <td>{$r_role}</td>
                            </tr>
                            <tr>
                              <td>Email</td>
                              <td>{$r_email}</td>
                            </tr>
                            <tr>
                              <td>User balance</td>
                              <td>{$r_balance} <b>{$sumbole}</b></td>
                            </tr>
                            <tr>
                              <td>Created</td>
                              <td>{$r_created}</td>
                            </tr>
                        </table>
                    </div>
                </div>
           </div>
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            IP Info</a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td>Login IP</td>
                                <td>{$r_login_ip}</td>
                            </tr>
                            <tr>
                                <td>Registred IP</td>
                                <td>{$r_register_ip}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

           
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                    <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            Billing Info</a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td>First Name</td>
                                <td>{$r_first_name}</td>
                            </tr>
                            <tr>
                                <td>Last Name</td>
                                <td>{$r_last_name}</td>
                            </tr>
                            <tr>
                                <td>Country</td>
                                <td>{$r_country}</td>
                            </tr>
                            <tr>
                                <td>Address Line 1</td>
                                <td>{$r_address_one}</td>
                            </tr>
                            <tr>
                                <td>Address Line 2</td>
                                <td>{$r_address_two}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
 {include file='../Layout/footer.tpl'}