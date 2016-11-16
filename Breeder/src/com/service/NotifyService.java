package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;

import com.dto.NotifyDTO;
import com.dto.NotifyPageDTO;

import com.exception.CommonException;

public class NotifyService {

	
	
	
	public NotifyPageDTO page(int curPage){
		NotifyPageDTO dto = new NotifyPageDTO();
		List<NotifyDTO> list = null;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		   //new RowBounds(시작, 갯수))
		int count = dto.getPerPage();	
		int skip = (curPage-1)*count;
        list =
		session.selectList("notify.list", null,
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
		 count = session.selectOne("notify.totalCount");
		}finally {
			session.close();
		}
		return count;
	}//end totalCount
	
	// 회원등록
	public void addNotify(NotifyDTO dto) throws CommonException {
		System.out.println(dto);
		
		
		
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("notify.addNotify", dto);
			session.commit();
			notifyCount(dto.getUserid());
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("신고등록 실패");
		} finally {
			session.close();
		}

	}// end addMember

	
	private void notifyCount(String userid){
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
        int n =  session.update("notify.notifyCount", userid);
        session.commit();
		}finally {
			session.close();
		}
	}//end readCnt

	// 로그인
	public NotifyDTO login(HashMap<String, String> map) throws CommonException {
		NotifyDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("notify.login", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("로그인 실패");
		} finally {
			session.close();
		}
		return dto;
	}

	
	
	public List<NotifyDTO> list() {
		List<NotifyDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = session.selectList("notify.list");
		} finally {
			session.close();
		}
		return list;
	}// end list()
	
	
	
	
	
	
	
	
	
}
