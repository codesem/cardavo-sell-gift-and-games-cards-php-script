<script>
    function CheckUpdate(version) {
        $("#loader-version").show();
        jQuery.ajax({
            url: "{$HOST}ajax/check-update",
            data:'version='+version,
            type: "POST",
            success:function(data){
                console.log(data);
                var result = $.trim(data);
                
                $("#loader-version").hide();
                $("#check-btn").attr("disabled", true);
                if(result === 'ok'){
                    $("#update-msg").html("<span class='badge badge-success'><i class='fa fa-check-circle'></i> Your version is up to date</span>");
                }else{
                    $("#update-msg").html(data);
                    $("#update-form").show();
                }
            },
            error:function (data){}
        });
    }
    function DoUpdate(version) {
        jQuery.ajax({
            url: "{$HOST}ajax/file-upload",
            data:'update='+version,
            type: "POST",
            success:function(data){
                $("#update-data").html(data);
            },
            error:function (data){}
        });
    }
    function DoPremium(purchase_code) {
        jQuery.ajax({
            
            url: "{$HOST}ajax/premium",
            data:'purchase_code='+purchase_code,
            type: "POST",
            success:function(data){
                var result = $.trim(data);
                    //$("#premium-data").html(data);

                if(result === 'error'){
                    $("#premium-data").html("<span class='badge badge-danger'><i class='fa fa-times'></i> Purchase Code Wrong</span>");
                }else if(result === 'success'){
                    $("#premium-data").html("<span class='badge badge-success'><i class='fa fa-check'></i> Your Premium Version Was Activated!</span>");
                    $("#premium-form").show();
                    $("#activation-form").hide();
                }
            },
            error:function (data){}
        });
    }
    function uploadUpdate() {
        var formData = new FormData($("#upload_form")[0]);
                
                $("#progress").show();
                $.ajax({
                    xhr: function() {
                        var xhr = new window.XMLHttpRequest();
                        xhr.upload.addEventListener("progress", function(evt) {
                            if (evt.lengthComputable) {
                                var percentComplete = evt.loaded / evt.total;
                                percentComplete = parseInt(percentComplete * 100);
                                $('.progress-bar').width(percentComplete+'%');
                                $('.progress-bar').html(percentComplete+'%');
                            }
                        }, false);
                        return xhr;
                    },
                    url: "{$HOST}ajax/file-upload",
                    data: formData,
                    type: "POST",
                    processData: false,
                    contentType: false,
                    beforeSend: function() {
                    },
                    success:function(data){
                        $("#upload-files").hide();
                    },
                    complete: function (data) {
                        $("#progress").hide();
                        $("#response").html(data['responseText']);
                        $('.submitBtn').removeAttr('disabled');
                    },
                    error:function (){}
                });
    }
    function uploadTheme() {
        var formData = new FormData($("#upload_form")[0]);
                
                $("#progress").show();
                $.ajax({
                    xhr: function() {
                        var xhr = new window.XMLHttpRequest();
                        xhr.upload.addEventListener("progress", function(evt) {
                            if (evt.lengthComputable) {
                                var percentComplete = evt.loaded / evt.total;
                                percentComplete = parseInt(percentComplete * 100);
                                $('.progress-bar').width(percentComplete+'%');
                                $('.progress-bar').html(percentComplete+'%');
                            }
                        }, false);
                        return xhr;
                    },
                    url: "{$HOST}ajax/theme-upload",
                    data: formData,
                    type: "POST",
                    processData: false,
                    contentType: false,
                    beforeSend: function() {
                    },
                    success:function(data){
                        $("#upload-files").hide();
                    },
                    complete: function (data) {
                        $("#progress").hide();
                        $("#response").html(data['responseText']);
                        $('.submitBtn').removeAttr('disabled');
                    },
                    error:function (){}
                });
    }
    function UploadedFiles() {
        jQuery.ajax({
            url: "{$HOST}ajax/files-uploaded",
            data:'files=all',
            type: "POST",
            success:function(data){
                $("#uploaded-thumbnail").html(data);
                $("#uploaded-previewImage").html(data);
            },
            error:function (data){}
        });
    }
    function UploaderFiles() {
        var formData = new FormData($("#upload_form")[0]);
                
                $("#progress").show();
                $.ajax({
                    xhr: function() {
                        var xhr = new window.XMLHttpRequest();
                        xhr.upload.addEventListener("progress", function(evt) {
                            if (evt.lengthComputable) {
                                var percentComplete = evt.loaded / evt.total;
                                percentComplete = parseInt(percentComplete * 100);
                                $('.progress-bar').width(percentComplete+'%');
                                $('.progress-bar').html(percentComplete+'%');
                            }
                        }, false);
                        return xhr;
                    },
                    url: "{$HOST}ajax/product-files-upload",
                    data: formData,
                    type: "POST",
                    processData: false,
                    contentType: false,
                    beforeSend: function() {
                    },
                    success:function(data){
                        $("#uploaded-files").html(data);
                        $("#progress").hide();
                    },
                    complete: function (data) {
                        UploadedFiles(); 
                    },
                    error:function (){}
                });
    }
    function RemoveFile(sess_id) {
        jQuery.ajax({
            url: "{$HOST}ajax/file-remove",
            data:'sess_id='+sess_id,
            type: "POST",
            success:function(data){
                $("#hide-"+sess_id).fadeOut();
            },
            complete: function (data) {
                UploadedFiles(); 
            },
            error:function (data){}
        });
    }
    function fetchAmounts(val) {
        $("#loader").show();
        $.ajax({
            type: "POST",
            url: "{$HOST}ajax/fetch-amounts",
            data:'prod_id='+val,
            success: function(data){
                $("#select-data").html(data);
                $("#loader").hide();
            }
        });
    }
</script>
