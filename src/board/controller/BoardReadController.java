package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.service.BoardService;

@Controller
public class BoardReadController {
	@Autowired
	BoardService boardservice;
	
	@RequestMapping(value="/board/read.do")
	public ModelAndView read(int bo_no){
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardlist", boardservice.board_read(bo_no));
		mav.addObject("menupath", "/WEB-INF/menu/board_menu.jsp");
		mav.addObject("viewpath", "/WEB-INF/board/boardread.jsp");
		mav.setViewName("template/mainLayout");
		return mav;
	}
}
