<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de Produto</title>

<!-- folhas de estilo CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />


</head>
<body class="bg-secondary">

	<div class="row mt-4">


		<div class="col-md-4 offset-md-4">
			<div class="card bg-black">
				<div class="card-body">


					<div class="text-center">
						<font color="white" size=+3><strong>Tela de
								Cadastro de produto</strong></font>
					</div>



					<form id="formCadastro" method="post" action="cadastrar-produto">

						<div class="mb-2">
							<label><font color="white" size=+2>Nome do Produto</font></label>
							<form:input path="model.nome" type="text" id="nome" name="nome"
								class="form-control" placeholder="Digite o nome do produto" />
						</div>

						<div class="mb-2">
							<label><font color="white" size=+2>Descrição do
									Produto</font></label>
							<form:textarea path="model.descricao" id="descricao"
								name="descricao" class="form-control"
								placeholder="Digite a descrição do produto" rows="3"></form:textarea>
						</div>

						<div class="mb-2">
							<label><font color="white" size=+2>Preço do
									Produto</font></label>
							<form:input path="model.preco" type="number" class="form-control"
								id="preco" name="preco" placeholder="Digite o preço do produto" />
						</div>

						<div class="mb-2">
							<label><font color="white" size=+2>Quantidade do
									Produto</font></label>
							<form:input path="model.quantidade" type="number"
								class="form-control" id="quantidade" name="quantidade"
								placeholder="Digite a quantidade do produto" />
						</div>

						<div class="mb-3">
							<label><font color="white" size=+2>Data de
									Validade</font></label>
							<form:input path="model.dataValidade" type="date"
								id="dataValidade" name="dataValidade" class="form-control" />
						</div>

						<div class="d-grid mb-3">
							<input type="submit" value="Cadastrar Produto"
								class="btn btn-success" />
						</div>

						<div class="d-grid mb-3">
							<a href="/desafiocoti/consulta-produto" class="btn btn-light"><strong>Consultar
									Produtos Cadastrados</strong></a>
						</div>


						<hr>

						<div class="text-center">
							<font color="green" size=+1><strong>${mensagem_sucesso}</strong></font>
						</div>
						<div class="text-center">
							<font color="red" size=+1><strong>${mensagem_erro}</strong></font>
						</div>


					</form>

				</div>
			</div>
		</div>
	</div>








	<!-- arquivos de extensão javascript -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- biblioteca do jquery -->
	<script src="resources/js/jquery-3.6.0.min.js"></script>

	<!-- biblioteca do jquery validation -->
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/additional-methods.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>
	<script>
		//função para inicializar o código JavaScript (JQuery)

		$(document).ready(function() {
			$("#formCadastro").validate({
				rules : {
					'nome' : {required : true, minlength : 6,maxlength : 100, color : white},
					'descricao' : {required : true, maxlength : 100},
					'preco' : {required : true},
					'quantidade' : {required : true},
					'datavalidade' : {required : true}
				}
			});
		});
	</script>

</body>
</html>
