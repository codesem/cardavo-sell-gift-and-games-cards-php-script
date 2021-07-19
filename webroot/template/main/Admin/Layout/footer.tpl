            </div> <!-- container -->
                </div> <!-- content -->
                
                <footer class="footer text-right">
                   Version {$APPversion} | {$date} © {do_config(0)}
                </footer>
            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->
        </div>
        <!-- END wrapper -->

        <!-- =========================
    	     AJAX CALL
        ============================== -->
        {include file="$TMP/Ajax/admin.js.tpl"}

        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="{$AST}js/jquery.min.js"></script>
        <script src="{$AST}js/bootstrap.min.js"></script>
        <script src="{$AST}js/detect.js"></script>
        <script src="{$AST}js/fastclick.js"></script>
        <script src="{$AST}js/jquery.blockUI.js"></script>
        <script src="{$AST}js/waves.js"></script>
        <script src="{$AST}js/jquery.slimscroll.js"></script>
        <script src="{$AST}js/jquery.scrollTo.min.js"></script>
        
        <!-- Plugins  -->
        <script src="{$AST}plugins/switchery/switchery.min.js"></script>
        <script src="{$AST}plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.min.js"></script>
        <script type="text/javascript" src="{$AST}plugins/multiselect/js/jquery.multi-select.js"></script>
        <script type="text/javascript" src="{$AST}plugins/jquery-quicksearch/jquery.quicksearch.js"></script>
        <script src="{$AST}plugins/select2/js/select2.min.js" type="text/javascript"></script>
        <script src="{$AST}plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
        <script src="{$AST}plugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js" type="text/javascript"></script>
        <script src="{$AST}plugins/bootstrap-touchspin/js/jquery.bootstrap-touchspin.min.js" type="text/javascript"></script>
        <script src="{$AST}plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>

        <script type="text/javascript" src="{$AST}plugins/autocomplete/countries.js"></script>
        <script type="text/javascript" src="{$AST}pages/jquery.form-advanced.init.js"></script>

        <!-- Counter js  -->
        <script src="{$AST}plugins/waypoints/jquery.waypoints.min.js"></script>
        <script src="{$AST}plugins/counterup/jquery.counterup.min.js"></script>

        <!-- Flot chart js -->
        <script src="{$AST}plugins/flot-chart/jquery.flot.min.js"></script>
        <script src="{$AST}plugins/flot-chart/jquery.flot.time.js"></script>
        <script src="{$AST}plugins/flot-chart/jquery.flot.tooltip.min.js"></script>
        <script src="{$AST}plugins/flot-chart/jquery.flot.resize.js"></script>
        <script src="{$AST}plugins/flot-chart/jquery.flot.pie.js"></script>
        <script src="{$AST}plugins/flot-chart/jquery.flot.selection.js"></script>
        <script src="{$AST}plugins/flot-chart/jquery.flot.crosshair.js"></script>
        <script src="{$AST}plugins/bootstrap-daterangepicker/daterangepicker.js"></script>

        <!-- Dashboard init -->
        <script src="{$AST}pages/jquery.dashboard_2.js"></script>

        <!-- App js -->
        <script src="{$AST}js/jquery.core.js"></script>
        <script src="{$AST}js/jquery.app.js"></script>

    </body>
</html>