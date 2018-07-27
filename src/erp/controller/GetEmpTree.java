package erp.controller;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import erp.dto.DeptDTO;
import erp.dto.MemberDTO;
import erp.service.DeptService;
import erp.service.DeptServiceImpl;
import erp.service.empService;
import erp.service.empServiceImpl;
// ajax ��û�ɋ� ���޵Ǵ� �μ���ȣ�� �޾Ƽ� �ش�μ��� �ٹ��ϴ� ���������� ��ȸ�Ѵ�.
// ��ȸ�� ������ jsp �� response �Ҷ� �񵿱�� ó���� ��û�̹Ƿ� forward�� �Ҽ�  ����
// ��ȸ�� ������ json���� ��ȯ�ؼ� response �ؾ��Ѵ�.
@WebServlet(name = "emptree", urlPatterns = { "/emp/emptree.do" })
public class GetEmpTree extends HttpServlet {
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MemberDTO> dtolist = null;
		String deptno=request.getParameter("deptno");
		System.out.println("getemptree"+deptno);
		empService service = new empServiceImpl();
		dtolist = service.emptree(deptno);
		System.out.println("arraylist ������"+dtolist.size());
		
		//db�� ��ȸ�� �����͸� json���� ��ȯ�ϴ� �۾�
		JSONObject myjson = new JSONObject();
		JSONArray emplist = new JSONArray();
		for (int i = 0; i < dtolist.size(); i++) {
			// arraylist ���� �ϳ����� memberDTO�� json object�� ��ȯ
			MemberDTO emp = dtolist.get(i);// db���� ������
			JSONObject empjson = new JSONObject(); // ���θ��������ü
			// emp json�� db���� ���� emp�� �������� put ���Ѿ��Ѵ�.
			empjson.put("id", emp.getId());
			empjson.put("pass", emp.getPass());
			empjson.put("name", emp.getName());
			empjson.put("ssn", emp.getSsn());
			empjson.put("birthday", emp.getBirthday().toString());
			empjson.put("position", emp.getPosition());
			empjson.put("duty", emp.getDuty());
			empjson.put("classes", emp.getClasses());
			empjson.put("startday", emp.getStartday().toString());
			empjson.put("endday", null);
			empjson.put("deptno", emp.getDeptno());
			empjson.put("curstate", emp.getCurstate());
			empjson.put("zipcode", emp.getZipcode());
			empjson.put("addr", emp.getAddr());
			empjson.put("detailaddr", emp.getDetailaddr());
			empjson.put("phonehome", emp.getPhonehome());
			empjson.put("phoneco", emp.getPhoneco());
			empjson.put("phonecell", emp.getPhonecell());
			empjson.put("email", emp.getEmail());
			empjson.put("profile_photo", emp.getProfile_photo());
			//db���ڵ� -> dto -> JSONObject
			emplist.add(empjson);
		}
		// ��ȯ�� JSONArray�� ���������� root�� JSONObject�� �߰��Ѵ�.
		myjson.put("emplist", emplist);
		System.out.println(myjson.toJSONString());
		
		response.setContentType("application/json; charset=euc-kr");
		response.setHeader("cache-control", "no-cache, no-store");
		PrintWriter pw = response.getWriter();
		pw.println(myjson.toJSONString());
		
		
		
	}

}
