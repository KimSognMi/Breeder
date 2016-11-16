package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.ApplyPetDTO;
import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.dto.PetDTO;
import com.dto.RequestDTO;
import com.dto.RequestPetDTO;
import com.exception.CommonException;
import com.exception.PetException;

public class RequestService {

	public ApplyPetDTO mypage(String r_num) throws PetException {
		ApplyPetDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("request.mypage", r_num);
			System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new PetException("mypage 실패");
		} finally {
			session.close();
		}
		return dto;
	}
	
	public ApplyPetDTO yourpage(String r_num) throws PetException {
		ApplyPetDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			dto = session.selectOne("request.yourpage", r_num);
			System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new PetException("mypage 실패");
		} finally {
			session.close();
		}
		return dto;
	}
	
	
	public void updateRequest(ApplyPetDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("request.updateRequest", dto);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("신청확인 실패");
		} finally {
			session.close();
		}

	}
	
	//
	public void request(RequestDTO dto){
		System.out.println("requestDTO"+dto);
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		 int n = session.insert("request.request", dto);
		 session.commit();
		}
		finally {
			session.close();
		}
	}//end write
	
	//목록보기
	public List<RequestDTO> requestlist(String userid){
		List<RequestDTO> list = null;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		  list = session.selectList("request.requestlist",userid);
		}finally {
			session.close();
		}
		return list;
	}//end list()
	
	
	public List<RequestPetDTO> requestlist2(String requestid){
		
		List<RequestPetDTO> list = null;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		  list = session.selectList("request.requestlist2",requestid);
		  session.commit();
		}finally {
		
			session.close();
			
		}
		System.out.println("requestlist2"+list);
		return list;
	}//end list()
	
	
public List<RequestPetDTO> answer(String userid){
		
		List<RequestPetDTO> list = null;
		SqlSession session = 
				MySqlSessionFactory.getSession();
		try{
		  list = session.selectList("request.answer",userid);
		  session.commit();
		}finally {
		
			session.close();
			
		}
		System.out.println("answer"+list);
		return list;
	}//end list()
	

	public void delete(String r_num) throws PetException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.delete("request.delete", r_num);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new PetException("신청삭제 실패");
		} finally {
			session.close();
		}

	}
	
	
}//end 
