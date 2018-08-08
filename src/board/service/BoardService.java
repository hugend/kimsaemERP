package board.service;

import java.util.ArrayList;
import java.util.List;

import board.dto.BoardDTO;

public interface BoardService {
	int board_insert(BoardDTO dto);
	List<BoardDTO> board_list();
	List<BoardDTO> board_divlist(String bo_div);
	BoardDTO board_read(int bo_no);
	int board_delete(int bo_no);
}
