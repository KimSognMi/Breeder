package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.CommentDTO;
import com.dto.CommentPageDTO;

public class CommentService {

	// 삭제하기
		public void delete(String commentNum) {

			SqlSession session = MySqlSessionFactory.getSession();
			try {
				int n = session.delete("comment_c.codelete", Integer.parseInt(commentNum));
				session.commit();
			} finally {
				session.close();
			}
		}// end delete

		// 수정하기
		public void update(CommentDTO dto) {

			SqlSession session = MySqlSessionFactory.getSession();
			try {
				int n = session.update("comment_c.coupdate", dto);
				session.commit();
			} finally {
				session.close();
			}
		}// end updated

		public CommentPageDTO page(int curPage) {
			CommentPageDTO dto = new CommentPageDTO();
			List<CommentDTO> colist = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				// new RowBounds(시작, 갯수))
				int count = dto.getPerPage();
				int skip = (curPage - 1) * count;
				colist = session.selectList("comment_c.colist", null, new RowBounds(skip, count));

			} finally {
				session.close();
			}

			// 3가지 저장
			dto.setList(colist);
			dto.setCurPage(curPage);
			dto.setTotalRecord(totalCount());
			return dto;
		}// end list()

		public int totalCount() {
			int count = 0;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				count = session.selectOne("comment_c.cototalCount");
			} finally {
				session.close();
			}
			return count;
		}// end totalCount

		// 글쓰기
		public void write(CommentDTO dto) {
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				int n = session.insert("comment_c.cowrite", dto);
				session.commit();
			} finally {
				session.close();
			}
		}// end write

		// 목록보기
		public List<CommentDTO> list(int num) {
			List<CommentDTO> colist = null;
			SqlSession session = MySqlSessionFactory.getSession();
			try {
				colist = session.selectList("comment_c.colist",num);
			} finally {
				session.close();
			}
		
			return colist;
		}// end list()
		// 글자세히 보기
		public CommentDTO retrieve(String commentNum) {

			HashMap<String, Integer> map = new HashMap<>();
			map.put("xxx", Integer.parseInt(commentNum));
			SqlSession session = MySqlSessionFactory.getSession();
			CommentDTO dto = null;
			try {
				dto = session.selectOne("comment_c.coretrieve", map);
			} finally {
				session.close();
			}
			return dto;
		}// end


}// end
