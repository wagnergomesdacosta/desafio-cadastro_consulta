package br.com.desafiocoti.interfaces;

import java.util.List;

import br.com.desafiocoti.entities.Produto;

public interface IProdutoRepository {

	void create(Produto produto) throws Exception;


	List<Produto> findAll(String nome) throws Exception;

}
