package board.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import board.dto.BoardDTO;
import board.dto.BoardRowmapper;

@Repository("boarddao")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private JdbcTemplate template;	

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public int board_insert(BoardDTO dto) {
		String sql= "insert into board values(bo_seq.nextval, ?, ?, sysdate, ?, ?)";
		int result = template.update(sql, dto.getBo_div(), dto.getBo_id(), 
				dto.getBo_title(), dto.getBo_txt());
		return result;
	}

	@Override
	public List<BoardDTO> board_list() {
		String sql = "select * from board order by bo_no";
		List<BoardDTO> list = template.query(sql, new BoardRowmapper());
		return list;
	}

	@Override
	public BoardDTO board_read(int bo_no) {
		String sql = "select * from board where bo_no=? ";
		BoardDTO dto = template.queryForObject(sql, new Object[]{bo_no}, new BoardRowmapper());
		return dto;
	}

	@Override
	public int board_delete(int bo_no) {
		String sql= "delete from board where bo_no = ? ";
		int result = template.update(sql, bo_no);
		return result;
	}

	@Override
	public List<BoardDTO> board_divlist(String bo_div) {
		String sql = "select * from board where bo_div= ? order by bo_no";
		List<BoardDTO> list = template.query(sql, new Object[]{bo_div}, new BoardRowmapper());
		return list;
	}

}
