{include file="$TMP/Layout/Pages/header.tpl"}
      
        <!-- HOME -->
        <section>
            <div class="container-alt">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="wrapper-page">
                            <img src="{$AST}images/animat-customize-color.gif" alt="" height="120">
                            <h2 class="text-uppercase text-danger">{$site_title}</h2>
                            <p class="text-muted">
<p>
To make sure that you smtp for gmail works you need to config like this way:
</p>
<p>
- Insert your gmail account in support email field : example@gmail.com ** replace example with your username.<br />

- Make sure that Port field is <b>587</b>.<br />

- Make sure that host field is <b>smtp.gmail.com</b>.<br />

- Make sure that Ssl field is <b>tls</b>.<br />

- Make sure to enter your gmail account password.<br />
</p>

<p>
Now we need to to configure your gmail account by doing the following:
</p>


<p>1 Make sure to Log out from all your account in gmail.</p>
<p>2 Log in To your gmail account</p>
<p>3 Go to this <a href="https://myaccount.google.com/lesssecureapps" target="_blank">url</a> and click enable like this <a href="img/enable-access.png" target="_blank">image</a></p>
<p>4 Go to this <a href="https://accounts.google.com/DisplayUnlockCaptcha" target="_blank">url</a> and click carry on like this <a href="img/carry-on.png" target="_blank">image</a></p>
<p>5 That's it, Go to test if it's works.</p>
                            </p>

                        </div>

                    </div>
                </div>
            </div>
          </section>
          <!-- END HOME -->
          
{include file="$TMP/Layout/Pages/footer.tpl"}