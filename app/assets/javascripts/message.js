$(document).on('ready page:load', function() {
	
	$('table tr').click(function() {
		var $cur_td = $(this)[0];
		//var $cur_tr = $(this).parent()[0];
		alert($cur_td.id);

		$.ajax({
			async:    true ,
			url : '../received_message_detail/',
			type:     "GET",
			data: {id : $cur_td.id},
			dataType : 'json',
			success : function(data, dataType) {
				alert("success");
				$("#result").val(data.message);
				alert(data.message);  
				          
			}
		});
	});
	
        

}); 

