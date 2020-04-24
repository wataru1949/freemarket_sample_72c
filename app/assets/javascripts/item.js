$(function(){
  //複数表示機能
  var dataBox = new DataTransfer();
  $(document).on('change', '.img-man', function(){
    $.each(this.files, function(i, file){
      var fileReader = new FileReader();
      dataBox.items.add(file)
      fileReader.readAsDataURL(file);
      fileReader.onloadend = function() {
        var num = $('.item-image-container__unit').length
        var src = fileReader.result
        var html =  `<div class="item-image-container__unit__image">
                        <img src="${src}">
                      <div class="image-option__list--tag btn-${num}">削除</div>
                    </div>`
        
        var field = `<div class="item-image-container__unit preview-${num}">
                      <div class="image-container__unit--guide">
                        <label for="image-label-${num}">
                          <input class="img-man" id="image-label-${num}" type="file" name="item[item_images_attributes][${num}][image]">
                          <div class="have-image">
                            <i class="fas fa-camera"></i>
                          </div>
                        </label>
                      </div>
                    </div>`
        $(html).appendTo(`.preview-${num - 1}`)
        
        if (num < 10 ) { 
          $(field).appendTo('.image-container_unit-man')
        }
        return html
      };
    });
  });
  //削除
  $(document).on("click", ".image-option__list--tag", function(){
    var num = $('.item-image-container__unit').length
    var field_2 = `<div class="item-image-container__unit preview-0">
                    <div class="image-container__unit--guide">
                      <label for="image-label">
                        <input class="img-man" id="image-label-0" type="file">
                        <div class="have-image">
                          <i class="fas fa-camera"></i>
                        </div>
                      </label>
                    </div>
                  </div>`
    $(this).parent().parent().remove();
    $(".item-image-container__unit").removeClass(`preview-${num - 1}`)
    $(".item-image-container__unit").addClass(`preview-${num - 2}`)
    if(num == 1) { 
      $(field_2).appendTo('.image-container_unit-man')
    }
    $(`input.check-box-${num - 2}`).prop('checked', true);
  });
  //文字カウント
  $('.exhibit-form-detail').keyup(function(){
    var count = $(this).val().length;
    $('.explain-container_text-box_info').text(count + "/1000");
  });
  //配送方法
  $('#item_shipping_cost_id').change(function(){
    var cost = $('option:selected').text();  
    if ( cost.match(/着払い/)) {
      a = $('select#item_shipping_method_id option[value=2]').remove();
      b = $('select#item_shipping_method_id option[value=3]').remove();
      c = $('select#item_shipping_method_id option[value=5]').remove();
      d = $('select#item_shipping_method_id option[value=6]').remove();
      e = $('select#item_shipping_method_id option[value=9]').remove();
      f = $('select#item_shipping_method_id option[value=10]').remove();
      }
    if ( cost.match(/送料込み/)) {
      g = $('select#item_shipping_method_id option[value=1]')
      h = $('select#item_shipping_method_id option[value=4]')
      i = $('select#item_shipping_method_id option[value=7]')
      j = $('select#item_shipping_method_id option[value=8]')
      $("#item_shipping_method_id").append(g);
      $("#item_shipping_method_id").append(a);
      $("#item_shipping_method_id").append(b);
      $("#item_shipping_method_id").append(c);
      $("#item_shipping_method_id").append(d);
      $("#item_shipping_method_id").append(e);
      $("#item_shipping_method_id").append(f);
      $("#item_shipping_method_id").append(h);
      $("#item_shipping_method_id").append(i);
      $("#item_shipping_method_id").append(j);
      } 
  })
  //金額計算
  $('.exhibit-form_price').on('keyup', function(){
    var data = $(this).val();
    var profit = Math.round(data * 0.9)
    var fee = (data - profit)
    $('.commission-line_right').html(fee)
    $('.commission-line_right').prepend('¥')
    $('.profit-line_right').html(profit)
    $('.profit-line_right').prepend('¥')
    $('#price').val(profit)
    if(profit == '') {
    $('.profit-line_right').html('');
    $('.commission-line_right').html('');
    }
  })
  //編集
  $(".fa-camera").on('click', function() {
    $(".img-man:last").trigger('click');
  })
})