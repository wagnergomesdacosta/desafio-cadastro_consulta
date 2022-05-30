package br.com.desafiocoti.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.desafiocoti.factories.ConnectionFactory;
import br.com.desafiocoti.helpers.DateHelper;
import br.com.desafiocoti.interfaces.IProdutoRepository;
import br.com.desafiocoti.entities.Produto;

public class ProdutoRepository implements IProdutoRepository {

	@Override
	public void create(Produto produto) throws Exception {

		Connection connection = ConnectionFactory.getConnection();

		PreparedStatement statement = connection.prepareStatement(
				"insert into produto(nome, descricao, preco, quantidade, datavalidade) value(?, ?, ?, ?, ?)");
		statement.setString(1, produto.getNome());
		statement.setString(2, produto.getDescricao());
		statement.setDouble(3, produto.getPreco());
		statement.setInt(4, produto.getQuantidade());
		statement.setString(5, DateHelper.formatToString(produto.getDataValidade()));
		statement.execute();

		statement.close();
		connection.close();

	}

	@Override
	public List<Produto> findAll(String nome) throws Exception {

		Connection connection = ConnectionFactory.getConnection();

		PreparedStatement statement = connection.prepareStatement("select * from produto where nome like ?");
		statement.setString(1,"%" + nome + "%");
		ResultSet resultSet = statement.executeQuery();

		List<Produto> lista = new ArrayList<Produto>();

		if (resultSet.next()) {

			Produto produto = new Produto();

			produto.setIdProduto(resultSet.getInt("idproduto"));
			produto.setNome(resultSet.getString("nome"));
			produto.setDescricao(resultSet.getString("descricao"));
			produto.setPreco(resultSet.getDouble("preco"));
			produto.setQuantidade(resultSet.getInt("quantidade"));
			produto.setDataValidade(DateHelper.formatToDate("dataValidade"));

			lista.add(produto);
		}

		connection.close();
		return lista;

	}

}
