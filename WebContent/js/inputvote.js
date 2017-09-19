$("#options_list li").each(function () {
    var i = $(this).index();
    var galleryUploader = new qq.FineUploader({
        debug: true,
        element: $("#options_list_" + i + "")[0],
        template: "pic-template",
        extraButtons: [
        {
            element: document.getElementById("picbutton_" + i + ""),
        }
        ],
        request: {
            endpoint: "/Upload/UploadFile",
            accessKey: "AKIAJB6BSMFWTAXC5M2Q"
        },
        deleteFile: {
            enabled: true,
            method: "POST",
            forceConfirm: true,
            endpoint: "/Upload/DeleteImage"
        },
        validation: {
            allowedExtensions: ['jpeg', 'jpg', 'png'],
            itemLimit: 1,
            sizeLimit: 1048576
        },
        callbacks: {
            onComplete: function (id, name, response) {
                var previewLink = qq(this.getItemByFileId(id)).getByClass('preview-link')[0];
                var $picLink = $("#options_list_" + i + "").siblings(".pic-link")
                if (response.success) {
                    previewLink.setAttribute("href", response.imgurl);
                    $picLink.val($picLink.val() + response.imgurl)
                }
            },
            onDeleteComplete: function (id, xhr, isError) {
                var $picLink = $("#options_list_" + i + "").siblings(".pic-link");
                $picLink.val("")
            }
        }
    });
    if ($("#InputVoteItemList_" + i + "__Pic").val() != "") {
        galleryUploader._addCannedFile({
            thumbnailUrl: $("#InputVoteItemList_" + i + "__Pic").val(),
            name: $("#InputVoteItemList_" + i + "__ItemName").val(),
        })
    }
});

function ValidateVote() {
    if ($("#VoteName").val().length < 1 || $("#VoteName").val().length > 200) {
        AlertMsg("error", "投票标题字数不能为空，且不能超过200字");
        return false;
    }
    var $items = $("#options_list").children("li")
    if ($items.length < 2) {
        AlertMsg("error", "投票选项至少为两项");
        return false;
    }
    for (var i = 0; i < $items.length; i++) {
        if ($items.eq(i).find("input[type='text']").first().val().length < 1 || $items.eq(i).find("input[type='text']").first().val().length > 200) {
            AlertMsg("error", "投票选项不能为空，且不能超过200个字");
            $items.eq(i).find(".options-margin").focus();
            return false;
        }
    }
    if ($("#SelectType").val().length < 1) {
        AlertMsg("error", "请选择单选或多选");
        return false;
    }
    if ($("#b_CommentFlag").val().length < 1) {
        AlertMsg("error", "请选择是否允许评论");
        return false;
    }
    if ($("#b_AdvFlag").val().length < 1) {
        AlertMsg("error", "请选择是否去除广告");
        return false;
    }
    if ($("#b_VotePass").val().length < 1) {
        AlertMsg("error", "请选择是否需要投票密码");
        return false;
    }
    if ($("#b_VotePass").val() == "是" && ($("#VotePass").val().length < 1 || $("#VotePass").val().length > 6 || $("#VotePass").val() != parseInt($("#VotePass").val()) || $("#VotePass").val() < 0)) {
        AlertMsg("error", "请输入不超过6位的数字密码");
        return false;
    }
    if ($("#b_SumLimit").val().length < 1) {
        AlertMsg("error", "请选择是否票数上限");
        return false;
    }
    if ($("#b_SumLimit").val() == "是" && ($("#SumLimit").val().length < 1 || $("#SumLimit").val().length > 6 || $("#SumLimit").val() != parseInt($("#SumLimit").val()) || $("#SumLimit").val() < 1)) {
        AlertMsg("error", "请输入不超过6位的票数上限");
        return false;
    }
    if ($("#b_Intervals").val().length < 1) {
        AlertMsg("error", "请选择是否允许重复投票");
        return false;
    }
    if ($("#b_Intervals").val() == "是" && ($("#Intervals").val().length < 1 || $("#Intervals").val().length > 6 || $("#Intervals").val() != parseInt($("#Intervals").val()) || $("#Intervals").val() < 1)) {
        AlertMsg("error", "请输入不超过6位的重复投票时间");
        return false;
    }
    if ($("#b_ResultFlag").val().length < 1) {
        AlertMsg("error", "请选择投票后是否显示结果");
        return false;
    }
    if ($("#b_WechatFlag").val().length < 1) {
        AlertMsg("error", "请选择是否只能在微信里投票");
        return false;
    }
    if ($("#StyleColor").val().length < 1) {
        AlertMsg("error", "请选择风格颜色");
        return false;
    }
    if ($("#b_SortId").val().length < 1) {
        AlertMsg("error", "请选择投票分类");
        return false;
    }
    if ($("#EndTime").val().length < 1) {
        AlertMsg("error", "请选择投票截止时间");
        return false;
    }
    $(".submit").val("正在提交...");
    $(".submit").attr("disabled", "disabled");
}

