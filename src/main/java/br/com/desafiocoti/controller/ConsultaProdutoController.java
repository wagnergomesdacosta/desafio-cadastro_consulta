package br.com.desafiocoti.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.desafiocoti.entities.Produto;
import br.com.desafiocoti.models.ConsultaProdutoModel;
import br.com.desafiocoti.repositories.ProdutoRepository;

@Controller
public class ConsultaProdutoController {

	@RequestMapping(value = "consulta-produto")
	public ModelAndView consultarProduto() {

		ModelAndView modelAndView = new ModelAndView("consulta-produto");
		modelAndView.addObject("model", new ConsultaProdutoModel());

		return modelAndView;
	}

	@RequestMapping(value = "consultar-produto", method = RequestMethod.POST)
	public ModelAndView consulta(ConsultaProdutoModel model) {

		ModelAndView modelAndView = new ModelAndView("consulta-produto");

		try {
			
			ProdutoRepository produtoRepository = new ProdutoRepository();
			List<Produto> produtos = produtoRepository.findAll(model.getNome());
			
			modelAndView.addObject(produtos);
			
			modelAndView.addObject("mensagem_sucesso", produtos.size() + "produto(s) encontrado(s)");
			
			
		} catch (Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}
		
		
		modelAndView.addObject("model", new ConsultaProdutoModel());
		return modelAndView;
	}
}
