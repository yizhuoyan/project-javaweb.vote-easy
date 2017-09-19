var cropperOptions = {
    uploadUrl: "/Upload/UploadOriginalImage",
    cropUrl: "/Upload/CroppedImage",
    outputUrlId: 'HeadFace',
    modal: true,
    customUploadButtonId: 'cropContainerHeaderButton',
    imgEyecandy: true,
    imgEyecandyOpacity: 0.2,
    doubleZoomControls: false,
    rotateControls: false,
    loaderHtml: '<div class="cssload-container"><div class="cssload-zenith"></div></div> ',
    onBeforeImgUpload: function () { console.log('onBeforeImgUpload') },
    onAfterImgUpload: function () { console.log('onAfterImgUpload') },
    onImgDrag: function () { console.log('onImgDrag') },
    onImgZoom: function () { console.log('onImgZoom') },
    onBeforeImgCrop: function () { console.log('onBeforeImgCrop') },
    onAfterImgCrop: function () { console.log('onAfterImgCrop') },
    onReset: function () { console.log('onReset') },
    onError: function (errormessage) { console.log('onError:' + errormessage) }
}
var cropper = new Croppic('croppic', cropperOptions);