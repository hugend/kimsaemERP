package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import board.dao.BoardDAO;
import board.dto.BoardDTO;
import board.service.BoardService;
import board.service.BoardServiceImpl;

@Controller
public class BoardInsertController {
	@Autowired
	BoardServiceImpl boardservice;
	
	@RequestMapping(value="/board/insert.do", method=RequestMethod.POST)
	public String insert(BoardDTO dto){
		System.out.println(dto);
		boardservice.board_insert(dto);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping(value="/board/insert.do", method=RequestMethod.GET)
	public ModelAndView showView(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("menupath", "/WEB-INF/menu/board_menu.jsp");
		mav.addObject("viewpath", "/WEB-INF/board/boardwrite.jsp");
		mav.setViewName("template/mainLayout");
		return mav;
	}

}
