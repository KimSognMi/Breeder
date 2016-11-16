package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.MemberDTO;
import com.dto.MemberPetDTO;
import com.dto.MemberPetPageDTO;
import com.dto.MemberPetSearchDTO;
import com.dto.NoPetNoMapMemberDTO;
import com.exception.CommonException;

public class MemberService {

	
	
	
	public MemberPetPageDTO page(int curPage){
		MemberPetPageDTO dto = new MemberPetPageDTO();
		List<MemberPetDTO> list = null;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		   //new RowBounds(시작, 갯수))
		int count = dto.getPerPage();	
		int skip = (curPage-1)*count;
        list =
		session.selectList("member.mempetlist", null,
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
	
	
	public int totalCount(){
		int count = 0;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		 count = session.selectOne("member.totalCount");
		}finally {
			session.close();
		}
		return count;
	}//end totalCount
	
	// 회원등록
	public void addMember(MemberDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("member.addMember", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원등록 실패");
		} finally {
			session.close();
		}

	}// end addMember

	// 로그인
	public MemberDTO login(HashMap<String, String> map) throws CommonException {
		MemberDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("member.login", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("로그인 실패");
		} finally {
			session.close();
		}
		return dto;
	}

	
	

	
	
	
	

	public MemberDTO mypage(String userid) throws CommonException {
		MemberDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("member.mypage", userid);
			System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("mypage 실패");
		} finally {
			session.close();
		}
		return dto;
	}

	// 회원 수정
	public void updateMember(MemberDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("member.updateMember", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원수정 실패");
		} finally {
			session.close();
		}

	}
	
		// 회원 삭제

	public void deleteMember(String userid) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.delete("member.deleteMember", userid);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원삭제 실패");
		} finally {
			session.close();
		}

	}
	
	public MemberDTO nearmedog(String userid) throws CommonException {
		MemberDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		
		try {
			dto = session.selectOne("member.nearmedog", userid);
			System.out.println("!!!!!!!"+dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("nearmedog 실패");
		} finally {
			session.close();
		}
		return dto;
	}//end nearmedog
	
	public List<MemberDTO> list() {
		List<MemberDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("member.memlist");
		} finally {
			session.close();
		}
		return list;
	}// end list()
	
	// 같은 시 기준으로 검색 하여 맴버 가져오기
		public List<MemberPetSearchDTO> memberListByCity(String keyword, String p_gender, String p_type,String p_photo) {
			List<MemberPetSearchDTO> list = null;
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("p_gender", p_gender);
			map.put("p_type", p_type);

			SqlSession session = MySqlSessionFactory.getSession();
			try {
				list = session.selectList("member.memberListByCity", map);
				System.out.println(map);
			} finally {
				session.close();
			}
			return list;
		}// end list()
	
	
	public MemberPetPageDTO search(int curPage, HashMap<String, String> map) {
		MemberPetPageDTO dto = new MemberPetPageDTO();
		List<MemberPetDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int count = dto.getPerPage();
			int skip = (curPage - 1) * count;
			list = session.selectList("member.search", map, new RowBounds(skip, count));
			for (MemberPetDTO memberpetDTO : list) {
				System.out.println(memberpetDTO);
			}
			} finally {
			session.close();
		}

		dto.setList(list);
		dto.setCurPage(curPage);
		dto.setTotalRecord(totalCount());
		return dto;
	}// end list()
	
	public List<NoPetNoMapMemberDTO> nopetnomapmember(String keyword) {
		List<NoPetNoMapMemberDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("member.nopetnomapmember", keyword);
		} finally {
			session.close();
		}
		return list;
	}// end list()
	
}
