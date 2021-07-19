{include file="../Layout/header.tpl"}

                        <div class="row">
                            <div class="col-sm-12">
                               <div class="card-box">
                                   {if $added}<div class='alert alert-success'>Theme Uploaded Successfully!</div>{/if}
                                   {if $deactivated}<div class='alert alert-success'>Theme Deactivated Successfully</div>{/if}
                                   {if $activated}<div class='alert alert-success'>Theme Activated Successfully</div>{/if}
                                   {if $deleted}<div class="alert alert-success">Theme Deleted Successfully</div>{/if}
                                   {if $required}<div class="alert alert-danger">Error: All Fields Are Required!</div>{/if}
                                   {if $do_error}<div class="alert alert-danger">Error: Somthing Wrong! Please Try again.</div>{/if}
                                   {if $do_demo}<div class="alert alert-danger">Error: You can't do this action on demo mode.</div>{/if}
                                   {include file='../Options/main.tpl'}
                                   
                                   <form id="upload_form" class="form-horizontal" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="theme" value="theme"/>
                                        <input type="hidden" name="csrf" value="{$csrfToken}"/>
                                        <div class="form-group text-center">
                                            <div class="col-md-6">
                                                <label for="Icon" >ZIP FILE (THEME)</label>
                                                    <div id="upload-files" class="upload-file">
                                                        <label for="file-input">
                                                            <i class="fa fa-cloud-upload up-icon"></i>
                                                        </label>
                                                        <input id="file-input" type="file" name="theme-file" onchange="uploadTheme()"/>
                                                    </div>
                                                    <div id="progress" class="progress" style="display: none;">
                                                        <div class="progress-bar progress-bar-striped bg-success" role="progressbar"
                                                        aria-valuemin="0" aria-valuemax="100" style="width:0%">0%
                                                        </div>
                                                    </div>
                                                    <div id="response" class=""></div>
                                                    <div class="text-center">
                                                        <button type="submit" class="btn btn-black waves-effect w-md m-b-5 submitBtn" disabled="disabled"><i class="fa fa-plus-circle"></i> Upload</button>
                                                    </div>
                                            </div>
                                        </div>
                                    </form><br/>
                                    <div class="row">
                            {foreach from=$themes item=foo}
                                        <div class="col-lg-4">
                                            <div class="theme-design" style="margin-right:10px;margin-top: 15px;">
                                                <img src="{$HOST}template/{$foo['name']}/Assets/{$foo['screen']}" style="width: 100%;height: 100%;">
                                            </div><br>
                                            <form method="POST">
                                                <input type="hidden" name="id" value="{$foo['id']}"/>
                                                <input type="hidden" name="name" value="{$foo['name']}"/>
                                        {if $THEME == $foo['name']}
                                                <button type="submit" class="btn btn-info" disabled="disabled">Activated</button>
                                                <button type="submit" class="btn btn-danger" disabled="disabled">Delete</button>
                                        {else}
                                                <button type="submit" class="btn btn-info" name="activate" value="activate">Activate</button>
                                                <button type="submit" class="btn btn-danger" name="delete" value="delete">Delete</button>
                                        {/if}
                                            </form>
                                        </div> 
                            {/foreach}
                                        <div class="col-lg-4">
                                            <div class="theme-design" style="margin-top: 15px;">
                                                <a href="https://codsem.com/search?term=advartiso" target="_blank" ><img src="{$AST}images/new-theme.svg" style="width: 100%;height: 100%;"></a>
                                            </div><br>
                                            <button class="btn btn-info" disabled="disabled">Activate</button>
                                            <button class="btn btn-danger" disabled="disabled">Delete</button>
                                        </div>
                                    </div>
                                 </div>
                            </div>
                            
                        </div>
{include file="../Layout/footer.tpl"}