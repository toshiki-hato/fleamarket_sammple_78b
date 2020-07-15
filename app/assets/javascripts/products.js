// $(document).on('turbolinks:load', ()=> {
//   // 画像用のinputを生成する関数
//   const buildFileField = (num)=> {
//     const html = `<div data-index="${num}" class="js-file_group">
//                     <input class="js-file" type="file"
//                     name="product[product_images_attributes][${num}][image]"
//                     id="product_images_attributes_${num}_image"><br>
//                     <button class="js-remove">削除</button>
//                   </div>`;
//     return html;
//   }
//   // プレビュー用のimgタグを生成する関数
//   const buildImg = (index, url)=> {
//     const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
//     return html;
//   }

//   // file_fieldのnameに動的なindexをつける為の配列
//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];
//   // 既に使われているindexを除外
//   lastIndex = $('.js-file_group:last').data('index');
//   fileIndex.splice(0, lastIndex);

//   $('.hidden-destroy').hide();

//   $('#image-box').on('change', '.js-file', function(e) {
//     const targetIndex = $(this).parent().data('index');
//     // ファイルのブラウザ上でのURLを取得する
//     const file = e.target.files[0];
//     const blobUrl = window.URL.createObjectURL(file);

//     // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
//     if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
//       img.setAttribute('src', blobUrl);
//     } else {  // 新規画像追加の処理
//       $('#previews').append(buildImg(targetIndex, blobUrl));
//       // fileIndexの先頭の数字を使ってinputを作る
//       $('#image-box').append(buildFileField(fileIndex[0]));
//       fileIndex.shift();
//       // 末尾の数に1足した数を追加する
//       fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
//     }
//   });

//   $('#image-box').on('click', '.js-remove', function() {
//     const targetIndex = $(this).parent().data('index');
//     // 該当indexを振られているチェックボックスを取得する
//     const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
//     // もしチェックボックスが存在すればチェックを入れる
//     if (hiddenCheck) hiddenCheck.prop('checked', true);

//     $(this).parent().remove();
//     $(`img[data-index="${targetIndex}"]`).remove();

//     // 画像入力欄が0個にならないようにしておく
//     if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
//   });
// });

// $(document).on('turbolinks:load', function(){
//   $(function(){

//     //プレビューのhtmlを定義
//     function buildHTML(count) {
//       var html = `<div class="preview-box" id="preview-box__${count}">
//                     <div class="upper-box">
//                       <img src="" alt="preview">
//                     </div>
//                     <div class="lower-box">
//                       <div class="update-box">
//                       <input class="hidden-field" id="product_images_attributes_${count}_image" name="product[product_images_attributes][${count}][image]" type="file">編集</input>
                       
//                       </div>
//                       <div class="delete-box" id="delete_btn_${count}">
//                         <span>削除</span>
//                       </div>
//                     </div>
//                   </div>`
//       return html;
//     }
    $(document).on('turbolinks:load', function(){
      $(function(){
    
        //プレビューのhtmlを定義
        function buildHTML(count) {
          var html = `<div class="preview-box" id="preview-box__${count}">
                        <div class="upper-box">
                          <img src="" alt="preview">
                        </div>
                        <div class="lower-box">
                          <div class="update-box">
                            <label class="edit_btn">編集</label>
                          </div>
                          <div class="delete-box" id="delete_btn_${count}">
                            <span>削除</span>
                          </div>
                        </div>
                      </div>`
          return html;
        }
    
        // 投稿編集時
        //product/:i/editページへリンクした際のアクション=======================================
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
          var count = $('.preview-box').length;
          //プレビューが5あるときは、投稿ボックスを消しておく
          if (count == 5) {
            $('.label-content').hide();
          }
        }
        //=============================================================================
    
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
          var id = $(this).attr('id').replace(/[^0-9]/g, '');
          //labelボックスのidとforを更新
          $('.label-box').attr({id: `label-box--${id}`,for: `product_images_attributes_${id}_image`});
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
            if (count == 5) { 
              $('.label-content').hide();
            }
    
            //プレビュー削除したフィールドにdestroy用のチェックボックスがあった場合、チェックを外す=============
            if ($(`#product_images_attributes_${id}__destroy`)){
              $(`#product_images_attributes_${id}__destroy`).prop('checked',false);
            } 
            //=============================================================================
    
            //ラベルのwidth操作
            setLabel();
            //ラベルのidとforの値を変更
            if(count < 5){
              $('.label-box').attr({id: `label-box--${count}`,for: `product_images_attributes_${count}_image`});
            }
          }
        });
    
        // 画像の削除
        $(document).on('click', '.delete-box', function() {
          var count = $('.preview-box').length;
          setLabel(count);
          var id = $(this).attr('id').replace(/[^0-9]/g, '');
          $(`#preview-box__${id}`).remove();
    
          //新規登録時と編集時の場合分け==========================================================
    
          //新規投稿時
          //削除用チェックボックスの有無で判定
          if ($(`#product_images_attributes_${id}__destroy`).length == 0) {
            //フォームの中身を削除 
            $(`#product_images_attributes_${id}_image`).val("");
            var count = $('.preview-box').length;
            //5個めが消されたらラベルを表示
            if (count == 4) {
              $('.label-content').show();
            }
            setLabel(count);
            if(id < 5){
              $('.label-box').attr({id: `label-box--${id}`,for: `product_images_attributes_${id}_image`});
    
            }
          } else {
    
            //投稿編集時
            $(`#product_images_attributes_${id}__destroy`).prop('checked',true);
            //5個めが消されたらラベルを表示
            if (count == 4) {
              $('.label-content').show();
            }
    
            //ラベルのwidth操作
            setLabel();
            //ラベルのidとforの値を変更
            //削除したプレビューのidによって、ラベルのidを変更する
            if(id < 5){
              $('.label-box').attr({id: `label-box--${id}`,for: `product_images_attributes_${id}_image`});
            }
          }
          //=============================================================================
        });
      });
    });