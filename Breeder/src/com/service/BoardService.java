package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.BoardDTO;
import com.dto.PageDTO;

public class BoardService {

	//페이지
	public PageDTO page(int curPage){
		PageDTO dto = new PageDTO();
		List<BoardDTO> list = null;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		   //new RowBounds(시작, 갯수))
		int count = dto.getPerPage();	
		int skip = (curPage-1)*count;
        list =
		session.selectList("myboard.list", null,
				new RowBounds(skip, count));
			
			
		}finally {
			session.close();
		}
		
		//3가지 저장
		dto.setList(list);
		dto.setCurPage(curPage);
		dto.setTotalRecord(totalCount());
		return dto;
	}//end list()
	
	//전체 레코드 갯수
	public int totalCount(){
		int count = 0;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		 count = session.selectOne("myboard.totalCount");
		}finally {
			session.close();
		}
		return count;
	}//end totalCount
	
	
	
	
	public PageDTO search(int curPage, HashMap<String, String> map) {
		PageDTO dto = new PageDTO();
		List<BoardDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int count = dto.getPerPage();
			int skip = (curPage - 1) * count;
			list = session.selectList("myboard.search", map, new RowBounds(skip, count));
			for (BoardDTO boardDTO : list) {
				System.out.println(boardDTO);
			}
			} finally {
			session.close();
		}

		dto.setList(list);
		dto.setCurPage(curPage);
		dto.setTotalRecord(totalCount());
		return dto;
	}// end list()
	
	
	public PageDTO Hsearch(int curPage) {
		PageDTO dto = new PageDTO();
		List<BoardDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int count = dto.getPerPage();
			int skip = (curPage - 1) * count;
			list = session.selectList("myboard.Hsearch", new RowBounds(skip, count));
			for (BoardDTO boardDTO : list) {
				System.out.println(boardDTO);
			}
			} finally {
			session.close();
		}

		dto.setList(list);
		dto.setCurPage(curPage);
		dto.setTotalRecord(totalCount());
		return dto;
	}// end list()
	
	public PageDTO Jsearch(int curPage) {
		PageDTO dto = new PageDTO();
		List<BoardDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int count = dto.getPerPage();
			int skip = (curPage - 1) * count;
			list = session.selectList("myboard.Jsearch", new RowBounds(skip, count));
			for (BoardDTO boardDTO : list) {
				System.out.println(boardDTO);
			}
			} finally {
			session.close();
		}

		dto.setList(list);
		dto.setCurPage(curPage);
		dto.setTotalRecord(totalCount());
		return dto;
	}// end list()
	
	
	//삭제하기
		public void delete(String num){
			
			SqlSession session = 
					MySqlSessionFactory.getSession();
			try{
	        int n =  	
	    session.delete("myboard.delete", Integer.parseInt(num));
	        session.commit();
			}finally {
				session.close();
			}
		}//end delete
		
		
		
	//수정하기
	public void update(BoardDTO dto){
		
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
        int n =  	
      session.update("myboard.update", dto);
        session.commit();
		}finally {
			session.close();
		}
	}//end updated
	
	
	
	
	// 조회수 증가
	private void readCnt(String num){
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
        int n =  	
      session.update("myboard.readCnt", Integer.parseInt(num));
        session.commit();
		}finally {
			session.close();
		}
	}//end readCnt

	//글자세히 보기
	public BoardDTO retrieve(String num){
		//조회수 증가
		readCnt(num);
		SqlSession session = 
				MySqlSessionFactory.getSession();
		BoardDTO dto = null;
		try{
		  dto = 
	 session.selectOne("myboard.retrieve", Integer.parseInt(num));
		}finally {
			session.close();
		}
		return dto;
	}//end 
	
	
	
	
	
	//글쓰기
	public void write(BoardDTO dto){
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		 int n = session.insert("myboard.write", dto);
		 session.commit();
		}finally {
			session.close();
		}
	}//end write
	
	
	
	//목록보기
	public List<BoardDTO> list(){
		List<BoardDTO> list = null;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		  list = session.selectList("myboard.list");
		}finally {
			session.close();
		}
		return list;
	}//end list()
	
	
}//end 
