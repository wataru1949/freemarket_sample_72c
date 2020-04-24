$(function() {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${num}][image]"
                    id="item_item_images_attributes_${num}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      var num = $(".js-file").length
      if(num < 10)
        $('#image-box').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    var num = $(".js-file").length
    if(num == 9)
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
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
})
