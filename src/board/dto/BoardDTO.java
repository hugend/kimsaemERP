package board.dto;

public class BoardDTO {
	private int bo_no;
	private String bo_div;
	private String bo_id;
	private String bo_date;
	private String bo_title;
	private String bo_txt;
/*	
	create table board(
			bo_no number,
			bo_div varchar2(20),
			bo_id varchar2(30),
			bo_date date,
			bo_title varchar2(100),
			bo_txt varchar2(500));*/

	
	
	public BoardDTO(int bo_no, String bo_div, String bo_id, String bo_date, String bo_title, String bo_txt) {
		super();
		this.bo_no = bo_no;
		this.bo_div = bo_div;
		this.bo_id = bo_id;
		this.bo_date = bo_date;
		this.bo_title = bo_title;
		this.bo_txt = bo_txt;
	}
	
	public BoardDTO(String bo_div, String bo_id, String bo_title, String bo_txt) {
	super();
	this.bo_div = bo_div;
	this.bo_id = bo_id;
	this.bo_title = bo_title;
	this.bo_txt = bo_txt;
	}
	public BoardDTO() {
		super();
	}
	
	
	public int getBo_no() {
		return bo_no;
	}
	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}
	public String getBo_div() {
		return bo_div;
	}
	public void setBo_div(String bo_div) {
		this.bo_div = bo_div;
	}
	public String getBo_id() {
		return bo_id;
	}
	public void setBo_id(String bo_id) {
		this.bo_id = bo_id;
	}
	public String getBo_date() {
		return bo_date;
	}
	public void setBo_date(String bo_date) {
		this.bo_date = bo_date;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_txt() {
		return bo_txt;
	}
	public void setBo_txt(String bo_txt) {
		this.bo_txt = bo_txt;
	}
	@Override
	public String toString() {
		return "BoardDTO [bo_no=" + bo_no + ", bo_div=" + bo_div + ", bo_id=" + bo_id + ", bo_date=" + bo_date
				+ ", bo_title=" + bo_title + ", bo_txt=" + bo_txt + "]";
	}
	
	
	
	

}
