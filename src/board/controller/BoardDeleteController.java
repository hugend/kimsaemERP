package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import board.service.BoardService;
import sun.print.resources.serviceui;

@Controller
public class BoardDeleteController {
	@Autowired
	BoardService boardservice;
	
	@RequestMapping(value="/board/delete.do", method=RequestMethod.GET)
	public String delete(int bo_no){
		boardservice.board_delete(bo_no);
		return "redirect:/board/list.do";
	}
}