$(function () {
    $("#Content").editable({
        buttons: ["bold", "fontSize", "color", "align", "createLink", "insertImage", "insertVideo"],
        maxCharacters: 2000,
        maxImageSize: 1024 * 1024 * 1,
        inlineMode: false,
        allowedImageTypes: ["jpeg", "jpg", "png", "gif"],
        minHeight: 100,
        maxHeight: 500,
        language: "zh_cn",
        direction: "ltr",
        imageUploadURL: "/Upload/FroalaUploadImage",
        pastedImagesUploadURL: '/Upload/FroalaUploadImageBaes64',
        defaultImageWidth: 0,
        videoAllowedTags: ["iframe"],
        enableScript: false
    }).on("editable.imageError", function (e, editor, error) {
        if (error.code == 1) { alert("链接已损坏") }
        else if (error.code == 2) { alert("返回链接有错误") }
        else if (error.code == 3) { alert("图片上传过程中出错") }
        else if (error.code == 4) { alert("解析响应失败") }
        else if (error.code == 5) { alert("图片不能大于1M") }
        else if (error.code == 6) { alert("图片格式必须jpeg，jpg，png，gif") }
        else { alert("未知错误") }
    }).on("editable.videoError", function (e, editor) {
        alert("请输入通用代码或优酷视频网址")
    }).on("editable.maxCharNumberExceeded", function () {
        notif({
            msg: "字数超出，多余字数将被截断！",
            type: "error",
            position: "center"
        });
    });

    $(".content_button").click(function () {
        if ($(this).val() == "添加说明") {
            $(this).val("关闭说明");
            $(".inputvote-content").show();
        } else {
            $(this).val("添加说明");
            $(".inputvote-content").hide();
        }
    });

    $(".function_tag label").click(function () {
        switch ($(this).html()) {
            case ("橙"):
                $(this).addClass("orange").siblings("label").removeClass();
                break;
            case ("紫"):
                $(this).addClass("purple").siblings("label").removeClass();
                break;
            case ("红"):
                $(this).addClass("red").siblings("label").removeClass();
                break;
            case ("黄"):
                $(this).addClass("yellow").siblings("label").removeClass();
                break;
            default:
                $(this).addClass("checked").siblings("label").removeClass();
        }
        $(this).siblings("input[type=hidden]").val($(this).html())
        if ($("#SelectType").val() == "单选") {
            $("#MaxCheck option:first").attr("selected", "selected");
        }
        if ($("#SelectType").val() == "多选") {
            $('#MaxCheck').show();
        }
        else {
            $('#MaxCheck').hide();
        }
        if ($("#b_SumLimit").val() == "是") {
            $('#SumLimit').show();
        }
        else {
            $('#SumLimit').hide();
        }
        if ($("#b_Intervals").val() == "是") {
            $('#Intervals').show();
        }
        else {
            $('#Intervals').hide();
        }
        if ($("#b_VotePass").val() == "是") {
            $('#VotePass').show();
        }
        else {
            $('#VotePass').hide();
        }
    });

    $("#dtBox").DateTimePicker({
        isPopup: false,
        dateTimeFormat: "yyyy-MM-dd HH:mm",
        buttonsToDisplay: ["HeaderCloseButton", "SetButton"],
    });

    $(document).on('click', '#add-viedo', function () {
        $(this).parents().siblings(".item-vid").toggle();
        if ($(this).val() == "视频") {
            $(this).val("关闭");
        } else {
            $(this).val("视频");
        }
    });

    $(document).on("click", "#add-content", function () {
        $(this).parents().siblings(".item-content").toggle();
        if ($(this).val() == "简介") {
            $(this).val("关闭");
        } else {
            $(this).val("简介");
        }
        $($(this).parents().siblings(".item-content").children("textarea")).editable({
            buttons: ["bold", "fontSize", "color", "align", "createLink", "insertImage", "insertVideo"],
            maxCharacters: 2000,
            maxImageSize: 1024 * 1024 * 1,
            inlineMode: false,
            allowedImageTypes: ["jpeg", "jpg", "png", "gif"],
            minHeight: 100,
            maxHeight: 500,
            language: "zh_cn",
            direction: "ltr",
            imageUploadURL: "/Upload/FroalaUploadImage",
            pastedImagesUploadURL: '/Upload/FroalaUploadImageBaes64',
            defaultImageWidth: 0,
            videoAllowedTags: ["iframe"],
            enableScript: false
        }).on("editable.imageError", function (e, editor, error) {
            if (error.code == 1) { alert("链接已损坏") }
            else if (error.code == 2) { alert("返回链接有错误") }
            else if (error.code == 3) { alert("图片上传过程中出错") }
            else if (error.code == 4) { alert("解析响应失败") }
            else if (error.code == 5) { alert("图片不能大于1M") }
            else if (error.code == 6) { alert("图片格式必须jpeg，jpg，png，gif") }
            else { alert("未知错误") }
        }).on("editable.videoError", function (e, editor) {
            alert("请输入通用代码或优酷视频网址")
        }).on("editable.maxCharNumberExceeded", function () {
            notif({
                msg: "字数超出，多余字数将被截断！",
                type: "error",
                position: "center"
            });
        });
    });

    $('#options_list').addInputArea({
    });
});