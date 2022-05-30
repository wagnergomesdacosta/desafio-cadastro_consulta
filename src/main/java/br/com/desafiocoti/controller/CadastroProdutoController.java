package br.com.desafiocoti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.desafiocoti.entities.Produto;
import br.com.desafiocoti.helpers.DateHelper;
import br.com.desafiocoti.models.CadastroProdutoModel;
import br.com.desafiocoti.repositories.ProdutoRepository;

@Controller
public class CadastroProdutoController {

	@RequestMapping(value = "/")
	public ModelAndView cadastro() {

		ModelAndView modelAndView = new ModelAndView("cadastro-produto");
		modelAndView.addObject("model", new CadastroProdutoModel());

		return modelAndView;
	}

	@RequestMapping(value = "/cadastrar-produto", method = RequestMethod.POST)
	public ModelAndView cadastrarProduto(CadastroProdutoModel model) {

		ModelAndView modelAndView = new ModelAndView("cadastro-produto");

		try {

			Produto produto = new Produto();

			produto.setNome(model.getNome());
			produto.setDescricao(model.getDescricao());
			produto.setPreco(Double.valueOf(model.getPreco()));
			produto.setQuantidade(Integer.valueOf(model.getQuantidade()));
			produto.setDataValidade(DateHelper.formatToDate(model.getDataValidade()));

			ProdutoRepository produtoRepository = new ProdutoRepository();
			produtoRepository.create(produto);
			
			modelAndView.addObject("mensagem_sucesso", "Produto '" + produto.getNome() + "' cadastrado com sucesso");

		} catch (Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}

		modelAndView.addObject("model", new CadastroProdutoModel());
		return modelAndView;

	}
}
