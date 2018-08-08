package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@RequestMapping(value="/board/list.do")
	public ModelAndView showList(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("menupath", "/WEB-INF/menu/board_menu.jsp");
		mav.addObject("viewpath", "/WEB-INF/board/boardlist.jsp");
		mav.setViewName("template/mainLayout");
		return mav;
	}
	
	
}
