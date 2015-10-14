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
	var coleta = $('#start').val();
	var entrega = $('#end').val();
	var distancia = $('#distance').html();
	var valor = $('#value').html();
	var volume = $('#volume').find(":selected").val();

	$.ajax({
		url : "/deliver/save",
		data : {
			cliente : cliente,
			volume : volume,
			coleta : coleta,
			entrega : entrega,
			distancia : distancia,
			valor : valor
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
