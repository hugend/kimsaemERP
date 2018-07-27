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
	String encoding;//인코딩을 적용할 인코딩타입 - web.xml에 정의된 param-value를 읽어와서 셋팅

    public EncodingFilter() {
    }

	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		//설정파일을 통해서 인코딩 타입을 지정할 수 있도록 정의
		request.setCharacterEncoding(encoding);	
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		//web.xml에 정의한 param을 읽는방법은 FilterConfig 객체의 메소드를 통해서 접근
		encoding = fConfig.getInitParameter("encoding");
		System.out.println("필터의 init()"+encoding);
	}

}
