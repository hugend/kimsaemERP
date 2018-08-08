package board.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import board.service.BoardService;

@Controller
public class BoardListController {
	@Autowired
	BoardService boardservice;
	
	@RequestMapping(value="/board/allshowlist.do", method=RequestMethod.GET)
	public ModelAndView Allshowlist(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardlist", boardservice.board_list());
		mav.addObject("menupath", "/WEB-INF/menu/board_menu.jsp");
		mav.addObject("viewpath", "/WEB-INF/board/boardlist.jsp");
		mav.setViewName("template/mainLayout");
//		mav.setViewName("/board/boardlist");
		return mav;
	}
	
	
	@RequestMapping(value="/board/showlist.do", method=RequestMethod.GET)
	public ModelAndView showlist(String bo_div){

		System.out.println("bo_div"+bo_div);
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardlist", boardservice.board_divlist(bo_div));
		mav.addObject("menupath", "/WEB-INF/menu/board_menu.jsp");
		mav.addObject("viewpath", "/WEB-INF/board/boardlist.jsp");
		mav.setViewName("template/mainLayout");
		return mav;
	}
}
