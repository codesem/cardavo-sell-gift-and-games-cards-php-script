<script>
    function checkAvailability() {
        $("#loader-availability").show();
        jQuery.ajax({
            url: "{$HOST}ajax/username-availability",
            data:'username='+$("#username").val(),
            type: "POST",
            success:function(data){
                $("#user-availability-status").html(data);
                $("#loader-availability").hide();
            },
            error:function (){}
        });
    }
    function getStock(val) {
        $("#loader").show();
        $.ajax({
            type: "POST",
            url: "{$HOST}ajax/stock",
            data:'istock='+val,
            success: function(data){
                $("#input-data").html(data);
                $("#loader").hide();
            }
        });
    }
    function AddCart(prod_id) {
        var queryString = 'prod_id='+prod_id+'&amount='+$("#amount").val()+'&qty='+$("#qty").val();
        jQuery.ajax({
            url: "{$HOST}ajax/add-cart",
            data:queryString,
            type: "POST",
            success:function(data){
                var result = $.trim(data);
                if(result==="error"){
                    $("#alert-msg").html('<i class="fa fa-times"></i> {$__SOME_WRONG}');
                    $("#added-alert").show();
                }else if (result === "exist"){
                    $("#alert-msg").html('<i class="fa fa-warning"></i> {$__PRODUCT_EXIST}');
                    $("#added-alert").show();
                }else{
                    $("#alert-msg").html('<i class="fa fa-check"></i> {$__PRODUCT_ADDED_CART}');
                    $("#cart-list").html(data);
                    $("#cart-list-mobile").html(data);
                    $("#added-alert").show();
                }
            },
            error:function (data){}
        });
    }
    function getTax(total,method) {
        $("#loader-tax").show();
        $("#loader-total").show();
        var queryString = 'total='+total+'&method='+method;
        var symbol = "{do_config(2)}";
        var decimal = "{do_config(15)}";
        $.ajax({
            type: "POST",
            url: "{$HOST}ajax/tax",
            data:queryString,
            success: function(data){
                var totalTax = Number(total) + Number(data);
                var result = $.trim(data);
                $("#tax-tag").html(result);
                $("#total").html(symbol+parseFloat(totalTax).toFixed(decimal));
                $("#loader-tax").hide();
                $("#loader-total").hide();
            }
        });
    }
    function EmptyCart() {
        jQuery.ajax({
            url: "{$HOST}ajax/empty-cart",
            data:'remove=all',
            type: "POST",
            success:function(data){
                var result = $.trim(data);
                if(result!="error"){
                    $("#cart-list").html(data);
                }
            },
            error:function (data){}
        });	
    }
    function ReadAll() {
        jQuery.ajax({
            url: "{$HOST}ajax/read-notifications",
            data:'read=all',
            type: "POST",
            success:function(data){
                var result = $.trim(data);
                $("#read-notidications").html(result);
            },
            error:function (data){}
        });	
    }
    function getTaxPayPal(total) {
        $("#loader-tax-paypal").show();
        $("#loader-total-paypal").show();
        var queryString = 'total='+total+'&method=paypal';
        var symbol = "{do_config(2)}";
        var decimal = "{do_config(15)}";
        $.ajax({
            type: "POST",
            url: "{$HOST}ajax/tax",
            data:queryString,
            success: function(data){
                var totalTax = Number(total) + Number(data);
                $("#tax-tag-paypal").html(data);
                $("#total-paypal").html(symbol+parseFloat(totalTax).toFixed(decimal));
                $("#loader-tax-paypal").hide();
                $("#loader-total-paypal").hide();
            }
        });
    }
    function getTaxCoinbase(total) {
        $("#loader-tax-coinbase").show();
        $("#loader-total-coinbase").show();
        var queryString = 'total='+total+'&method=coinbase';
        var symbol = "{do_config(2)}";
        var decimal = "{do_config(15)}";
        $.ajax({
            type: "POST",
            url: "{$HOST}ajax/tax",
            data:queryString,
            success: function(data){
                var totalTax = Number(total) + Number(data);
                $("#tax-tag-coinbase").html(data);
                $("#total-coinbase").html(symbol+parseFloat(totalTax).toFixed(decimal));
                $("#loader-tax-coinbase").hide();
                $("#loader-total-coinbase").hide();
            }
        });
    }
    function getTaxStripe(total) {
        $("#loader-tax-stripe").show();
        $("#loader-total-stripe").show();
        var queryString = 'total='+total+'&method=stripe';
        var symbol = "{do_config(2)}";
        var decimal = "{do_config(15)}";
        $.ajax({
            type: "POST",
            url: "{$HOST}ajax/tax",
            data:queryString,
            success: function(data){
                var totalTax = Number(total) + Number(data);
                $("#tax-tag-stripe").html(data);
                $("#total-stripe").html(symbol+parseFloat(totalTax).toFixed(decimal));
                $("#loader-tax-stripe").hide();
                $("#loader-total-stripe").hide();
            }
        });
    }
</script>