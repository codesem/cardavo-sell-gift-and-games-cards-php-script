{include file="$TMP/Layout/header.tpl"}

    <section class="four-zero d-flex align-items-center">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-8 col-sm-6 ">
                    <img src="{$AST}custom/img/slider-img/404-fun.svg" alt="{$_CSRF_MIS}">
                </div>
                <div class="col-12 col-sm-6">
                    <div class="four-0-inner">
                        
                        <h3><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>{$_OOPS}!</h3>
                        <h6>{$_CSRF_MIS}</h6>
                        <p>{$__CSRF_MIS}</p>
                        <a class="go-back" href="{$HOST}"><i class="fa fa-arrow-left" aria-hidden="true"></i>{$_GO_BACK}</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
{include file="$TMP/Layout/footer.tpl"}