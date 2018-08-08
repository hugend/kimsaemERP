package board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardDAOImpl;
import board.dto.BoardDTO;
@Service("boardservice")
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAOImpl dao;
	
	@Override
	public int board_insert(BoardDTO dto) {
		// TODO Auto-generated method stub
		return dao.board_insert(dto);
	}

	@Override
	public List<BoardDTO> board_list() {
		// TODO Auto-generated method stub
		return dao.board_list();
	}

	@Override
	public BoardDTO board_read(int bo_no) {
		// TODO Auto-generated method stub
		return dao.board_read(bo_no);
	}

	@Override
	public int board_delete(int bo_no) {
		// TODO Auto-generated method stub
		return dao.board_delete(bo_no);
	}

	@Override
	public List<BoardDTO> board_divlist(String bo_div) {
		// TODO Auto-generated method stub
		return dao.board_divlist(bo_div);
	}

}
