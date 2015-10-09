<%@page import="br.com.ab.mapa.model.Pedido"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>Deliver</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/pedidos.css">
<script src="resources/js/jquery.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="resources/javascript/mapa.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
	
</script>

</head>
<body>
	<div class="container">
		<div id="custom-bootstrap-menu" class="navbar navbar-default navbar-fixed-top" role="navigation">
	        <div class="navbar-header"><a class="navbar-brand" href="/deliver/">GTLog</a>
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
	            </button>
	        </div>
	        <div class="collapse navbar-collapse navbar-menubuilder">
	            <ul class="nav navbar-nav navbar-left">
	                <li><a href="/deliver/">Home</a>
	                </li>
	                <li><a href="/deliver/servicos">Serviços</a>
	                </li>
	                <li><a href="/deliver/clientes">Clientes</a>
	                </li>
	                <li><a href="/deliver/empresa">Empresa</a>
	                </li>
	                <li><a href="/deliver/contato">Contato</a>
	                </li>
	            </ul>
	        </div>
	    </div>
	
		<div id="content">
		
		<div class="row text-center">
            <div class="col-md-4 col-sm-6 jwfeature ">
                <div class="thumbnail">
                    <br><i class="fa fa-motorcycle fa-5x"></i>
                    <div class="caption ">
                        <h3>Express</h3>
                        <p>Indicado para quem tem urgência no despacho de documentos e/ou pequenos volumes. </p>
						<p>Compreende: coleta e entrega de documentos, convites, editais, malotes, peças, encomendas, cobrança, distribuição, serviços bancários e de cartório.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6 jwfeature">
                <div class="thumbnail">
                    <br><i class="fa fa-car fa-5x"></i>
                    <div class="caption">
                        <h3>Executive</h3>
                        <p>Indicado para transportes de pessoas com conforto, segurança e rapidez para qualquer lugar do Rio Grande do Sul.</p>
						<p>Compreende: coleta e entrega de documentos, convites, editais, malotes, peças, encomendas, cobrança, distribuição, serviços bancários e de cartório.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 jwfeature">
                <div class="thumbnail">
                    <br><i class="fa fa-truck fa-5x"></i>
                    <div class="caption">
                        <h3>Custom</h3>
                        <p>Indicado para deslocamento de qualquer volume tanto para o aeroporto (TAMCARGO) como estação rodoviária de Porto Alegre (Veppo).</p>
                    </div>
                </div>
            </div>
        </div>
		
		
		

		</div>
	</div>
</body>
</html>