package board.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BoardRowmapper implements RowMapper<BoardDTO> {

	@Override
	public BoardDTO mapRow(ResultSet rs, int rownum) throws SQLException {
		// TODO Auto-generated method stub
		BoardDTO dto = new BoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3),
				rs.getString(4), rs.getString(5), rs.getString(6));
		return dto;
	}

}
