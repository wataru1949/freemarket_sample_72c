$(function(){
  

  var dataBox = new DataTransfer();
  //querySelectorでfile_fieldを取得
  var file_field = document.querySelector('input[type=file]')

   $('#image-label').change(function(){
    var files = $('input[type="file"]').prop('files')[0];

    $.each(this.files, function(i, file){
      var fileReader = new FileReader();

      dataBox.items.add(file)
      file_field.files = dataBox.files

      fileReader.readAsDataURL(file); //読み込み

      fileReader.onloadend = function() { 
        var num = $('.item-image-container__unit').length   //unitの数を取得
        var src = fileReader.result //読み込んだデータ
        var html =  `<div class="item-image-container__unit--preview" >
                        <img src="${src}">
                      <div class="image-option__list--tag">削除</a>
                    </div>`
        
        var field = `<div class="item-image-container__unit preview-${num}">
                      <div class="image-container__unit--guide">
                        <label for="image-label">
                          <input multiple="multiple" class="image-upload-dropfile-hidden" id="image-label" type="file" name="item_images[image][]">
                          <div class="have-image">
                            <i class="fas fa-camera"></i>
                          </div>
                        </label>
                      </div>
                    </div>`
        $(html).appendTo(`.preview-${num - 1}`).trigger("build"); //配列なので0スタートだから、一枚目はunit-0に入れたい。
        
        if (num < 10 ) { 
          $(field).appendTo('.image-container_unit-man')
        }
      };

    });
    //削除
    $(document).on("click", ".image-option__list--tag", function() {
      $(this).parent().parent().remove();
      var num = $('.item-image-container__unit').length   //unitの数を取得
      var field_2 = `<div class = "text-man">(必須)</div>`
      var field = `<div class="item-image-container__unit preview-${num}">
                      <div class="image-container__unit--guide">
                        <label for="image-label">
                          <input multiple="multiple" class="image-upload-dropfile-hidden" id="image-label" type="file" name="item_images[image][]">
                          <div class="have-image">
                            <i class="fas fa-camera"></i>
                            <div class = "text-man">(必須)</div>
                          </div>
                        </label>
                      </div>
                    </div>`

      if(num == 0) { 
        $(field).appendTo('.image-container_unit-man')
      }
    })
  });
  

  //文字カウント
  $('.exhibit-form-detail').keyup(function(){
    var count = $(this).val().length;
    $('.explain-container_text-box_info').text(count + "/1000");
  });
  
  //配送方法
  $('#item_shipping_cost_id').change(function() {
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
})