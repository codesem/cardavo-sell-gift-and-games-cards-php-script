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
To enable Coinbase as a deposit processor, you need to navigate to Admin Area  >> Options >> Payment Motheds >> Deposit Processor from there select coinbase.
</p>
<p>
Add your "API Key" and "Shared Secret" by doing the following:
</p>


<p>1 Login To your Coinbase Commerce account <a href="https://commerce.coinbase.com/signin" target="_blank">here</a></p>
<p>2 Go to Settings > API keys</p>
<p>3 Click on "Create an API key" button You will get your API key.</p>
<p>4 Add an endpoint in > Settings > Webhook subscriptions, Enter in the endpoint URL <b>https://yourdomain.com/ipn/cbs_handler</b> ** replace <b>"yourdomain.com"</b> with your actual website address.</p>
<p>5 Click on "Show shared secret" button You will get your Webhook Shared Secret</p>
<p>That's it!</p>
                        </div>

                    </div>
                </div>
            </div>
          </section>
          <!-- END HOME -->
          
{include file="$TMP/Layout/Pages/footer.tpl"}