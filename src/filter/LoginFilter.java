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

//    /emp/*�� ��û�Ǵ� ��� ���񽺴� �α����� �����ʾ��� ��� �α����������� �̵�
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

    public LoginFilter() {
    }

	public void destroy() {
	}
// session �� ����� LoginUser�� ����� MemberDTO�� ������ null �̸� login �������� forward
//	null �� �ƴϸ� doFilter�� ���� ����� Filter�� �������� ��û�� �ѱ��.
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
			if(dto==null){//�α����� �ȵ���
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
