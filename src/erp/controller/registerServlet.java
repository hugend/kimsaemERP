package erp.controller;


import java.io.File;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import erp.dto.MemberDTO;
import erp.service.empService;
import erp.service.empServiceImpl;
@WebServlet(name = "insert", urlPatterns = { "/insert.do" })
public class registerServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res)
			throws ServletException,java.io.IOException{
		
		res.setContentType("text/html;charset=euc-kr");
	
		//파일업로드
		String realpath = "";
		String saveFolder = "/upload";
		String encType = "euc-kr";
		int size = 5*1024*1024;
		ServletContext context = getServletContext();
		realpath = context.getRealPath(saveFolder);
		MultipartRequest multipart = new MultipartRequest(req, realpath, size,
				encType, new DefaultFileRenamePolicy()); 
			
		String deptno=multipart.getParameter("deptno");
		String name=multipart.getParameter("name");
		String id=multipart.getParameter("id");
		String pass=multipart.getParameter("pass");
		String ssn=multipart.getParameter("ssn");
		String birthday =multipart.getParameter("birthday");
		String marry = multipart.getParameter("marry");
		String zipcode = multipart.getParameter("zipcode");
		String addr =multipart.getParameter("addr");
		String phonehome = multipart.getParameter("phonehome");
		String phoneco = multipart.getParameter("phoneco");
		String phonecell = multipart.getParameter("phonecell");
		String email = multipart.getParameter("email");
	
		
		String fileName = "";
		Enumeration<String> files= multipart.getFileNames();
		while(files.hasMoreElements()){//파일이 존재하면
			String file = files.nextElement();// 파일명을 꺼내라
			fileName = multipart.getFilesystemName(file);
		}
		String profile_photo = fileName;
		
		MemberDTO dto = new MemberDTO(id, pass, name, ssn,  birthday,
					marry, deptno, zipcode, addr, phonehome, phoneco, phonecell,
					email, profile_photo);
		System.out.println(dto);
		empService service = new empServiceImpl();
		int result = service.insert(dto);

		String msg="";
		if(result<=0){
			msg="삽입실패";
		}else{
			msg="삽입성공";
		}
		System.out.println(msg);
		req.setAttribute("mydata", msg);
		req.setAttribute("menupath", "/menu/insa_menu.jsp");
		req.setAttribute("viewpath", "/emp/emp_list.jsp");
		
		RequestDispatcher rd= req.getRequestDispatcher("/template/mainLayout.jsp");
		rd.forward(req,res);
	}
}
