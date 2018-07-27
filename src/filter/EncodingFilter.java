package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/EncodingFilter")
public class EncodingFilter implements Filter {
	String encoding;//���ڵ��� ������ ���ڵ�Ÿ�� - web.xml�� ���ǵ� param-value�� �о�ͼ� ����

    public EncodingFilter() {
    }

	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		//���������� ���ؼ� ���ڵ� Ÿ���� ������ �� �ֵ��� ����
		request.setCharacterEncoding(encoding);	
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		//web.xml�� ������ param�� �д¹���� FilterConfig ��ü�� �޼ҵ带 ���ؼ� ����
		encoding = fConfig.getInitParameter("encoding");
		System.out.println("������ init()"+encoding);
	}

}
