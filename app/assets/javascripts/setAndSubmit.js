jQuery(function($) {

  //data-hrefの属性を持つtrを選択しclassにclickableを付加
  $('tr[data-href]').addClass('clickable')

    //クリックイベント
    .click(function(e) {
    	alert("a");

    
  });
});