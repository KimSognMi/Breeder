package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.dto.PetDTO;
import com.dto.PetTreeDTO;
import com.exception.CommonException;
import com.exception.PetException;

public class PetService {
	
	// 회원등록
	public void addPet(PetDTO dto) throws CommonException {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("pet.addPet", dto); 
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원등록 실패");
		} finally {
			session.close();
		}

	}// end addMember

	
	//목록보기
			public List<PetDTO> list(String userid){
				List<PetDTO> list = null;
				SqlSession session = 
						MySqlSessionFactory.getSession();
				try{
				  list = session.selectList("pet.list",userid);
				}finally {
					session.close();
				}
				return list;
			}//end list()
			
			//목록보기
			public List<PetDTO> mlist(String userid){
				List<PetDTO> list = null;
				SqlSession session = 
						MySqlSessionFactory.getSession();
				try{
				  list = session.selectList("pet.mlist",userid);
				}finally {
					session.close();
				}
				return list;
			}//end list()
			
			
			public PetDTO mypage(String p_num) throws PetException {
				PetDTO dto = null;
				SqlSession session = MySqlSessionFactory.getSession();
				try {
					dto = session.selectOne("pet.mypage", p_num);
					System.out.println(dto);
				} catch (Exception e) {
					e.printStackTrace();
					throw new PetException("mypage 실패");
				} finally {
					session.close();
				}
				return dto;
			}
			
			public void updatePet(PetDTO dto) throws PetException {
				SqlSession session = MySqlSessionFactory.getSession();
				try {
					int n = session.update("pet.updatePet", dto);
					session.commit();

				} catch (Exception e) {
					e.printStackTrace();
					throw new PetException("펫수정 실패");
				} finally {
					session.close();
				}

			}
			
			
			public void delete(String p_num) throws PetException {
				SqlSession session = MySqlSessionFactory.getSession();
				try {
					int n = session.delete("pet.delete", p_num);
					session.commit();

				} catch (Exception e) {
					e.printStackTrace();
					throw new PetException("회원삭제 실패");
				} finally {
					session.close();
				}

			}
			public PetDTO petdetail(String userid){
				SqlSession session = MySqlSessionFactory.getSession();
				System.out.println("petdetail : Pet-Service");
				PetDTO dto = null;
				try{
					dto = session.selectOne("pet.petdetail", userid);
					
				}finally{
					session.close();
				}
				
		
				return dto;
			}
			
			
			public PetTreeDTO pettree(String p_num) throws PetException {
				PetTreeDTO dto = null;
				SqlSession session = MySqlSessionFactory.getSession();
				System.out.println("pettree : ");
				try {
					dto = session.selectOne("pet.pettree", p_num);
					System.out.println(dto);
				} catch (Exception e) {
					e.printStackTrace();
					throw new PetException("족보 실패");
				} finally {
					session.close();
				}
				return dto;
			}
	
}
