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
To enable PayPal as a payment method, you need to navigate to Admin Area  >> Payment Motheds >> PayPal from there enable PayPal and add your PayPal email address you wish to receive payments on.
</p>
<p>
For automatic approve successful payments into your website you will need to enable  a return link into your business PayPal account by doing the following:
</p>


<p>1 Log into your PayPal account</p>
<p>2 Go to Profile then “My Selling Tools”</p>
<p>3 Look for an option labelled “Website preferences”. Click on the update button for that option.</p>
<p>4 Click checkbox  "on" for “Auto Return”</p>
<p>5 Enter the URL of your website in Return URL Like https://example.com/advertiser/deposits/Paypal_ipn Make sure to replace https://example.com with your actual website address.</p>
<p>6 Look for an option labelled “Payment Data Transfer (optional)”. Click checkbox "on". </p>
<p>7 Look for an option labelled “PayPal Account Optional”. Click checkbox "on" and hit “Save”.</p>
<p>That's it!</p>
                        </div>

                    </div>
                </div>
            </div>
          </section>
          <!-- END HOME -->
          
{include file="$TMP/Layout/Pages/footer.tpl"}