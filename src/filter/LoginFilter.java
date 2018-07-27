package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import erp.dto.LoginDTO;

//    /emp/*로 요청되는 모든 서비스는 로그인을 하지않았을 경우 로그인페이지로 이동
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

    public LoginFilter() {
    }

	public void destroy() {
	}
// session 에 저장된 LoginUser로 저장된 MemberDTO를 꺼내서 null 이면 login 페이지로 forward
//	null 이 아니면 doFilter로 다음 연결된 Filter나 서블릿으로 요청을 넘긴다.
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		HttpServletResponse res = (HttpServletResponse) response;
		
		String menupath="";
		String viewpath="";
		LoginDTO dto = null; 
		if(session!=null){
			dto = (LoginDTO) session.getAttribute("loginUser");
			if(dto==null){//로그인이 안됫음
				menupath="/menu/pub_menu.jsp";
				viewpath="/emp/login.jsp";
				req.setAttribute("menupath", menupath);
				req.setAttribute("viewpath", viewpath);
				RequestDispatcher rd = req.getRequestDispatcher("/template/mainLayout.jsp");
				rd.forward(req, res);
			}else{
				chain.doFilter(request, response);
			}
		
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
