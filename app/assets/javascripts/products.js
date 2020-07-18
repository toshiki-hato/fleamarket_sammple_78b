$(document).on('turbolinks:load', function(){
  
  $(function(){
    var a0 = [];

    //プレビューのhtmlを定義
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <label class="aaa" for="product_product_images_attributes_${count}_image" id="label-box--${count}">編集</label>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    // 投稿編集時
    if (window.location.href.match(/\/product\/\d+\/edit/)){
      //登録済み画像のプレビュー表示欄の要素を取得する
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
      //プレビューにidを追加
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      //削除ボタンにidを追加
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      


      console.log("投稿編集時");
      console.log(a0.length);


      var count = $('.preview-box').length;
      //プレビューが5あるときは、投稿ボックスを消しておく
      if (count == 5) {
        $('.label-content').hide();
      }
    }

    // ラベルのwidth操作
    function setLabel() {
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }
    
    // プレビューの追加
    $(document).on('change', '.hidden-field', function() {
      setLabel();
      //hidden-fieldのidの数値のみ取得
      if(a0.length > 2){
        var id = $(this).attr('id').replace(/[^0-9]/g, '');
      }
      else{
        var id = a0[1];

      }
      console.log("preview追加");
      a0.shift();
      console.log(a0);
      console.log("id", id)

      //labelボックスのidとforを更新
      $('.label-box').attr({id: `label-box--${id}`,for: `product_product_images_attributes_${id}_image`});
      console.log(id)
      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      var reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        var image = this.result;
        //プレビューが元々なかった場合はhtmlを追加
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;


          var html = buildHTML(id);
          //ラベルの直前のプレビュー群にプレビューを追加
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }
        //イメージを追加
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        
        //プレビューが5個あったらラベルを隠す 
        if ($('.preview-box').length == 5) { 
          $('.label-content').hide();
        }
        if ($(`#product_product_images_attributes_${id}__destroy`)){
          $(`#product_product_images_attributes_${id}__destroy`).prop('checked',false);
        }
        //ラベルのwidth操作
        setLabel();
        var prevContent = $('.label-content').prev();
        labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
        $('.label-content').css('width', labelWidth);
        //ラベルのidとforの値を変更
        // if(count < 5){
        //   debugger
        //   $('.label-box').attr({id: `label-box--${count}`,for: `product_images_attributes_${count}_image`});
        //   debugger
        // }
      }
    });

    // 画像の削除
    $(document).on('click', '.delete-box', function() {
      //5個めが消されたらラベルを表示
      $('.label-content').show();

      console.log("画像の削除");
      console.log($(this).attr('id').replace(/[^0-9]/g, ''));
      a0.unshift($(this).attr('id').replace(/[^0-9]/g, ''));
      console.log(a0);
      
      
      var count = $(this).attr('id');
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();
      
      //新規投稿時
      //削除用チェックボックスの有無で判定
      if ($(`#product_product_images_attributes_${id}__destroy`).length == 1) {
        //フォームの中身を削除
        $(`#product_product_images_attributes_${id}_image`).val("");
        
        var count = $('.preview-box').length
        
        setLabel(count);
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `product_product_images_attributes_${id}_image`});

        }
      } else {
        
        //投稿編集時
            
        $(`#product_product_images_attributes_${id}__destroy`).prop('checked',true);
        //5個めが消されたらラベルを表示
        if (count == 4) {
          $('.label-content').show();
        }

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        //削除したプレビューのidによって、ラベルのidを変更する
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `product_product_images_attributes_${id}_image`});
        }
      }
    });
  });
});