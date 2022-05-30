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


		<div class="col-md-10 offset-md-1">
			<div class="card bg-black">
				<div class="card-body">


					<div class="text-center">
						<font color="white" size=+3><strong>Tela de
								Consulta de produto</strong></font>
					</div>

					<form action="consultar-produto" method="post">

						<div class="mb-2">
							<label><font color="white" size=+2>Nome do Produto</font></label>
							<form:input path="model.nome" type="text" class="form-control" placeholder="Digite o nome do produto" />
						</div>
						<input type="submit" value="Pesquisar Produto"
							class="btn btn-success" /> <a href="/desafiocoti"
							class="btn btn-light"><strong>Voltar para Cadastrado
								de Produtos</strong></a>





						<hr>

						<div class="text-center">
							<font color="green" size=+1><strong>${mensagem_sucesso}</strong></font>
						</div>
						<div class="text-center">
							<font color="red" size=+1><strong>${mensagem_erro}</strong></font>
						</div>
					</form>




					<table class="table table-hover table-sm mt-3">

						<thead>
							<tr>
								<th><font color="white" size=+1>Nome do Produto</font></th>
								<th><font color="white" size=+1>Descrição</font></th>
								<th><font color="white" size=+1>Preço</font></th>
								<th><font color="white" size=+1>Quantidade</font></th>
								<th><font color="white" size=+1>Validade</font></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${produtos}" var="p">
								<tr>
									<td>${p.nome}</td>
									<td>${p.descricao}</td>
									<td>${p.preco}</td>
									<td>${p.quantidade}</td>
									<td><fmt:formatDate value="${p.datavalidade}"
											pattern="dd/MM/yyyy" />
								</tr>
							</c:forEach>
						</tbody>

						<tfoot>
							<tr>
								<td class="6"><font color="white">Quantidade de
										Registro de Produtos:${produtos.size()}</font></td>
							</tr>
						</tfoot>

					</table>






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
</body>
</html>
