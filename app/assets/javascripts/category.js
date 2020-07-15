$(document).on('turbolinks:load', function () {

  $(function () {
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category) {
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }

    // 子カテゴリーの表示作成
    function appendChildrenBox(insertHTML, parentValue) {
      var childSelectHtml = '';
      childSelectHtml = `
                       <div class='select--wrap' id= 'category__box--children'>
                         <select class="select--wrap-cat1__default-category1" id="child_form" name="product[category_id]">
                           <option value="${parentValue}" data-category="">---</option>
                           ${insertHTML}
                         </select>
                       </div>
                      `;
      $('.product-details__form__category').append(childSelectHtml);
    }

    // 孫カテゴリーの表示作成
    function appendGrandchildrenBox(insertHTML, childValue) {
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `
                            <div class='select--wrap' id= 'category__box--grandchildren'>
                              <select class="select--wrap-cat1__default-category1" id="grandchild_form" name="product[category_id]">
                                <option value="${childValue}" data-category="">---</option>
                                ${insertHTML}
                              </select>
                            </div>
                           `;
      $('.product-details__form__category').append(grandchildSelectHtml);
    }

    // 子要素のアクション
    $("#parent_form").on("change", function () {
      var parentValue = document.getElementById("parent_form").value;
      if (parentValue != "---") {
        $.ajax({
          url: '/products/search_child',
          type: 'GET',
          data: {
            parent_id: parentValue
          },
          dataType: 'json'
        })
          .done(function (children) {
            var insertHTML = '';
            children.forEach(function (child) {
              insertHTML += appendOption(child);
            });
            appendChildrenBox(insertHTML, parentValue);
          })
          .fail(function () {
            alert('カテゴリーを入力して下さい');
          })
      } else {
        $('#category__box--children').remove();
        $('#category__box--grandchildren').remove();
      }
    });

    // 孫要素のアクション
    $(".product-details__form__category").on("change", "#child_form", function () {
      var childValue = $('#child_form option:selected').data('category');
      if (childValue != "---") {
        $.ajax({
          url: '/products/search_grandchild',
          type: 'GET',
          data: {
            child_id: childValue
          },
          dataType: 'json'
        })
          .done(function (grandchildren) {
            var insertHTML = '';
            grandchildren.forEach(function (grandchild) {
              insertHTML += appendOption(grandchild);
            });
            appendGrandchildrenBox(insertHTML, childValue);
          })
          .fail(function () {
            alert('カテゴリーを入力して下さい');
          })
      } else {
        $('#category__box--children').remove();
        $('#category__box--grandchildren').remove();
      }
    });
  });
});