function ValidatePost() {
    if ($("#PostName").val().length < 1 || $("#PostName").val().length > 200) {
        AlertMsg("error", "发帖标题字数不能为空，且不能超过200字");
        return false;
    }
    if ($("#Content").val().length < 1) {
        AlertMsg("error", "发帖内容字数不能为空，且不能超过2000字");
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
});