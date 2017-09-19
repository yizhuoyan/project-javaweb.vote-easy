
(function($) {

$.fn.addInputArea = function(option) {
  return this.each(function() {
    new AddInputArea(this, option);
  });
};

function AddInputArea(elem, option) {
  this.elem = elem;
  this.option = option;

  this._setOption();
  this._setDelBtnVisibility();
  this._ehAddBtn();
  this._ehDelBtn();
  this._setNameAttribute();
  this._saveOriginal();
}

$.extend(AddInputArea.prototype, {

  _setOption: function() {
    var id = $(this.elem).attr('id');
    this.option =  $.extend({
      attr_name : (id) ? id  + '_%d'       : 'aia_%d',
      area_var  : (id) ? '.' + id + '_var' : '.aia_var',
      area_del  : '',
      btn_del   : (id) ? '.' + id + '_del' : '.aia_del',
      btn_add   : (id) ? '.' + id + '_add' : '.aia_add',
      after_add : null,
      maximum   : 0
    }, this.option);
    if (!this.option.area_del) this.option.area_del = this.option.btn_del;
  },

  _setDelBtnVisibility: function() {
    if ($(this.elem).find(this.option.area_var).length == 1) {
      $(this.elem).find(this.option.area_del).hide();
    }
  },

  _ehAddBtn: function() {
    var self = this;
    $(document).on('click', this.option.btn_add, function(ev) {

      var len_list = $(self.elem).find(self.option.area_var).length;
      var new_list = $(self.option.original).clone(true);

      $(new_list)
        .find('[name]').each(function(idx, obj) {

          self._changeAttrAlongFormat(obj, len_list, 'name');
          self._changeAttrAlongFormat(obj, len_list, 'id');


          if ($(obj).attr('empty-val') != 'false') {
              if (
                $(obj).attr('type') == 'checkbox' ||
                $(obj).attr('type') == 'radio'
              ) {
                  obj.checked = false;
              } else if (
                $(obj).attr('type') != 'submit' &&
                $(obj).attr('type') != 'reset' &&
                $(obj).attr('type') != 'image' &&
                $(obj).attr('type') != 'button'
              ) {
                  $(obj).val('');
              }
          }
          else { $(obj).val(0); }
        }).end()
        .find('[for]').each(function (idx, obj) {

            self._changeAttrAlongFormat(obj, len_list, 'for');
        });

      $(self.elem).append(new_list);

      $(self.elem).find(self.option.area_del).show();


      if (
        self.option.maximum > 0 &&
        $(self.elem).find(self.option.area_var).length >= self.option.maximum
      ) {
        $(self.option.btn_add).hide();
      }

      if (typeof self.option.after_add == 'function') self.option.after_add();

      $("#MaxCheck").append("<option value='" + (len_list + 1) + "'>\u6700\u591a\u9009" + (len_list + 1) + "\u9879</option>");

      var galleryUploader = new qq.FineUploader({
          debug: true,
          element: $("#options_list_" + len_list + "")[0],
          template: "pic-template",
          extraButtons: [
            {
                element: document.getElementById("picbutton_" + len_list + ""),

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
              sizeLimit: 2097152
          },
          callbacks: {
              onComplete: function (id, name, response) {
                  var previewLink = qq(this.getItemByFileId(id)).getByClass('preview-link')[0];
                  var $picLink = $("#options_list_" + len_list + "").siblings(".pic-link");

                  if (response.success) {
                      previewLink.setAttribute("href", response.imgurl);
                      $picLink.val($picLink.val() + response.imgurl)
                  }
              },
              onDeleteComplete: function (id, xhr, isError) {
                  var $picLink = $("#options_list_" + len_list + "").siblings(".pic-link");
                  $picLink.val("")
              }
          }
      });
    });
  },

  _ehDelBtn: function() {
    var self = this;
    $(self.elem).on('click', self.option.btn_del, function(ev) {
      ev.preventDefault();

      var idx = $(self.elem).find(self.option.btn_del).index(ev.target);
      $(self.elem).find(self.option.area_var).eq(idx).remove();


      self._setDelBtnVisibility();


      self._setNameAttribute();


      if (
        self.option.maximum > 0 &&
        $(self.elem).find(self.option.area_var).length < self.option.maximum
      ) {
        $(self.option.btn_add).show();
      }

      $("#MaxCheck option:last-child").remove();
      $("#options_list").append('<input id="DelVoteItemList_' + $("#options_list .del-link").length + '__Id" name="DelVoteItemList[' + $("#options_list .del-link").length + '].Id" class="del-link" type="hidden" value=' + $(this).parent().parent().siblings(".id-link").val() + ' />');
    });
  },

  _setNameAttribute: function() {
    var self = this;
    $(this.elem).find(this.option.area_var).each(function(idx, obj) {
      $(obj)
        .find('[name]').each(function() {

          self._changeAttrAlongFormat(this, idx, 'name');
          self._changeAttrAlongFormat(this, idx, 'id');
        }).end()
        .find('[for]').each(function () {

            self._changeAttrAlongFormat(this, idx, 'for');
        });
    });
  },

  _saveOriginal: function() {
    this.option.original = $(this.elem).find(this.option.area_var).eq(0).clone(true);
  },

  _changeAttrAlongFormat: function (obj, idx, type) {
      var changed = null;
      if (/^.+_\d+$/.test($(obj).attr(type))) {
          changed = $(obj).attr(type).replace(/^(.+_)\d+$/, '$1' + idx);
      } else {

          try {
              switch (type) {
                  case 'name':
                      if ($(obj).attr('name-format')) {
                          changed = $(obj).attr('name-format').replace('%d', idx);
                      } else {
                          throw new Error(
                            '(jquery.addInputArea)\n' +
                            'Not found "name-format" attribute in\n' +
                            '<' + $(obj)[0].tagName + ' ' + type + '="' + $(obj).attr(type) + '">'
                          );
                      }
                      break;

                  case 'id':
                      if ($(obj).attr('id-format')) {
                          changed = $(obj).attr('id-format').replace('%d', idx);
                      } else if ($(obj).attr('id')) { 
                          throw new Error(
                            '(jquery.addInputArea)\n' +
                            'Not found "name-format" attribute in\n' +
                            '<' + $(obj)[0].tagName + ' ' + type + '="' + $(obj).attr(type) + '">'
                          );
                      }
                      break;

                  case 'for':
                      if ($(obj).attr('for-format')) {
                          $(obj).html('\u9009\u9879' + (idx + 1));
                          changed = $(obj).attr('for-format').replace('%d', idx);
                      } else {
                          throw new Error(
                            '(jquery.addInputArea)\n' +
                            'Not found "name-format" attribute in\n' +
                            '<' + $(obj)[0].tagName + ' ' + type + '="' + $(obj).attr(type) + '">'
                          );
                      }
                      break;
              }
          } catch (e) {
             // alert(e);
          }
      }
      $(obj).attr(type, changed);
  }
});

})(jQuery);