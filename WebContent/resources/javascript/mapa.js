function addRoteNode(){
	console.log($('.nodeRoute:visible').size());
	console.log(2 + $('.nodeRoute:visible').size());
	
	var divToShowNumber = 2 + $('.nodeRoute:visible').size();
	
	$("#route" + divToShowNumber).show();

}

function removeRoteNode(node){
	$("#route" + node).hide();
	$("#route" + node + " :input").val("");
}




function showLogin() {
		$('#login').css("display", "block");
	}

function postPedido() {

	var cliente = $('#cliente').val();
	var distancia = $('#distance').html();
	var valor = $('#value').html();
	var volume = $('#volume').find(":selected").val();
	
	
	var coleta1 = $('#start').val();
	var entrega1 = $('#end').val();
	
	var coleta2 = $('#start2').val();
	var entrega2 = $('#end2').val();
	
	var coleta3 = $('#start3').val();
	var entrega3 = $('#end3').val();
	
	var coleta4 = $('#start4').val();
	var entrega4 = $('#end4').val();
	
	var coleta5 = $('#start5').val();
	var entrega5 = $('#end5').val();
	
	var coleta6 = $('#start6').val();
	var entrega6 = $('#end6').val();
	
	var coleta7 = $('#start7').val();
	var entrega7 = $('#end7').val();
	
	var coleta8 = $('#start8').val();
	var entrega8 = $('#end8').val();
	
	var coleta9 = $('#start9').val();
	var entrega9 = $('#end9').val();
	
	var coleta10 = $('#start10').val();
	var entrega10 = $('#end10').val();
	

	$.ajax({
		url : "/deliver/save",
		data : {
			cliente : cliente,
			volume : volume,
			distancia : distancia,
			valor : valor,
			
			coleta1 : coleta1,
			entrega1 : entrega1,
			coleta2 : coleta2,
			entrega2 : entrega2,
			coleta3 : coleta3,
			entrega3 : entrega3,
			coleta4 : coleta4,
			entrega4 : entrega4,
			coleta5 : coleta5,
			entrega5 : entrega5,
			coleta6 : coleta6,
			entrega6 : entrega6,
			coleta7 : coleta7,
			entrega7 : entrega7,
			coleta8 : coleta8,
			entrega8 : entrega8,
			coleta9 : coleta9,
			entrega9 : entrega9,
			coleta10 : coleta10,
			entrega10 : entrega10
		},
		type : "POST",
		success : function(smartphone) {
			console.log("aadasdasd");
		},
		error : function() {
			console.log("werrrrooooo");
		}
	});

	event.preventDefault();
}
