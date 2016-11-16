package com.pet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.service.BoardService;
import com.service.CommentService;
import com.service.MemberService;
import com.service.PetService;
import com.service.RequestService;
import com.dto.ApplyPetDTO;
import com.dto.BoardDTO;
import com.dto.CommentDTO;
import com.dto.MemberDTO;
import com.dto.PetDTO;
import com.exception.CommonException;
import com.exception.PetException;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/RequestUpdateServlet")
public class RequestUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//나중에 필터로 설정하기
				request.setCharacterEncoding("UTF-8");
				
				
				String userid = request.getParameter("userid");
				String r_num = request.getParameter("r_num");
				String p_num = request.getParameter("p_num");
				String p_kkcnumber = request.getParameter("p_kkcnumber");
				String p_name = request.getParameter("p_name");
				String p_age = request.getParameter("p_age");
				String p_gender = request.getParameter("p_gender");
				String p_type = request.getParameter("p_type");
				String p_feature = request.getParameter("p_feature");
				String agree = request.getParameter("agree");
				String p_photo = request.getParameter("p_photo");
				String r_content = request.getParameter("r_content");
				String phone = request.getParameter("phone");
				
				
				ApplyPetDTO dto =
						new ApplyPetDTO();
				
				
				dto.setAgree(agree);
				dto.setP_age(Integer.parseInt(p_age));
				dto.setP_feature(p_feature);
				dto.setP_gender(p_gender);
				dto.setP_kkcnumber(p_kkcnumber);
				dto.setP_name(p_name);
				dto.setP_num(Integer.parseInt(p_num));
				dto.setP_photo(p_photo);
				dto.setP_type(p_type);
				dto.setPhone(phone);
				dto.setR_content(r_content);
				dto.setR_num(Integer.parseInt(r_num));
				dto.setUserid(userid);
				
				System.out.println("수정"+dto);
			    RequestService service =
			    		new RequestService();
			    String title="";
			    String target="";
			    try {
					service.updateRequest(dto);
					target = "AnswerPetServlet?r_num="+r_num;
					request.setAttribute("updateRequest", "정상적으로 수정되었습니다.");
				} catch (CommonException e) {
					title= e.getMessage();
					String link="MyPageServlet";
					target="error.jsp";
					request.setAttribute("title", title);
					request.setAttribute("link", link);
				}
				
				RequestDispatcher dis =
						request.getRequestDispatcher(target);
				dis.forward(request, response);
	}//end doGet

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		/* System.out.println("수정");
		PetDTO dto =new PetDTO();
		// request.setCharacterEncoding("UTF-8");   // multipart인 경우에는 무의미하다.


				 System.out.println("Content Type ="+request.getContentType());
				 System.out.println("theText ="+request.getParameter("theText"));
				 
				 
				 DiskFileItemFactory factory = new DiskFileItemFactory();

				// Configure a repository (to ensure a secure temp location is used)
			
				 ServletContext ctx =getServletContext();		
				File repository = (File) ctx.getAttribute("javax.servlet.context.tempdir"); // new File("c://temp") 임시파일 경로
				factory.setRepository(repository);

				
				 ServletFileUpload upload = new ServletFileUpload(factory);
			        // If file size exceeds, a FileUploadException will be thrown
				 upload.setSizeMax(1024*1024*5); //업로드 되는 전체 파일크기 제한
				 upload.setFileSizeMax(1024*1024*2); // 개별 파일의 max값 제한

			        List fileItems = null;
					try {
						fileItems = upload.parseRequest(request);
						System.out.println(">>>"+fileItems);
					} catch (FileUploadException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
			        Iterator<FileItem> itr = fileItems.iterator();
			        String fileName = null;
			        
			        while(itr.hasNext()) {
			          FileItem fi = itr.next();

			          if( !fi.isFormField() ) { // input type="file" 인 경우
			        	 String p_photo = fi.getName();
			        	 dto.setP_photo(p_photo);
			            System.out.println("\nNAME: "+fi.getName());
			            System.out.println("SIZE: "+fi.getSize());
			           
			            File fullFile  = new File(fi.getName());  
			        		//File fNew = new File(ctx.getRealPath("/"),fullFile.getName());
			            	 
			        	 *  톰캣 가상 경로 설정하기 META-INF/context.xml
			        	 * <Resources>
			        			<PreResources className="org.apache.catalina.webresources.DirResourceSet" base="c:/Temp/upload/" webAppMount="/images" />
			        		</Resources>
			        		
			        		*
			        		
			                File fNew = new File("c:/Temp/upload/",fullFile.getName());
			            System.out.println("fNew >> " + fNew.getPath());
			            System.out.println(fNew.getAbsolutePath());
			            try {
							fi.write(fNew);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
			          }else { // input type="file" 아닌 경우
			            System.out.println("Field ="+fi.getFieldName()+"\t"+fi.getString("UTF-8"));  // getString("UTF-8") 지정해야 한글처리 가능
			           if("userid".equals(fi.getFieldName())){
			            	dto.setUserid(fi.getString("UTF-8"));
			            }else if("p_kkcnumber".equals(fi.getFieldName())){
			            	dto.setP_kkcnumber(fi.getString("UTF-8"));
			            }else if("p_num".equals(fi.getFieldName())){
			            	dto.setP_num(Integer.parseInt(fi.getString("UTF-8")));
			            }else if("p_name".equals(fi.getFieldName())){
			            	dto.setP_name(fi.getString("UTF-8"));
			            }else if("p_age".equals(fi.getFieldName())){
			            	dto.setP_age(Integer.parseInt(fi.getString("UTF-8")));
			            }else if("p_gender".equals(fi.getFieldName())){
			            	dto.setP_gender(fi.getString("UTF-8"));
			            }else if("p_birth".equals(fi.getFieldName())){
			            	dto.setP_birth(fi.getString("UTF-8"));
			            }else if("p_type".equals(fi.getFieldName())){
			            	dto.setP_type(fi.getString("UTF-8"));
			            }else if("p_feature".equals(fi.getFieldName())){
			            	dto.setP_feature(fi.getString("UTF-8"));
			            } else if("mom_kkc".equals(fi.getFieldName())){
			            	dto.setMom_kkc(fi.getString("UTF-8")); 
			            }else if("papa_kkc".equals(fi.getFieldName())){
			            	dto.setPapa_kkc(fi.getString("UTF-8")); 
			            }
			            
			         
			          }
			        }//end while
				
			        System.out.println("수정"+dto);
			        
			        PetService service = new PetService();
					 String title="";
					    String target="";
					    try {   
							service.updatePet(dto);
							target = "MyPetListServlet";
							request.setAttribute("update", "정상적으로 수정되었습니다.");
						} catch (PetException e) {
							title= e.getMessage();
							String link="MyPetListServlet";
							target="error.jsp";
							request.setAttribute("title", title);
							request.setAttribute("link", link);
						}
						
						RequestDispatcher dis =
								request.getRequestDispatcher(target);
						dis.forward(request, response);
			        */
	
	}

}





