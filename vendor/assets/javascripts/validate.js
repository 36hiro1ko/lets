$(window).bind('load', function() {
	$('.tgt').children().andSelf().contents().each(function() {
		if (this.nodeType == 3) {
			$(this).replaceWith($(this).text().replace(/(\S)/g, '<span class="c-$1">$1</span>'));
		}
	});
	$('.tgt').css({
		'opacity' : 1
	});
	for (var i = 0; i <= $('.tgt').children().size(); i++) {
		$('.tgt').children('span:eq(' + i + ')').delay(50 * i).animate({
			'opacity' : 1
		}, 50);
	};
}); 